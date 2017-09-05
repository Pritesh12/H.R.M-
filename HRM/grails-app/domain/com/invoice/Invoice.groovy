package com.invoice

import com.hrm.Company

class Invoice {

    String title
    int referenceNumber
    String dueDate
    String invoiceDate
    String description
    String notes
    String footer
    Client clientx
    Company company
   // Currency currency

    static hasMany = [items : Item]

    static constraints = {

        dueDate(nullable: true)
        invoiceDate(nullable: true)
        description(nullable: true)
        notes(nullable: true)
        referenceNumber(unique: true)
        footer(nullable: true)

    }

    @Override
    public String toString() {
        return "Invoice{" +
                "id=" + id +
                ", version=" + version +
                ", items=" + items +
                ", title='" + title + '\'' +
                ", referenceNumber=" + referenceNumber +
                ", dueDate='" + dueDate + '\'' +
                ", invoiceDate='" + invoiceDate + '\'' +
                ", description='" + description + '\'' +
                ", notes='" + notes + '\'' +
                ", footer='" + footer + '\'' +
                ", clientx=" + clientx +
                ", company=" + company +
                '}';
    }
}
