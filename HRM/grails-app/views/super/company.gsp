<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title><g:message code="menu.nav.hrm"/> | <g:message code="box.inner.fieldset.companyInfo"/></title>
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

<div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;font-size:20px;font-family:Verdana "><g:message code="box.inner.fieldset.companyInfo"/></h1></div>
<div>
    <ul class="nav nav-tabs">
        <li><g:link class="home" controller="secure" action="superAdmin"><g:message code="menu.nav.home"/></g:link></li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message code="menu.nav.company"/><span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link controller="super" action="newCompany"><g:message code="default.dropdown.attribute.addCompany"/></g:link></li>
                <li><g:link class="list" controller="super" action="company"><g:message code="default.dropdown.attribute.companyList"/></g:link></li>
            </ul>
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message code="menu.nav.module"/><span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link controller="super" action="newModule"><g:message code="default.dropdown.attribute.addModule"/></g:link></li>
                <li><g:link controller="super" action="module"><g:message code="default.dropdown.attribute.moduleList"/></g:link></li>
            </ul>
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message code="menu.nav.role"/><span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link controller="super" action="newRole"><g:message code="default.dropdown.attribute.addRole"/></g:link></li>
                <li><g:link controller="super" action="role"><g:message code="default.dropdown.attribute.roleList"/></g:link></li>
            </ul>
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message code="menu.nav.menu"/><span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><g:link controller="super" action="menu"><g:message code="default.dropdown.attribute.menuList"/></g:link></li>
            </ul>
        </li>
    </ul><br>
</div>
<div class="col-sm-12" style="padding: 0 0 0 0; background-color: #f28c38">
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyName&max=4&order=asc" style="color: #f2f2f2; text-decoration: none"><g:message code="default.attribute.companyName"/></a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=taxId&max=4&order=asc" style="color: #f2f2f2; text-decoration: none"><g:message code="default.attribute.taxId"/></a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyStatus&max=4&order=asc" style="color: #f2f2f2; text-decoration: none"><g:message code="default.attribute.companyStatus"/></a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=registrationNo&max=4&order=asc" style="color: #f2f2f2; text-decoration: none"><g:message code="default.attribute.registrationNo"/></a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=totalEmployee&max=4&order=asc" style="color: #f2f2f2; text-decoration: none"><g:message code="default.attribute.totalEmployee"/></a></div>
    <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=email&max=4&order=asc" style="color: #f2f2f2; text-decoration: none"><g:message code="default.attribute.email"/></a></div>

</div>
<g:form name="showForm" controller="super" action="modifyCompany">
    <g:each in="${company}" var="companyObj" status="i">
        <div class="col-sm-12" style="background-color: #f2f2f2; padding: 5px 0 5px 0; border:1px solid white">
            <div class="col-sm-2" style="padding-left:0px; padding-right:0px">
                <div class="col-sm-1" style=" padding: 0 0 0 10px"align="center"><input type="radio" id="ohrmList_chkSelectRecord_1" name="id" value="${companyObj.id}"></div>
                <div class="col-sm-9" style=" padding: 0 0 0 15px">${companyObj.companyName}</div>
            </div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${companyObj.taxId}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${companyObj.companyStatus}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${companyObj.registrationNo}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${companyObj.employees.size()}</div>
            <div class="col-sm-2" style="padding: 0 0 0 10px;">${companyObj.email}</div>
        </div>
    </g:each>

    <div class="top, col-sm-12" style="padding: 20px; background-color: white" align="center">
        <input type="submit" class="btn btn-success" name="modify" value="Show">
        <input type="submit" class="btn btn-warning" name="modify" value="Edit">
        <input type="submit" class="btn btn-danger"  name="modify" value="Delete">

    </div>
    </div>

</g:form>
</div>
</body>
</html>