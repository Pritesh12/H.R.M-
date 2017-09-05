package com.hrm

import com.invoice.Currency
import entity.Address
import entity.EventData
import entity.Geozone
import com.invoice.Client
import com.invoice.Invoice

class Company {

    static hasMany = [employees: Employee,
                      modules  : Module,
                      assets   : Asset,
                      holidays : Holiday,
                      addresses: Address,
                      events   : EventData,
                      clients  : Client,
                      invoices : Invoice]

//    Currency currency
    String companyName
    String taxId
    byte[] logo
    String companyStatus
    String registrationNo
    String email
    String phone
    String address
    String city
    String state
    String country
    Double leaveRate
    Double maxLeave
    String website
    Geozone geoZone
    String createdBy
    Date createdDate
    String modifiedBy
    Date modifiedDate
   // User user

    static constraints = {

//        currency nullable: true
        companyName nullable: true, blank: false
        taxId nullable: true, blank: false
        companyStatus nullable: true, blank: false
        logo(nullable:true, maxSize:1073741824)
        registrationNo nullable: true, blank: false
        email nullable: true, blank: false
        phone nullable: true, blank: false
        address nullable: true, blank: false
        city nullable: true, blank: false
        state nullable: true, blank: false
        country nullable: true, blank: false
        leaveRate nullable: true, blank: false
        maxLeave nullable: true, blank: false
        createdBy nullable: true, blank: false
        createdDate nullable: true, blank: false
        modifiedBy nullable: true, blank: false
        modifiedDate nullable: true, blank: false
        website nullable: true, blank: false
        geoZone nullable: true, blank: false
    }

    static mapping = {
        logo sqlType: "longblob"
    }
}
