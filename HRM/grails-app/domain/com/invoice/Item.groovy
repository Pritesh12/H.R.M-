package com.invoice

class Item {

    String itemName
    int quantity
    Double price
    Double amount
    Double subTotal
    String itemdescription
    Tax tax

    static constraints = {

        amount(nullable:true, blank:true)
        subTotal(nullable:true, blank:false)
        itemdescription(nullable:true, blank:true)
        tax(nullable:true, blank:false)
        itemName(nullable:true, blank:false)
        quantity(nullable:true, blank:false)
        price(nullable:true, blank:false)

    }
}
