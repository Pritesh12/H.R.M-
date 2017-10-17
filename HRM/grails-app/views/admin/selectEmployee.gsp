<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title><g:message code="menu.nav.hrm"/> | ${company.companyName} | <g:message code="default.attribute.selectEmployee"/></title>

    <g:javascript>
        window.onload=function(){
        var k=0;
        }
        function fun() {
            <g:if test="${company.employees.size()>0}">
        <g:each var="i" in="${ (0..<company.employees.size()) }">
            if(document.getElementById('row${i}').checked == 1){
                        document.getElementById('role${i}').disabled = 0;
                    }else{
                        document.getElementById('role${i}').disabled = 1
                    }
        </g:each>
    </g:if>
        }
    </g:javascript>

</head>
<body>
<div class="col-md-12">
    <div class="col-md-12" style="background-color: white; padding:4px; padding-left: 0px; padding-right: 0px">
        <div class="col-md-10">
            <h2 style="text-align:left;color:darkorange;font-family: Verdana" ><g:message code="default.attribute.header.banner"/></h2>
        </div>
        <div class="col-md-2" style="padding:20px;padding-bottom: 0px; height:100%; color: #666666" >
            <g:message code="default.attribute.welcome"/> ${username}<button class="btn btn-primary dropdown-toggle" style="border: 0px;color: black; background-color: white; padding-bottom: 3px; padding-top: 3px; padding-left: 6px;padding-right: 6px" type="button" data-toggle="dropdown">
            <span class="caret"></span></button>
            <ul class="dropdown-menu">
                <li><g:link controller="#" action="newCompPage" style="text-decoration: none"><g:message code="default.attribute.profile"/></g:link></li>
                <li><g:link controller="#" action="newCompPage" style="text-decoration: none"><g:message code="default.attribute.setting"/></g:link></li>
                <li><g:link controller="logout" style="text-decoration: none"><g:message code="default.attribute.logout"/></g:link></li>
            </ul>
        </div>
    </div>

<div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;font-size:20px;font-family:Verdana "><g:message code="default.dropdown.attribute.roleAssign"/></h1></div>
<div>
    <ul class="nav nav-tabs">
        <li><g:link class="home" controller="secure"><g:message code="menu.nav.home"/></g:link></li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message code="menu.nav.employee"/><span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link controller="admin" action="newEmployee"><g:message code="default.dropdown.attribute.addEmployee"/></g:link></li>
                <li><g:link class="list" controller="admin" action="employee"><g:message code="default.dropdown.attribute.employeeList"/></g:link></li>
                <li><g:link class="list" controller="admin" action="roleAssign"><g:message code="default.dropdown.attribute.roleAssign"/></g:link></li>
            </ul>
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message code="menu.nav.holiday"/> <span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link controller="holiday" action="newHoliday"><g:message code="default.dropdown.attribute.addHoliday"/></g:link></li>
                <li><g:link class="list" controller="holiday" action="holiday"><g:message code="default.dropdown.attribute.holidayList"/></g:link></li>
            </ul>
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message code="menu.nav.asset"/><span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link controller="asset" action="newAsset"><g:message code="default.dropdown.attribute.addAsset"/></g:link></li>
                <li><g:link class="list" controller="asset" action="assets"><g:message code="default.dropdown.attribute.assets"/></g:link></li>
                <li><g:link class="list" controller="asset" action="assignAsset"><g:message code="default.dropdown.attribute.assignAsset"/></g:link></li>
            </ul>
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message code="menu.nav.geozone"/><span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link class="home" controller="geozone" action="form"><g:message code="default.dropdown.attribute.createGeozone"/></g:link></li>
                <li><g:link class="home" controller="secure" action="geoZone"><g:message code="default.dropdown.attribute.geozone"/></g:link></li>
            </ul>
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message code="menu.nav.invoice"/><span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link class="home" controller="invoice" action="invoice" ><g:message code="default.dropdown.attribute.createInvoice"/></g:link></li>
                <li><g:link class="home" ><g:message code="default.dropdown.attribute.invoices"/></g:link></li>
            </ul>
        </li>
    </ul><br>
</div><div class="col-sm-12" style="padding: 0 0 0 0; background-color: #f28c38">
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none"><g:message code="default.attribute.firstName0"/></a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none"><g:message code="default.attribute.lastName0"/></a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none"><g:message code="default.attribute.email"/></a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none"><g:message code="default.attribute.location"/></a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none"><g:message code="default.attribute.employeeId"/></a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="" style="color: #f2f2f2; text-decoration: none"><g:message code="default.dropdown.attribute.roleAssign"/></a></div>
</div>

%{-- Fetching employee information --}%
<g:form controller="admin"  action="selectAction">
    <g:each in="${company.employees}" var="employee" status="i">
        <div class="col-sm-12" style="background-color: #f2f2f2; padding: 5px 0 5px 0; border:1px solid white">
            <div class="col-sm-2" style="padding-left:0px; padding-right:0px">
                <div class="col-sm-1" style=" padding: 0 0 0 10px"align="center">
                    <input type="radio" id="row${i}" name="id" required value="${employee.id}" id="radioButton" onchange="fun()">
                </div>
                <div class="col-sm-9" style=" padding: 0 0 0 15px">${employee.firstName}</div>
            </div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.lastName}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.email}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.location}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.id}</div>
            <div class="col-sm-2" style="padding: 0 0 0 0px;">
                %{-- Select option to assign role--}%
                <g:select disabled="true" class="form-control" name="role${employee.id}" id="role${i}" from="${roles}" value="${employee.roleEmployee.name}" optionKey="name" optionValue="name"/>
            </div>
        </div>
    </g:each>
    <div class="top, col-sm-12" style="padding: 20px; background-color: white" align="center">
        <input type="submit" class="btn btn-success" name="modify" value="Save" >
        <input type="submit" class="btn btn-warning" name="modify" value="Show" >
    </div>

%{-- Pagination --}%
</g:form>
</div>

</body>
</html>