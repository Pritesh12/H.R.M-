<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">

    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title><g:message code="menu.nav.hrm"/> | ${companyName} | <g:message code="box.inner.fieldset.newEmployee"/></title>
    <g:javascript>
    var userCheck=true;
    var req = true;
    function act(){
        //Field Check---------------------
        if(document.getElementById('firstName').value == "" || document.getElementById('lastName').value == "" || document.getElementById('email').value == "" || document.getElementById('username').value == "" || document.getElementById('password').value == "" || document.getElementById('dob').value == ""){
            req = false;
            alert("Required fields are empty")
        }

        //Username check-------------------
        <g:each in="${users}" var="user" status="i">
            if(document.getElementById('username').value == "${user}"){
             userCheck=false;
          }
        </g:each>

        if(req){
            if(userCheck){
                document.getElementById("employeeForm").submit();
            }else {
                userCheck = true;
                alert("Username already exists")
            }
        }else {
            req=true;
        }
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
        <h1 style="text-align:left;font-size:20px;font-family:Verdana ">${companyName} | <g:message code="box.inner.fieldset.newEmployee"/></h1>
    </div>
    <div>
        <ul class="nav nav-tabs">
            <li><g:link class="home" controller="secure"><g:message code="menu.nav.home"/></g:link></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><g:message code="menu.nav.employee"/> <span class="caret"></span></a>
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
            <li><g:link class="home" controller="secure" action="geoZone"><g:message code="menu.nav.geozone"/></g:link></li>
        </ul>
        <br>
    </div>
    <div class="box, col-md-12" style="border-radius:5px; background-color: #f7f6f6; padding-top: 15px; padding-bottom: 15px">
        <div class="inner" style="font-size:20px;height: auto">
            <g:form name="employeeForm" url="[controller:'admin', action:'saveEmployee']">
                <fieldset><g:message code="box.inner.fieldset.employeeInfo"/></fieldset>
                <hr>
                <div class="col-md-12" style="padding: 10px 0 10px 0" >
                    <div class="col-md-6" style="padding: 5px" >
                        <div class="col-md-4" style="font-family:verdana;font-size:12px" >
                            <p style="padding-right:10px"><g:message code="default.attribute.firstName"/></p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="firstName" name="firstName" value="Example">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px"><g:message code="default.attribute.middleName"/></p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="middleName" name="middleName" value="">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px"><g:message code="default.attribute.lastName"/></p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="lastName" name="lastName" value="">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px"><g:message code="default.attribute.dob"/></p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="date" id="dob" name="dob" value="2017-01-02">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px"><g:message code="default.attribute.email0"/></p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="email" size="25" id="email" name="email" value="example.17@gmail.com">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px"><g:message code="default.attribute.phone"/></p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="phone" name="phone" value="453647XXXX">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px"><g:message code="default.attribute.age"/></p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="number" min="18" max="50" id="age" name="age" value="">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px"><g:message code="default.attribute.location"/></p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="location" name="location" value="Brookefield">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px"><g:message code="default.attribute.username"/></p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="text" size="25" id="username" name="username" value="">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px"><g:message code="default.attribute.password"/></p>
                        </div>
                        <div class="col-md-8">
                            <input class="inputStyle" type="password" size="25" id="password" name="password" value="1234">
                        </div>
                    </div>
                    <div class="col-md-6" style="padding: 5px">
                        <div class="col-md-4" style="font-family:verdana;font-size:12px;" >
                            <p style="padding-right:10px"><g:message code="default.dropdown.attribute.role"/></p>
                        </div>
                        <div class="col-md-8">
                            <select class="inputStyle" name="roleId">
                                <g:if test="${roles.size()>0}">
                                    <g:each in="${roles.sort{it.priority}}" var="role" status="i">
                                        <option value="${role.id}">${role.name}</option>
                                    </g:each>
                                </g:if>
                            </select>
                        </div>
                    </div>
                </div>
                <hr style="padding: 5px;margin: 0px">
                <button type="button" class="btn btn-success" name="create" onclick="act()"><g:message code="default.attribute.button"/></button>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>