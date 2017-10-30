package com.hrm

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import org.springframework.context.MessageSource
import org.springframework.transaction.annotation.Propagation

@Secured('permitAll')
class SuperController {

    def testRole
    def testuser
    def springSecurityService
    def MessageSource messageSource

    //Company*****************************************************************************************************************
    def newCompany() {
        def name = springSecurityService.currentUser.getUsername()
        def mod = Module.list()
        def moduleNames = Module.list().moduleName
        def usernames = User.list().username
        def companyNames = Company.list().companyName
        render (view: 'newCompany', model:[username: name, modules: moduleNames, users:usernames, companies: companyNames])
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def saveCompany(Company company, Employee employee, User user){
        def name = springSecurityService.currentUser.getUsername()
        def date = new Date()

        //Company Save----------------------------
        company.setEmail(params.companyEmail)
        company.setPhone(params.companyPhone)
        company.setCreatedDate(date)
        company.setCreatedBy(name)
        if(!(params.data.equals(""))){
            String selectedModule = params.data
            String [] moduleNames = selectedModule.split(",")
            for(String moduleName : moduleNames){
                def module = Module.findByModuleName(moduleName)
                company.addToModules(module).save()
            }
        }

        //Employee save---------------------------
        employee.setEmail(params.employeeEmail)
        employee.setPhone(params.employeePhone)
        employee.setCreatedBy(name)
        employee.setCreatedDate(date)

        //Employee Role---------------------------
        employee.setRoleEmployee(RoleEmployee.findByAccessibility("high"))

        //Employee Leaves--------------------------
        EmployeeLeave employeeLeave = new EmployeeLeave(earnLeave: 0, usedLeave: 0, createdBy: name, createdDate: date)
        employeeLeave.save()
        employee.setEmployeeLeave(employeeLeave)
        employee.save()
        company.addToEmployees(employee)
        company.save(flush: true)

        //User Save--------------------------------
        testuser= user.save(failonError: true)
        testRole=  Role.findByAuthority('ROLE_ADMIN')
        UserRole.create(testuser,testRole)
        redirect(controller: 'secure', action: 'superAdmin')
    }

    def company(){
        def name = springSecurityService.currentUser.getUsername()
        def companyList = Company.list()
        render(view: 'company', model: [username: name, company: companyList])
    }

    def modifyCompany(Company companyObj){
        def name = springSecurityService.currentUser.getUsername()
        if(params.modify.equals("Show")){
            render(view: 'showCompany', model: [username: name, company: companyObj])
        }else if(params.modify.equals("Edit")){
            def moduleNames = Module.list().moduleName
            render(view: 'editCompany', model: [username: name, company: companyObj, module: moduleNames])
        }else if(params.modify.equals("Delete")){
            Iterator iter = companyObj.modules.sort().iterator()
            while (iter.hasNext()){
                def mod = iter.next()
                companyObj.removeFromModules(mod)
            }
            companyObj.delete(flush: true)
            redirect(controller: 'secure', action: 'superAdmin')
        }
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def updateCompany(Company company){
        company.setModifiedBy(springSecurityService.currentUser.getUsername())
        company.setModifiedDate(new Date())
        String []modNames = params.data.split(',')

        for(String mod : modNames){
            if(!(company.modules.moduleName.contains(mod))) {
                company.addToModules(Module.findByModuleName(mod))
        }}
        for(String mod : company.modules.moduleName){
            if(!(modNames.contains(mod))) {
                def module = Module.findByModuleName(mod)
                Iterator iter = company.modules.iterator()
                while(iter.hasNext()){
                    if(iter.next().equals(module)){
                        iter.remove()
                    }
                }
        }}
        redirect(controller: 'secure')
    }

    //******************** Menu **************************
    def menu(){
        def name = springSecurityService.currentUser.getUsername()
        def menus = Menu.list()
        render(view: 'menu', model: [username: name, menus : menus])
    }
    def addMenu(){
        def name = springSecurityService.currentUser.getUsername()
        def moduleObject = Module.findById(Integer.parseInt(params.id))
        println "!@!@!@!@!@!@!@" +moduleObject.moduleName+"%%%%%%%"+Integer.parseInt(params.id)
        render(view: 'addMenu', model: [username: name, module : moduleObject])
    }
    def saveEditModule(Module module){
        def name = springSecurityService.currentUser.getUsername()
        def moduleObject = Module.findById(Integer.parseInt(params.id))
        def limit = params.int('index')
        for (int i = 0; i < limit; i++) {
            Menu menu = new Menu()
            menu.setName(params["name${i}"])
            menu.setOrderBy(Integer.parseInt(params["serialNo${i}"]))
            menu.setLink(params["link${i}"])
            menu.module = moduleObject
            module.addToMenus(menu)
            menu.save()
        }
        redirect(controller: 'super', action: 'module')
//        render(view: 'module', model: [username: name, module: moduleObject])
    }

    // Delete selected menu
    def removeMenu() {
        def name = springSecurityService.currentUser.getUsername()
        def menuObject = Menu.findById(Integer.parseInt(params.id))
        def module = menuObject.module.moduleName
        def menus = Menu.list()
        def menuDelete = Menu.get(params.id)
        menuDelete.delete(flush: true)

        redirect(controller: 'super', action: 'editModule')

//        render(view: 'menu', model: [username : name, module : module, menu: menus])
    }
    def addSubMenu(Menu menu){
        def name = springSecurityService.currentUser.getUsername()
        render(view: 'subMenu', model: [username: name, menu: menu])
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def saveSubMenu(Menu menu){
        def name = springSecurityService.currentUser.getUsername()
        def limit = params.int('index')
        for(int i = 0; i < limit; i++){
            Menu submenu = new Menu()
            submenu.setName(params["name${i}"])
            submenu.setLink(params["link${i}"])
            submenu.setOrderBy(Integer.parseInt(params["serialNo${i}"]))
            menu.addToSubMenus(submenu)
            menu.validate()
            menu.save()
        }
        render(view: 'menu', model: [username: name, menu: menu])
    }

    // ********** Module **************
        def newModule(){
        def name = springSecurityService.currentUser.getUsername()
        render(view: 'newModule', model: [username:name])
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def saveModule(Module module){
        module.setCreatedBy(springSecurityService.currentUser.getUsername())
        module.setCreatedDate(new Date())
        module.save()
        def limit = params.int('index')
        for (int i = 0; i < limit; i++) {
            Menu menu = new Menu()
            menu.setName(params["name${i}"])
            menu.setOrderBy(Integer.parseInt(params["serialNo${i}"]))
            menu.setLink(params["link${i}"])
         //   menu.setModule(module)
            menu.module = module
            menu.save()
            module.addToMenus(menu)
        }
        redirect(controller: 'super', action: 'module')
    }

    def module(){
        def name = springSecurityService.currentUser.getUsername()
        def moduleList = Module.list()
        render(view: 'module', model: [username: name, module: moduleList])
    }

    def modifyModule(){
        def name = springSecurityService.currentUser.getUsername()
        def moduleObject = Module.findById(Integer.parseInt(params.id))

        //Module Edit-----------------------------------------------------------------------
        if(params.modify.equals("Edit")){
            def menuObject = Menu.list()
            def menu = ""
            for(def menuList : menuObject){
                 menu = menuList
            }
            render (view: 'editModule', model:[username: name, module: moduleObject, menu: menu])
        }//Module Delete--------------------------------------------------------------------
        else if(params.modify.equals("Delete")){
            def companyList = Company.list()
            for(Company company : companyList){
                def mod
                if((mod=company.modules.findAll{it.id == moduleObject.id}.getAt(0))){    //Retrieving specific module from company if present
                    company.removeFromModules(mod).save(flush: true)
                }
            }
            moduleObject.delete(flush: true)
            redirect(controller: 'super', action: 'module')
        }
    }

    def updateModule(Module module, Menu menu){
        module.setModifiedBy(springSecurityService.currentUser.getUsername())
        module.setModifiedDate(new Date())
        module.save(flush:true)
        redirect(controller: 'super', action: 'module')
    }

    //Role********************************************************************************************************************

    def newRole(){
        def name = springSecurityService.currentUser.getUsername()
        render(view: 'newRole', model: [username: name])
    }

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    def saveRole(RoleEmployee roleEmployee){
        roleEmployee.setCreatedBy(springSecurityService.currentUser.getUsername())
        roleEmployee.setCreatedDate(new Date())
        roleEmployee.save()
        redirect(controller: 'super', action: 'role')
    }

    def role(){
        def name = springSecurityService.currentUser.getUsername()
        def roleList = RoleEmployee.list()
        render(view: 'role', model: [username: name, role: roleList])
    }
}
