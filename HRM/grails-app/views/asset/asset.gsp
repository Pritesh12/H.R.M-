<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title><g:message code="menu.nav.hrm"/> | ${company.companyName} | <g:message code="menu.nav.assets"/></title>
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
    <div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;font-size:20px;font-family:Verdana ">${company.companyName} | Assets</h1></div>
    <div>
        <ul class="nav nav-tabs">
            <g:each in="${company.modules}" var="module">
                <g:if test="${module.moduleName.equals('GeoZone')}">
                    <g:each in="${module.menus.sort{it.orderBy}}" var="menu">
                        <g:if test="${menu.subMenus.sort{it.orderBy}}">
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">${menu.name} <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <g:each in="${menu.subMenus.sort{it.orderBy}}" var="subMenu">
                                        <li><g:link  params="[companyId:company.id]" url="${subMenu.link} ">${subMenu.name}</g:link></li>
                                    </g:each>
                                </ul>
                            </li>
                        </g:if>
                        <g:else>
                            <li><g:link class="home" url="${menu.link}">${menu.name}</g:link></li>
                        </g:else>
                    </g:each>
                </g:if>
            </g:each>
        </ul><br>
    </div>
    <div class="col-sm-12" style="padding: 0 0 0 0; background-color: #f28c38">
        <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyName&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Name</a></div>
        <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyName&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Type</a></div>
        <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyName&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Serial No.</a></div>
        <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyName&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Product ID</a></div>
        <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyName&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Issued To</a></div>
        <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyName&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Issue Date</a></div>
    </div>
    <g:form controller="asset" action="modifyAsset">
    <g:each in="${company.assets.sort{it.id}}" var="asset" status="i">
        <div class="col-sm-12" style="background-color: #f2f2f2; padding: 5px 0 5px 0; border:1px solid white">
            <div class="col-sm-2" style="padding-left:0px; padding-right:0px">
                <div class="col-sm-1" style=" padding: 0 0 0 10px"><input type="radio" name="id" value="${asset.id}"></div>
                <div class="col-sm-9" style=" padding: 0 0 0 15px">${asset.name}</div>
            </div>
            <div class="col-sm-2" style="padding: 0 0 0 5px">${asset.type}</div>
            <div class="col-sm-2" style="padding: 0 0 0 5px">${asset.serialNo}</div>
            <div class="col-sm-2" style="padding: 0 0 0 5px">${asset.productID}</div>
            <g:if test="${asset.employee != null}">
                <div class="col-sm-2" style="padding: 0 0 0 5px">${asset.employee.firstName}</div>
            </g:if>
            <g:else>
                <div class="col-sm-2" style="padding: 0 0 0 5px">None</div>
            </g:else>
            <div class="col-sm-2" style="padding: 0 0 0 5px">${asset.issueDate}</div>
        </div>
    </g:each>
        <div class="col-sm-12" style="padding-top: 10px">
            <input class="btn btn-warning" name="modify" type="submit" value="Edit">
            <input class="btn btn-danger" name="modify" type="submit" value="Delete">
        </div>
    </g:form>
</div>
</body>
</html>