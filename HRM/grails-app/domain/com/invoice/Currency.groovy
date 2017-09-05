package com.invoice

class Currency {

    String name
    String country
    String code
    String symbol

    static constraints = {

        name blank:false, unique: true
        country(nullable:true, blank:true)
        code(nullable:true, blank:true)
        symbol(nullable:true, blank:true)

    }
}
