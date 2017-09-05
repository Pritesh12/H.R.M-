package com.hrm

class Menu {

    static hasMany = [subMenus : Menu]
    static belongsTo = [module : Module, parentMenu : Menu]

    String name
    Integer orderBy
    String link

    static constraints = {
        name nullable: true, blank: false
        parentMenu nullable: true
        module nullable: true
        orderBy nullable: true, blank: false
        link nullable: true, blank: false
    }
}
