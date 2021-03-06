<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>HRM | Edit Module</title>
</head>
<body>
<div class="col-md-12">
    <div class="col-md-12" style="background-color: white; padding:4px; padding-left: 0px; padding-right: 0px">
        <div class="col-md-10">
            <h2 style="text-align:left;color:darkorange;font-family: Verdana" >Human Resource Management </h2>
        </div>
        <div class="col-md-2" style="padding:20px;padding-bottom: 0px; height:100%; color: #666666" >
            Welcome ${username}<button class="btn btn-primary dropdown-toggle" style="border: 0px;color: black; background-color: white; padding-bottom: 3px; padding-top: 3px; padding-left: 6px;padding-right: 6px" type="button" data-toggle="dropdown">
            <span class="caret"></span></button>
            <ul class="dropdown-menu">
                <li><g:link controller="#" action="newCompPage" style="text-decoration: none">Profile</g:link></li>
                <li><g:link controller="#" action="newCompPage" style="text-decoration: none">Setting</g:link></li>
                <li><g:link controller="logout" style="text-decoration: none">Log Out</g:link></li>
            </ul>
        </div>
    </div>
    <div class="col-md-12" style="background-color: #f28c38; color: white ">
        <h1 style="text-align:left;font-size:20px;font-family:Verdana ">Edit ${module.moduleName}</h1></div>
    <div>
        <ul class="nav nav-tabs">
            <li><g:link class="home" controller="secure" action="superAdmin">Home</g:link></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Company<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="super" action="newCompany">Add Company</g:link></li>
                    <li><g:link class="list" controller="super" action="company">Company List</g:link></li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Module<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="super" action="newModule">Add Module</g:link></li>
                    <li><g:link controller="super" action="module">Module List</g:link></li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Role<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="super" action="newRole">Add Role</g:link></li>
                    <li><g:link controller="super" action="role">Role List</g:link></li>
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
    <div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 15px; padding-bottom: 15px">
        <div class="inner" style="font-size:20px;height: auto">
            <g:form name="updateForm" url="[controller:'super', action:'updateModule']">
                    <fieldset>Module Information</fieldset>
                <hr>
                <div class="col-md-12" style="padding: 10px 0 10px 0" >
                    <div class="col-md-6" style="padding: 5px" >
                        <div class="col-md-4" style="font-family:verdana;font-size:12px" >
                            <p style="padding-right:10px">Name*</p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" required name="moduleName" value="${module.moduleName}">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px">Type*</p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" required name="moduleType" value="${module.moduleType}">
                        </div>
                        </div>
                        <div class="col-md-12" style="padding: 5px">
                        <div class="col-md-1" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px;">Menus</p>
                        </div>
                         <div class="col-md-9" style="padding: 5px;">
                            <li class="dropdown">
                                <div class="col-md-12" style="background-color: white; padding: 10px;width: 100%">
                                    <g:if test="${module.menus.size()>0}">
                                        <g:each in="${module.menus.sort{it.orderBy}}" var="menu" status="i">
                                            <div class="col-md-4" style="">
                                                <button type="button" class="btn btn-warning,dropdown-toggle">${menu.name}&nbsp;&nbsp;<span><g:link controller="super" action="removeMenu" id="${menu.id}">x</g:link></span></button>
                                            </div>
                                        </g:each>
                                        </g:if>
                                    <g:else>
                                        <h6>Not Available.</h6>
                                    </g:else>
                                </div>
                            </li>
                         </div>
                            <div class="col-md-2" style="padding: 20px">
                                <g:link controller="super" action="addMenu" id="${module.id}"><button type="button" class="btn btn-success"><b>Add Menu</b></button></g:link>
                            </div>
                        </div>
                </div>
                <hr style="padding: 5px;margin: 0px">
%{--
                <input type="hidden" name="id" value="${module.id}">
                <input type="submit" class="btn btn-success" name="modify" value="Update">
--}%
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
