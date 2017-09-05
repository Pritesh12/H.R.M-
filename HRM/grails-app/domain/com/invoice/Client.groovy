package com.invoice

class Client {

    String companyName
    String customerEmail
    String phone
    String firstName
    String lastName
    //String currency
    String street
    String city
    String pincode
    String landMark
    String description
    String country
    String state
    String fax
    String website
    Currency currency

    static hasMany = [invoices : Invoice]


    static constraints = {

        currency nullable: true
        companyName(nullable:true, blank:true)
        customerEmail(nullable:true, blank:true)
        phone(nullable:true, blank:true)
        firstName(nullable:true, blank:true)
        lastName(nullable:true, blank:true)
//        currency(nullable:true, blank:true)
        street(nullable:true, blank:true)
        city(nullable:true, blank:true)
        pincode(nullable:true, blank:true)
        landMark(nullable:true, blank:true)
        description(nullable:true, blank:true)
        country(nullable:true, blank:true)
        state(nullable:true, blank:true)
        fax(nullable:true, blank:true)
        website(nullable:true, blank:true)

    }
}
