package com.invoice

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class TaxController {
    def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def createTax(Tax tax) {
        tax.setTaxName(params.taxName)
        tax.setTaxRate(Integer.parseInt(params.taxRate))
        tax.save(flush: true)
        def user = springSecurityService.currentUser
        render view: "_tax", model: [tax : tax, user : user]
    }
}
