package com.invoice

import com.hrm.Company
import com.hrm.Employee
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import java.text.SimpleDateFormat


@Secured('permitAll')
@Transactional(readOnly = true)
class InvoiceController {
    def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def invoice() {
        render view: 'template'
    }
    def displayLogo = {
        def invoice = Invoice.get(params.id)
        response.contentType = "image/jpeg"
        response.setContentType("application/pdf")
        response.contentLength = invoice?.logo.length
        response.outputStream.write(invoice?.logo)
    }
    def savePdf() {
        def singleInvoice = Invoice.findById(params.id)
        def item = Item.list()
        println("####### "+singleInvoice)
        def user = springSecurityService.currentUser.getUsername()
        def company = Employee.findByUsername(user).company
        def userCompanyName = company.companyName
        params.format = "pdf"
        if (params.format == "pdf") {
            render(filename: "Invoice ${singleInvoice.id}.pdf", view: "pdfdesign", model: [invoices : singleInvoice, user : userCompanyName, item : item] ,marginLeft : 20, marginTop : 20, marginBottom : 25, marginRight : 20, headerSpacing : 15)
        }else
            render view: "pdfdesign", model: [invoices: singleInvoice, user: userCompanyName, item: item]
    }
    def createInvoice(){
        def user = springSecurityService.currentUser
        def invoice = new Invoice(params)
        Tax tax = Tax.findByTaxName(params.taxName)
        def items = new Item(params)
        def amt = params.amount
        Integer a=0
        for(def amt1 :amt){
              a = a+Integer.parseInt(amt1)
        }
        items.tax = tax  // items.setTax(tax)
        if (!(params.client.equals("Select Client"))) {
            def client = Client.findByCompanyName(params.client)
            invoice.clientx  = client
        }else {
            def client = Client.findByCompanyName(params.companyName)
            invoice.clientx = client
        }
        if (params.itemName instanceof String == true) {
            def item = new Item()
            item.itemName= params.itemName
            item.price = Double.parseDouble(params.price)
            item.amount = Double.parseDouble(params.amount)
            item.quantity = Integer.parseInt(params.quantity)
            item.save(failOnError:true)
            invoice.addToItems(item)
        }
        if (params.itemName instanceof String[] == true) {
            for(int i = 0; i<params.itemName.size(); i++){
                def item = new Item()
                item.itemName = params.itemName[i]
                item.price = Double.parseDouble(params.price[i])
                item.amount = Double.parseDouble(params.amount[i])
                item.quantity = Integer.parseInt(params.quantity[i])
                item.save(failOnError:true)
                invoice.addToItems(item)
            }
        }
        def companyId = user.companyId
        def company = Company.findById(companyId)

        /*  Override client currency selection*/
        if(params.currencies){
            def currency = Currency.get(params.int('currencies'))
            println("*******************"+currency)
            client.currency = currency
            if(invoice.validate()){
                println("@@@@@@@@@@@@"+invoice.save())
            }else{
                println("@@@@@@@@@@@@"+invoice.errors)
            }
        }
        invoice.company = company // invoice.setCompany(company)
        invoice.save(flush: true)
    //    company.addToInvoices(invoice)
        def inid = invoice.getId()
        redirect(controller: "invoice", action: "savePdf", params: [id : inid, amount : a])
    }
    def showInvoice() {
        int autogenid = 0
        Byte[] logo = params.fileupload.getBytes()
        def user = springSecurityService.currentUser.getUsername()
        def company = Employee.findByUsername(user).company
        def date = new Date()
        def sdf = new SimpleDateFormat("yyyy-MM-dd")
        def todayDate = sdf.format(date)
        def invoiceCount = company.clients.invoices.size()
        println("fffffff"+invoiceCount)
        def currency = Currency.list();
        if(Invoice.findById(company.id) == null)
        {
            autogenid = 0 // saved
        }else
        {
            autogenid = ++autogenid
        }
        def logo1 = company.setLogo(logo) //saved
        company.save(flush: true)
        render view: 'invoice', model: [user : user, client : Client, company : company,logo : logo1, aid : invoiceCount, date:todayDate, currency : currency]
    }
}
