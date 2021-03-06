<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<asset:stylesheet src="loginStylesheet.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="Style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><g:message code="box.inner.fieldset.hrmLogin"/></title>
</head>
<body>
<div class="col-md-12" id="main_content" align="center">
    <div id="container">
        <h2><g:message code="box.inner.fieldset.login"/></h2>
        <form action="/login/authenticate" method="post" style="margin-bottom:30px">
            <input type='hidden' name='spring-security-redirect' value='/secure'>

            <input class="box" type="text" placeholder="Enter UserName" name="username"><br>
            <input class="box" type="password" placeholder="Enter Password" name="password"><br><br>
            <input style="align:left" type="checkbox" name="#" value="#"><g:message code="box.inner.fieldset.rememberMe"/><br><br>
            <input class="box" style="background-color:#ffad33" type="submit" value="LOGIN">
        </form>
        <a href="#" data-toggle="modal" data-target="#reset" style="text-decoration:none"><g:message code="box.inner.fieldset.troubleLogging"/></a><hr>
        <p><g:message code="box.inner.fieldset.dontHaveAccount"/><g:link controller="signUp" action="signUpPage"><g:message code="box.inner.fieldset.signUp"/></g:link>%{--<a href="#" data-toggle="modal" data-target="#signup" style="text-decoration:none">Sign Up</a>--}%</p>
    </div>
</div>
</body>
</body>
</html>

<div class="resetmodal">
    <!-- Trigger the modal with a button -->

    <!-- Modal -->
    <div class="modal fade" id="reset" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" align="center">
                    <button type="button" class="close" data-dismiss="modal" style="width: 4%">&times;</button>
                    <h2 class="modal-title"><g:message code="box.inner.fieldset.resetPassword"/></h2>
                </div>
                <div class="modal-body" align="center">
                    <form>
                        <input type="text" placeholder="Email Address" style="width:60%; margin:5px; padding:5px" required name="email">
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 10%;padding: 2px"><g:message code="box.inner.fieldset.close"/></button>
                </div>
            </div>

        </div>
    </div>

</div>
