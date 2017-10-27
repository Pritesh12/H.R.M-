<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title><g:message code="menu.nav.hrm"/> | ${companyName} | <g:message code="default.dropdown.attribute.addHoliday"/></title>
    <g:javascript>
        var index =0;
        window.onload=function(){
            document.getElementById("save").style.display='none';
            document.getElementById("remove").style.display='none';
            for(var i=0;i<${limit};i++){
                document.getElementById("date"+i).style.display='none';
            }
        }
        function add() {
            document.getElementById("remove").style.display='block';
            document.getElementById("save").style.display='block';
            document.getElementById("date"+index).style.display='block';
            document.getElementById("holidayDate"+index).disabled=false;
            document.getElementById("title"+index).disabled=false;
            if(++index > 60){
                index = 60
            }
            document.getElementById('index').value=index
        }
        function remove() {
            if(--index <= 0 ){
                index = 0;
                document.getElementById("save").style.display='none';
                document.getElementById("remove").style.display='none';
            }
            document.getElementById("date"+index).style.display='none';
            document.getElementById("holidayDate"+index).disabled=true;
            document.getElementById("title"+index).disabled=true;
            document.getElementById("index").value = index;
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

    <div class="col-md-12" style="background-color: #f28c38; color: white ">
        <h1 style="text-align:left;font-size:20px;font-family:Verdana ">${companyName} | <g:message code="default.dropdown.attribute.addHoliday"/></h1></div>
    <div>
        <ul class="nav nav-tabs">

            <g:each in="${company.modules}" var="module">
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
            </g:each>
            %{--
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
                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message code="menu.nav.role"/><span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><g:link controller="admin" action="newRole"><g:message code="default.dropdown.attribute.addRole"/></g:link></li>
                    <li><g:link class="list" controller="admin" action="roles"><g:message code="default.dropdown.attribute.roles"/></g:link></li>
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
--}%
        </ul><br>
    </div>
    <div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 15px; padding-bottom: 15px">
        <div class="inner" style="font-size:20px;height: auto">
            <g:form name="holidayForm" url="[controller:'holiday', action:'saveHoliday']">
                <fieldset><g:message code="default.dropdown.attribute.addHolidays"/></fieldset>
                <hr>
                <div class="col-md-12" style="padding: 10px 0 10px 0" >
                    <g:each var="i" in="${ (0..<limit) }">
                        <div class="col-md-12" id="date${i}" >
                            <div class="col-md-4" style="padding: 5px" >
                                <div class="col-md-4" style="padding-left: 0px; padding-right: 0px;font-family:verdana;font-size:12px" >
                                    <p style="padding-right:10px"><g:message code="default.attribute.date"/></p>
                                </div>
                                <div class="col-md-8" style="padding-left: 0px; padding-right: 0px">
                                    <input class="inputStyle" type="date" id="holidayDate${i}" disabled required name="holidayDate${i}" >
                                </div>
                            </div>
                            <div class="col-md-4" style="padding: 5px">
                                <div class="col-md-4" style="padding-left: 0px; padding-right: 0px;font-family:verdana;font-size:12px;" >
                                    <p style="padding-right:10px"><g:message code="default.attribute.title0"/></p>
                                </div>
                                <div class="col-md-8" style="padding-left: 0px; padding-right: 0px">
                                    <input class="inputStyle" type="text" id="title${i}" disabled required name="title${i}" >
                                </div>
                            </div>
                        </div>
                    </g:each>
                    <button class="btn btn-success" type="button" style="margin-left:10px; font-size:30px; padding: 0 12px 0 12px; border-radius: 100px" onclick="add()"><g:message code="default.attribute.button.plus"/></button>
                    <button class="btn btn-danger" type="button" style="float:right; padding: 3px 8px 3px 8px" id="remove" onclick="remove()"><g:message code="default.attribute.button.remove"/></button>
                </div>
                <hr style="padding: 5px;margin: 0px">
                <input type="hidden" name="index" id="index">
                <div class="col-sm-10"><input type="submit" class="btn btn-success" id="save" name="submit" value="Save"></div>
                <div class="col-sm-2" align="right" style="float: right"><h6 style="color: #595959; font-size: 11px"><g:message code="default.attribute.maximum"/> ${limit}</h6></div>
            </g:form>
        </div>
    </div>
</div>
</div>
</body>
</html>