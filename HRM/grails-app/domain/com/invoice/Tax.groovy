package com.invoice

class Tax {

    String taxName
    Double taxRate

    static constraints = {

        taxName(nullable:true, blank:true)
        taxRate(nullable:true, blank:true)
    }
}
