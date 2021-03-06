<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title><g:message code="menu.nav.hrm"/> | ${company.companyName} | <g:message code="menu.nav.home"/></title>
</head>
<body>
<div class="col-md-12">
    <div class="col-md-12" style="padding:4px; padding-left: 0px; padding-right: 0px">
        <div class="col-md-10">
            <h2 style="text-align:left;color:darkorange;font-family: Verdana" ><g:message code="default.attribute.header.banner"/></h2>
        </div>
        <div class="col-md-2" style="padding:20px;padding-bottom: 0px; height:100%; color: #666666" >
            <g:message code="default.attribute.welcome"/> ${username}<button class="btn btn-primary dropdown-toggle" style="border: 0px;color: black;background-color: white; padding: 3px 6px 3px 6px" type="button" data-toggle="dropdown">
            <span class="caret"></span></button>
            <ul class="dropdown-menu">
                <li><g:link controller="#" action="newCompPage" style="text-decoration: none"><g:message code="default.attribute.profile"/></g:link></li>
                <li><g:link controller="#" action="newCompPage" style="text-decoration: none"><g:message code="default.attribute.setting"/></g:link></li>
                <li><g:link controller="logout" style="text-decoration: none"><g:message code="default.attribute.logout"/></g:link></li>
            </ul>
        </div>
    </div>
    <div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;font-size:20px;font-family:Verdana ">${company.companyName}</h1></div>
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
    <div class="col-md-12" style="background-color: #f7f6f6; border-radius: 5px">
        <div class="col-md-12" style="padding:0 0 0 0" align="center">
            <div class="col-md-12" style="padding:0 0 0 0" align="left">
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px" ><g:message code="default.attribute.name"/></h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.companyName}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px"><g:message code="default.attribute.taxId"/></h4></div>
                    <div class="col-md-7" style="padding-top: 10px" >${company.taxId}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px"><g:message code="default.attribute.status"/></h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.companyStatus}</div>
                </div>
            </div>
            <div class="col-md-12" style="padding:0 0 0 0" align="left">
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px"><g:message code="default.attribute.totalEmployee"/></h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.employees.size()}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px"><g:message code="default.attribute.registrationNo"/></h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.registrationNo}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px"><g:message code="default.attribute.email"/></h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.email}</div>
                </div>
            </div>
            <div class="col-md-12" style="padding:0 0 0 0"align="left">
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px"><g:message code="default.attribute.phone"/></h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.phone}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px"><g:message code="default.attribute.address"/></h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.address}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5" ><h4 style="color: #666666; margin-bottom: 0px"><g:message code="default.attribute.city"/></h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.city}</div>
                </div>
            </div>
            <div class="col-md-12" style="padding:0 0 0 0"align="left">
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px"><g:message code="default.attribute.state"/></h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.state}</div>
                </div>
                <div class="col-md-4" style="padding-top: 10px">
                    <div class="col-md-5"><h4 style="color: #666666; margin-bottom: 0px"><g:message code="default.attribute.country"/></h4></div>
                    <div class="col-md-7" style="padding-top: 10px">${company.country}</div>
                </div>
            </div>
        </div>
        <div class="col-md-12" style="padding-bottom:10px" align="center">
            <hr>
            <h4 style="color: #2b406e"><g:message code="default.attribute.modules"/></h4><hr>
            <g:if test="${company.modules.size()>0}">
                <g:each in="${company.modules.moduleName}" var="moduleName" status="i">
                    <g:form controller="admin" action="module">
                        <input type="submit" name="module" value="${moduleName}" style="border: none; padding: 0 0 0 0;margin: 3px 0 3px 0; color:#204060; background-color: #f7f6f6;">
                    </g:form>
                </g:each>
            </g:if>
        </div>
    </div>
</div>
</body>
</html>
