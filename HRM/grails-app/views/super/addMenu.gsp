<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <g:javascript>
        var index = 0;
        window.onload=function(){
            document.getElementById("save").style.display='none';
            document.getElementById("remove").style.display='none';
            for(var i=0; i<=6; i++){
                document.getElementById("div"+i).style.display = 'none';
            }
        }
        function add() {
            document.getElementById("create").style.display='none';
            document.getElementById("save").style.display='block';
            document.getElementById("remove").style.display='block';
            document.getElementById("div"+index).style.display = 'block';
            document.getElementById("name"+index).disabled = false;
            document.getElementById("link"+index).disabled = false;
            document.getElementById("serialNo"+index).disabled = false;
            if(++index > 6){
                index = 6
            }
            document.getElementById("index").value = index;
        }
        function remove() {
            if(--index <= 0 ){
                index = 0;
                // document.getElementById("create").style.display='block';
                document.getElementById("save").style.display='none';
                document.getElementById("remove").style.display='none';
            }
            document.getElementById("div"+index).style.display = 'none';
            document.getElementById("name"+index).disabled = true;
            document.getElementById("link"+index).disabled = true;
            document.getElementById("serialNo"+index).disabled = true;
            document.getElementById("index").value = index;
        }
    </g:javascript>
    <title><g:message code="menu.nav.hrm"/> | <g:message code="default.dropdown.attribute.createModule"/></title>
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
    <div class="col-md-12" style="background-color: #f28c38; color: white ">
        <h1 style="text-align:left;font-size:20px;font-family:Verdana "><g:message code="box.inner.fieldset.newModule"/></h1></div>
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
    <div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 15px; padding-bottom: 15px">
        <div class="inner" style="font-size:20px;height: auto">
            <g:form name="moduleForm" url="[controller:'super', action:'saveEditModule']">
                <fieldset><g:message code="box.inner.fieldset.moduleInformation"/></fieldset>
                <hr>
                <div class="col-md-12" style="padding: 10px 0 10px 0" >
                    <div class="col-md-6" style="padding: 5px" >
                        <div class="col-md-4" style="font-family:verdana;font-size:12px" >
                            <p style="padding-right:10px"><g:message code="default.attribute.name0"/></p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" required name="moduleName" value="${module.moduleName}">
                            <g:hiddenField name="id" value="${module.id}"/>
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px"><g:message code="default.attribute.type"/></p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" required name="moduleType" value="${module.moduleType}">
                        </div>
                    </div>
                </div>
                <hr style="padding: 5px;margin: 0px">
                <input type="submit" class="btn btn-success" name="submit" id="create" value="Create">
                <fieldset style="padding-top: 10px"><g:message code="box.inner.fieldset.menuDetails"/></fieldset>
                <hr style="margin-bottom: 10px">
                <div class="col-md-12" style="padding: 0 0 10px 0" >
                    <g:each var="i" in="${(0..<6)}">
                        <div class="col-md-12" id="div${i}">
                            <div class="col-md-4" style="padding: 5px" >
                                <div class="col-md-4" style="padding-left: 0px; padding-right: 0px;font-family:verdana;font-size:12px" >
                                    <p style="padding-right:10px"><g:message code="default.attribute.name0"/></p>
                                </div>
                                <div class="col-md-8" style="padding-left: 0px; padding-right: 0px">
                                    <input class="inputStyle" required disabled id="name${i}" type="text" name="name${i}" >
                                </div>
                            </div>
                            <div class="col-md-4" style="padding: 5px" >
                                <div class="col-md-4" style="padding-left: 0px; padding-right: 0px;font-family:verdana;font-size:12px" >
                                    <p style="padding-right:10px"><g:message code="default.attribute.orderBy"/></p>
                                </div>
                                <div class="col-md-8" style="padding-left: 0px; padding-right: 0px">
                                    <input class="inputStyle" required disabled id="serialNo${i}" type="number" name="serialNo${i}" >
                                </div>
                            </div>
                            <div class="col-md-4" style="padding: 5px" >
                                <div class="col-md-4" style="padding-left: 0px; padding-right: 0px;font-family:verdana;font-size:12px" >
                                    <p style="padding-right:10px"><g:message code="default.attribute.link"/></p>
                                </div>
                                <div class="col-md-8" style="padding-left: 0px; padding-right: 0px">
                                    <input class="inputStyle" required disabled id="link${i}" type="text" name="link${i}" >
                                </div>
                            </div>
                        </div>
                    </g:each>
                    <button class="btn btn-success" type="button" style="margin-left:10px; font-size:30px; padding: 0 12px 0 12px; border-radius: 100px" onclick="add()"><g:message code="default.attribute.button.plus"/></button>
                    <button class="btn btn-danger" type="button" style="float:right; padding: 3px 8px 3px 8px" id="remove" onclick="remove()"><g:message code="default.attribute.button.remove"/></button>
                </div>
                <hr style="padding: 5px;margin: 0px">
                <input type="hidden" id="index" name="index">
                <div class="col-sm-10"><input type="submit" class="btn btn-success" id="save" name="submit" value="Save"></div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>