<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>${company.companyName} | <g:message code="menu.nav.home"/></title>
</head>
<body>
<script>
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
<div class="col-md-12">
    <div class="col-md-12" style="padding:4px; padding-left: 0px; padding-right: 0px">
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
    <div class="col-md-12" style="background-color: #f28c38; color: white "><h1 style="text-align:left;font-size:20px;font-family:Verdana ">${company.companyName}</h1></div>
    <ul class="nav nav-tabs">
        <g:each in="${company.modules}" var="module">
            <g:if test="${module.moduleName.equals('managerModule')}">
                <g:each in="${module.menus.sort{it.orderBy}}" var="menu">
                    <g:if test="${menu.name.equals('Leaves')}">
                        <g:if test="${leaveCount > 0}">
                            <li class="dropdown">
                                <g:link url="${menu.link}">
                                    ${menu.name}
                                    <span class="badge badge-notify" style="background-color: red; margin-bottom: 10px; padding-left: 5px; padding-right:6px">
                                        ${leaveCount}
                                    </span>
                                </g:link>
                                <ul class="dropdown-menu">
                                    <g:each in="${menu.subMenus.sort{it.orderBy}}" var="subMenu">
                                        <li><g:link  params="[companyId:company.id]" url="${subMenu.link} ">${subMenu.name}</g:link></li>
                                    </g:each>
                                </ul>
                            </li>
                        </g:if>
                        <g:else>
                            <li class="dropdown">
                                <g:link url="${menu.link}">
                                    ${menu.name}
                                </g:link>
                                <ul class="dropdown-menu">
                                    <g:each in="${menu.subMenus.sort{it.orderBy}}" var="subMenu">
                                        <li><g:link  params="[companyId:company.id]" url="${subMenu.link} ">${subMenu.name}</g:link></li>
                                    </g:each>
                                </ul>
                            </li>
                        </g:else>
                    </g:if>
                    <g:else>
                        <li class="dropdown">
                            <g:if test="${menu.subMenus}">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">${menu.name}<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <g:each in="${menu.subMenus.sort{it.orderBy}}" var="subMenu">
                                        <li><g:link url="${subMenu.link} ">${subMenu.name}</g:link></li>
                                    </g:each>
                                </ul>
                            </g:if>
                            <g:else>
                                <g:link url="${menu.link}">${menu.name} </g:link>
                            </g:else>
                        </li>
%{--
                            <li><g:link class="home" url="${menu.link}">${menu.name}</g:link></li>
--}%
                    </g:else>
                </g:each>
            </g:if>
        </g:each>
    </ul>
    <div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 15px; padding-bottom: 15px">
        <a href="#" data-toggle="tooltip" title="Company Information">
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Tap to view</button>
        </a>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Company Information</h4>
                    </div>
                    <div class="modal-body">
                        <div class="col-md-12" style="padding: 0px 0 10px 0" >
                            <div class="col-md-6" style="padding: 5px" >
                                <div class="col-md-4" style="font-family:verdana;font-size:12px" >
                                    <p style="padding-right:10px"><b><g:message code="default.attribute.name"/></b></p>
                                </div>
                                <div class="col-md-8">
                                    ${company.companyName}
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6" style="padding: 5px">
                            <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                                <p style="padding-right:10px"><b><g:message code="default.attribute.email"/></b></p>
                            </div>
                            <div class="col-md-8">
                                ${company.email}
                            </div>
                        </div>
                        <div class="col-md-12" style="padding: 10px 0 10px 0">
                            <div class="col-md-6"  style="padding: 5px">
                                <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                                    <p style="padding-right:10px"><b><g:message code="default.attribute.phone"/></b></p>
                                </div>
                                <div class="col-md-8">
                                    ${company.phone}
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12" style="padding: 10px 0 10px 0">
                            <div class="col-md-6"  style="padding: 5px">
                                <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                                    <p style="padding-right:10px"><b><g:message code="default.attribute.address"/></b></p>
                                </div>
                                <div class="col-md-8">
                                    ${company.address}
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12" style="padding: 10px 0 10px 0">
                            <div class="col-md-6"  style="padding: 5px">
                                <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                                    <p style="padding-right:10px"><b><g:message code="default.attribute.city"/></b></p>
                                </div>
                                <div class="col-md-8">
                                    ${company.city}
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12" style="padding: 10px 0 10px 0">
                            <div class="col-md-6"  style="padding: 5px">
                                <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                                    <p style="padding-right:10px"><b><g:message code="default.attribute.state"/></b></p>
                                </div>
                                <div class="col-md-8">
                                    ${company.state}
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12" style="padding: 10px 0 0px 0">
                            <div class="col-md-6"  style="padding: 5px">
                                <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                                    <p style="padding-right:10px"><b><g:message code="default.attribute.country"/></b></p>
                                </div>
                                <div class="col-md-8">
                                    ${company.country}
                                </div>
                            </div>
                        </div>
                        <div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 0px; padding-bottom: 0px">
                            <div class="inner" style="font-size:20px;height: auto;padding: 0 0 0 0">
                                <hr>
                                <fieldset><g:message code="menu.nav.employees"/></fieldset>
                                <hr>
                            </div>
                            <div class="col-sm-12" style="padding: 0 0 0 0; background-color: #f28c38">
                                <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyName&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">First Name</a></div>
                                <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyStatus&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Last Name</a></div>
                                <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=registrationNo&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Employee Id</a></div>
                                <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=taxId&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Email</a></div>
                                <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=totalEmployee&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Phone</a></div>
                                <div class="col-sm-2" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=email&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Location</a></div>
                            </div>
                            <g:each in="${manager.employees}" var="employee">
                                <div class="col-sm-12" style="background-color: #f2f2f2; padding: 5px 0 5px 0; border:1px solid white">
                                    <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.firstName}</div>
                                    <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.lastName}</div>
                                    <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.id}</div>
                                    <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.email}</div>
                                    <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.phone}</div>
                                    <div class="col-sm-2" style="padding: 0 0 0 10px;">${employee.location}</div>
                                </div>
                            </g:each>
                        </div>
                    <div class="modal-footer">
                    </div>
                </div>
</body>
</html>