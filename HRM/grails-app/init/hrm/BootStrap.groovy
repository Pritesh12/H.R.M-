package hrm

import com.hrm.Menu
import com.hrm.Module
import com.hrm.Role
import com.hrm.RoleEmployee
import com.hrm.User
import com.hrm.UserRole
import com.invoice.Currency
import grails.converters.JSON

class BootStrap {

    def init = { servletContext -> registerMarshallers()

        def adminRole = new Role(authority: 'ROLE_ADMIN').save()
        def testUser = new User(username: 'me', password: 'password').save()
        def superAdminRole  = new Role(authority: 'ROLE_SUPERADMIN').save()
        def employeeRole  = new Role(authority: 'ROLE_EMPLOYEE').save()
        def managerRole  = new Role(authority: 'ROLE_MANAGER').save()
        def moduleGeo = new Module(moduleName : "GeoZone" ,moduleType : "Bussiness").save()
        def moduleInv = new Module(moduleName : "Invoice" ,moduleType : "Bussiness").save()
        def moduleMar = new Module(moduleName : "Facebook" ,moduleType : "Social").save()
        def menu = new Menu(name : "Home" ,orderBy : "0").save()
       // def currencyInr = new Currency(name: "Indian Rupee", symbol: "INR", country: "India", code: "INR").save()
        def currencyInr = new Currency(name: "Indian Rupee", symbol: "INR", country: "India", code: "INR").save()
        def currencyAll = new Currency(name: "Albania Lek", symbol: "Lek", country: "Albania", code: "ALL").save()
        def currencyAfn = new Currency(name: "Afghanistan Afghani", symbol: "؋", country: "Afghanistan", code: "AFN").save()
        def currencyArs = new Currency(name: "Argentina Peso", symbol: "\$", country: "Argentina", code: "\tARS").save()
        def currencyAud = new Currency(name: "Australia Dollar", symbol: "\$", country: "Australia", code: "AUD").save()
        def currencyZwd = new Currency(name: "Zimbabwe Dollar", symbol: "Z\$", country: "Zimbabwe", code: "ZWD").save()
        def currencyYer = new Currency(name: "Yemen Rial", symbol: "؋", country: "Yemen", code: "YER").save()
        def currencyUsd = new Currency(name: "United States Dollar", symbol: "\$", country: "United States", code: "USD").save()
        def currencyGbp = new Currency(name: "United Kingdom Pound", symbol: "£", country: "United Kingdom", code: "GBP").save()
        def currencyUah = new Currency(name: "Ukraine Hryvnia", symbol: "₴", country: "Ukraine", code: "UAH").save()
        def currencyThb = new Currency(name: "Thailand Baht", symbol: "฿", country: "Thailand", code: "THB").save()
        def currencyLkr = new Currency(name: "Sri Lanka Rupee", symbol: "₨", country: "Sri Lanka", code: "LKR").save()
        def currencyChf = new Currency(name: "Switzerland Franc", symbol: "CHF", country: "Switzerland", code: "CHF").save()
        def currencyRub = new Currency(name: "Canada Dollar", symbol: "₽", country: "Canada", code: "RUB").save()
        def currencyCad = new Currency(name: "Afghanistan Afghani", symbol: "\$", country: "Afghanistan", code: "CAD").save()
        def currencybrl = new Currency(name: "Brazil Real", symbol: "R\$", country: "Brazil", code: "BRL").save()
        def currencyClp = new Currency(name: "Chile Peso", symbol: "\$", country: "Chile", code: "CLP").save()
        def currencyCrc = new Currency(name: "Costa Rica Colon", symbol: "₡", country: "Costa Rica", code: "\tCRC").save()

        UserRole.create testUser, adminRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }
    }
    private void registerMarshallers(){
        JSON.registerObjectMarshaller(User) {

            def map = [

                    'id'                        : it.id?:"",
                    'username'                  : it.username?:"",
                    'password'                  : it.password?:"",
            ]
            return map
        }

    }
}
