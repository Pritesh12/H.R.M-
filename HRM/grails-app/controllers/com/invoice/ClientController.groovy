package com.invoice

import com.hrm.Company
import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class ClientController {
    def springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def createClient(Client client) {
        def user = springSecurityService.currentUser
        client.setCompanyName(params.companyName)
        client.setCustomerEmail(params.customerEmail)
        client.setPhone(params.phone)
        client.setFirstName(params.firstName)
        client.setLastName(params.lastName)
        client.setStreet(params.street)
        client.setCity(params.city)
        client.setPhone(params.pincode)
        client.setLandMark(params.landMark)
        client.setDescription(params.description)
        client.setCountry(params.country)
        client.setState(params.state)
        client.setFax(params.fax)
        client.setWebsite(params.website)
        if(params.currency){
            def currency = Currency.findById(params.currency)
            client.currency = currency
            client.save(flush : true)
        }
        if (params.clientx != null) {
            def client1 = params.clientx
            def cle = Client.findByCompanyName(client1)
            render view: "_templeteids", model: [client: cle]
        } else {
            def userId = user.companyId
            def company = Company.findById(userId)
            def invoice = Invoice.list()
            client.addToInvoices(invoice)
            company.addToClients(client)
            company.save(flush: true, failOnError: true)
            render view: "_templeteids", model: [client: client]
        }
    }
}