<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <asset:stylesheet src="home_view_style.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="Stylesheet.css">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title><g:message code="menu.nav.hrm"/> | ${company.companyName} | <g:message code="menu.nav.holidays"/></title>
    <g:javascript>
        var length=${years.size()}
        window.onload=function(){
            for (j = 0; j < length; j++) {
                if(j != ${index}){
                    document.getElementById("holiday"+j).style.display='none';
                    document.getElementById("title"+j).style.display='none';
                }
            }
        }
        function show(index) {
            for (j = 0; j < length; j++) {
                document.getElementById("holiday"+j).style.display='none';
                document.getElementById("title"+j).style.display='none';
            }
            document.getElementById("title"+index).style.display='block';
            document.getElementById("holiday"+index).style.display='block';
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
        <g:each in="${years}" var="year" status="n">
            <h1 style="text-align:left;font-size:20px;font-family:Verdana" id="title${n}">${company.companyName} | <g:message code="menu.nav.holiday"/> | ${year}</h1>
        </g:each>

    </div>
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
    <div class="col-sm-12" style="padding: 0 0 0 0; background-color: #f2f2f2">
        <ul class="nav nav-tabs">
            <g:each in="${years}" var="year" status="i">
                <li><a class="dropdown-toggle" data-toggle="dropdown" id="${i}" onclick="show(this.id);" href="">${year}</a></li>
            </g:each>

        </ul>
    </div>
    <div class="col-sm-12" style="padding: 0 0 0 0; background-color: #f28c38">
        <div class="col-sm-4" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyName&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Date</a></div>
        <div class="col-sm-4" style="border:1px solid white; padding: 10px"><a href="/secure/superAdmin?sort=companyName&max=4&order=asc" style="color: #f2f2f2; text-decoration: none">Title</a></div>
    </div>

    <g:each in="${years}" var="year" status="i">
        <div id="holiday${i}">
            <g:each in="${company.holidays.sort{it.holidayDate}}" var="holiday" status="j">
                <g:if test="${year == holiday.year}">
                    <div class="col-sm-12" style="background-color: #f2f2f2; padding: 5px 0 5px 0; border:1px solid white">

                        <div class="col-sm-4" style="padding: 0 0 0 5px">${holiday.holidayDate}</div>
                        <div class="col-sm-4" style="padding: 0 0 0 5px">${holiday.title}</div>
                    </div>
                </g:if>
            </g:each>
            <g:form controller="holiday" action="editHoliday">
                <button class="btn btn-warning" type="submit" name="year" value="${year}">Edit</button>
            </g:form>
        </div>
    </g:each>
</div>
</body>
</html>