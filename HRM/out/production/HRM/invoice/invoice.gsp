<html xmlns="http://www.w3.org/1999/html">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>
<g:javascript library="jquery"/>
</head>
<body ng-app="">
<g:render template="/common/header" />
            <div class="invoice-layout">
                <div class="col-sm-4">
                    <h1>New Invoice</h1>
                </div>
            </div>
            <br><br>
    <g:form name="new-invoice" url="[action:'createInvoice',controller:'Invoice']">
            <div class="invoice-layout">

                    <div>
                        <div class="panel-group">
                            <div class="panel panel-default" style="background-color: #b7bbb0">
                                <div class="panel-heading" style="background-color: #b7bbb0">
                                    <h3 class="panel-title">
                                        <a data-toggle="collapse" href="#head">Business Address and Contact Details, Title, Summary
                                            <span class="glyphicon glyphicon-chevron-down" style="float:right;" ></span></a>
                                    </h3>
                                </div>
                                <br>
                                <div id="head" class="panel-collapse collapse">
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                            <div class="row">
                                                <div class="col-xs-8 col-sm-6 col-md-6 col-lg-6 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                            <div class="row">
                                                <div class="form-group">
                                                    <div class="col-sm-10 col-md-10 col-lg-10 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
                                                        <input type="text" class="form-control" name="title" id="title" placeholder="Invoice Title" value="Invoice">
                                                    </div>
                                                </div>
                                               <br><br>
                                                <div class="form-group">
                                                    <div class="col-sm-10 col-md-10 col-lg-10 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
                                                        <input type="text" class="form-control" name="description" id="description" placeholder="Summary (e.g. project name, description of invoice)">
                                                    </div>
                                                </div>
                                            </div>
                                            <br>
                                            <div class="row text-right">
                                                <div class="form-group">
                                                    <div class="col-sm-10 col-md-10 col-lg-10 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
                                                        <p>${company.companyName}</p>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <div class="col-sm-10 col-md-10 col-lg-10 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                    <div class="col-sm-10 col-md-10 col-lg-10 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
                                                        <g:link>Edit Your Business Address and Contact Details</g:link>
                                                    </div>
                                                </div>
                                                <br>
                                            </div>
                                        </div>
\                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="invoice-content">
                        <div class="row content-layout">
                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <div>
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="margin-left: 90px;">
                                    <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#addcustomer">
                                        <span class="glyphicon glyphicon-plus-sign"></span> Add a Customer
                                    </button>
                                  <div>
                                        <div class="dropdown">
                                            <select class="btn btn-basic dropdown-toggle" id="selectClient" onchange= "savedClient(this)" name="client" data-toggle="dropdown" style="background-color: #e0f3fb">
                                                <option>Select Client</option>
                                                <g:each in="${company.clients.sort{it.companyName}}" var="temp" status="i">
                                                    <option value="${temp.currency.id}"  name="xyz">${temp.companyName}</option>
                                                </g:each>
                                            </select>
                                        </div>
                                        <div id="updateOrganiztionName"></div>
                                    </div>
                                </div>
                                <div id ="updateMe">
                                    <g:render template="/client/templeteids" />
                                </div>
                            </div>
                            </div>

                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                <div class="row text-right">
                                    <div class="form-group">
                                        <label class="control-label col-sm-3 col-md-3 col-lg-3 col-sm-offset-3 col-md-offset-3 col-lg-offset-3" for="referenceNumber">Invoice Number:</label>
                                        <div class="col-sm-5 col-md-5 col-lg-5 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
                                            <input type="text" class="form-control" name="referenceNumber" id="referenceNumber" value="${aid+1}">
                                        </div>
                                    </div>
                                    <br><br>
                                    <div class="form-group">
                                        <label class="control-label col-sm-3 col-md-3 col-lg-3 col-sm-offset-3 col-md-offset-3 col-lg-offset-3" for="invoiceDate">Invoice Date:</label>
                                        <div class="col-sm-5 col-md-5 col-lg-5 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
                                            <input type="date" class="form-control" name="invoiceDate" id="invoiceDate" value="${date}">
                                        </div>
                                    </div>
                                    <br><br>
                                    <div class="form-group">
                                        <label class="control-label col-sm-3 col-md-3 col-lg-3 col-sm-offset-3 col-md-offset-3 col-lg-offset-3" for="dueDate">Payment Due:</label>
                                        <div class="col-sm-5 col-md-5 col-lg-5  col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
                                            <input type="date" class="form-control" name="dueDate" id="dueDate" placeholder="" value="${date}">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-3 col-md-3 col-lg-3  col-sm-offset-6 col-md-offset-6 col-lg-offset-6">
                                            <h5>On Reciept</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-1 col-md-1 col-lg-1"></div>
                            <div class="col-sm-2 col-md-2 col-lg-2 item-edit">
                                <a data-toggle="modal" data-target="#edit-columns"><h4>Edit Columns</h4></a>
                            </div>
                        </div>
                        <div class="row item-strip">
                            <div class="" style="background-color: #4cae4c;">
                                <div class="col-sm-1 col-md-1 col-lg-1"></div>
                                <div class="col-sm-6 col-md-6 col-lg-6 item-input">
                                    <h3>Items</h3>
                                </div>
                                <div class="col-sm-1 col-md-1 col-lg-1 item-text">
                                    <h3>Quantity</h3>
                                </div>
                                <div class="col-sm-1 col-md-1 col-lg-1 item-text">
                                    <h3>Price</h3>
                                </div>
                                <div class="col-sm-2 col-md-2 col-lg-2 item-text">
                                    <h3>Amount</h3>
                                </div>
                            </div>
                        </div>

                        <div style="background-color: #e0f3fb" id="itemrow" name="shre">
                            <br>
                            <div class="row" >
                                <div class="col-sm-1 col-md-1 col-lg-1"></div>
                                <div class="col-sm-2 col-md-2 col-lg-2 item-input">
                                    <input type="text" class="form-control" name="itemName" id="item_name" placeholder="Enter Item Name">
                                </div>
                                <div class="col-sm-4 col-md-4 col-lg-4 item-input">
                                    <input type="text" class="form-control" name="itemdescription" id="item_desc" placeholder="Enter Item Description">
                                </div>
                                <div ng-app>
                                <div class="col-sm-1 col-md-1 col-lg-1 item-input">
                                    <input type="text" ng-model="first" class="form-control" name="quantity" id="item_quantity">
                                </div>
                                <div class="col-sm-1 col-md-1 col-lg-1 item-input">
                                    <input type="text" ng-model="second" class="form-control" name="price" id="item_price">
                                </div>
                                <div class="col-sm-2 col-md-2 col-lg-2">
                                    <input name="amount" class="form-control" id="0" value="{{first*second}}">
                                </div>
                                <div class="col-sm-4 col-md-4 col-lg-1">
                                    <button type="button" class="btn btn-danger" id="delbutton">Delete</button>
                                </div>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-sm-7 col-md-7 col-lg-7"></div>
                                <div class="col-sm-7 col-md-7 col-lg-7 text-right" >
                                    <label class="control-label" style="margin-right: 10px; font-size: 17px">Tax</label>
                                </div>
                                <div class="col-sm-3 col-md-3 col-lg-3 ">
%{--
                                    <a data-toggle="modal" data-target="#tax">
--}%
                                        <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#tax">
                                            <span class="glyphicon glyphicon-plus-sign"></span> Add Tax
                                        </button>
%{--
                                        <input type="text" class="form-control" name="tax" id="" placeholder="" style="background-color: red">
                                    </a>
--}%
                                    <div id="updateMe1">
                                        <g:render template="/tax/tax" />
                                    </div>
                                </div>
                            </div>
                            <br>
                        </div>
                        <div class="row">
                            <div class="row" style="padding: 8px 36px 0px 0;float: right">
                                <button type="button" class="btn btn-info" id="addmorebutton">Add an Item</button>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-7 col-md-7 col-lg-7"></div>
                            <div class="col-sm-2 col-md-2 col-lg-2 text-right" style="padding:0 0 4px 100px;">
                                <h4>Subtotal</h4>
                            </div>
                        <div class="row" style="padding: 10px 100px 0 0;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        ${currency.get(0).symbol} 100.00
                        </div>
                            <div class="col-sm-9 col-md-9 col-lg-9 text-right">
                                <label class="control-label" style="margin-right: 20px; font-size: 15px">TOTAL</label>
                                <g:select class="btn btn-basic dropdown-toggle" id="invoiceCurrency" onchange="savedCurrency(this)" style="padding: 8px 0 8px 0; background-color: #e0f3fb" name="currencies" from="${currency}" optionKey="id" optionValue="${{it.name +' - '+it.code}}">
                                </g:select>
                                <div id="updateCurrencyName"></div>
                                <div id ="updateMe">
                                    <g:render template="/client/templeteids" />
                                </div>
                            </div>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            ${currency.get(0).symbol} 100.00
                            <br><br>
                            <div class="row">
                            </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-5 col-md-5 col-lg-5  col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
                                <label class="control-label" for="notes">NOTES</label><br>
                                <g:textArea rows="4" cols="50" class="note-text" name="notes" id="notes" placeholder="Enter notes here"></g:textArea>
                            </div>
                        </div>
                        <br><br>
                    </div>
                    <br>
                    <div >
                        <div class="panel-group">
                            <div class="panel panel-default" style="background-color: #b7bbb0">
                                <div class="panel-heading" style="background-color: #b7bbb0">
                                    <h3 class="panel-title">
                                        <a data-toggle="collapse" href="#foot">FOOTER<span class="glyphicon glyphicon-chevron-down" style="float:right;" ></span></a>
                                    </h3>
                                </div>
                                <br>
                                <div id="foot" class="panel-collapse collapse">
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-sm-10 col-md-10 col-lg-10 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
                                                <g:textArea rows="6" cols="120" class="note-text" name="footer" id="notes" placeholder="Enter regards"></g:textArea>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="invoice-layout">
                        <div class="col-sm-4">

                        </div>
                        <div class="col-lg-offset-5 col-sm-3 text-right">
                            <a href="/invoice/invoice">
                                <button type="button" class="btn btn-warning">New Invoice</button>
                            </a>
                            <button class="btn btn-success">Save and Genrate PDF</button>
                        </div>
                    </div>
    </g:form>
<br><br>
    <div class="modal fade" id="edit-columns" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style=" background-color: #f2f2f2">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h2 class="modal-title text-center">Customize this Invoice</h2>
                </div>
                <div class="modal-body" style="background-color: #e6e6e6
                ">
                    <form action="/login/authenticate" method="post" class="form-horizontal" >
                        <input type='hidden' name='spring-security-redirect'
                               value='/secure'/>
                        <div>  <h4 class="wv-form-legend">Edit the titles of the columns on this invoice:</h4>
                        </div>
                        <div>  <h4 style="">Items</h4>
                            <label class="radio">
                                <input type="radio" style=" transform: scale(1.25); margin-left: 1cm;" name="optradio"> <p style="margin-left: 1.5cm;" > Items <p style="color: silver"></p></input>
                            </label>
                            <label class="radio" >
                                <input type="radio" style="transform: scale(1.25);margin-left: 1cm" name="optradio"><p style="margin-left: 1.5cm">Products</p> </input>
                            </label>
                            <label class="radio" >
                                <input type="radio" style="transform: scale(1.25) ;margin-left: 1cm" name="optradio"><p style="margin-left: 1.5cm"> Services</p></h4></input>
                            </label>
                            <div class="row">
                                <div class="col-sm-6 col-md-6 col-lg-6">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-6 col-lg-6">
                                            <label class="radio" >
                                                <input type="radio" style="transform: scale(1.25);margin-left: 1cm" name="optradio"> <p style="margin-left: 1.5cm">Others</p></input>
                                            </label>
                                        </div>
                                        <div class="col-sm-6 col-md-6 col-lg-6" >
                                            <label> <input type="text" style=" width:80%;" name="others"/></label>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <hr>
                        <div>  <h4 style="">Unit</h4>
                            <label class="radio">
                                <input type="radio" style=" transform: scale(1.25); margin-left: 1cm;" name="optradio"> <p style="margin-left: 1.5cm;">Quantity</p></input>
                            </label>
                            <label class="radio" >
                                <input type="radio" style="transform: scale(1.25);margin-left: 1cm" name="optradio"><p style="margin-left: 1.5cm">Hours</p> </input>
                            </label>
                            <div class="row">
                                <div class="col-sm-6 col-md-6 col-lg-6">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-6 col-lg-6">
                                            <label class="radio" >
                                                <input type="radio" style="transform: scale(1.25);margin-left: 1cm" name="optradio"> <p style="margin-left: 1.5cm">Others</p></input>
                                            </label>
                                        </div>
                                        <div class="col-sm-6 col-md-6 col-lg-6" >
                                            <label> <input type="text" style=" width:80%"; name="others"/></label>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <hr>
                        <div>  <h4 style="">Price</h4>
                            <label class="radio">
                                <input type="radio" style=" transform: scale(1.25); margin-left: 1cm;" name="optradio"> <p style="margin-left: 1.5cm;">Price</p></input>
                            </label>
                            <label class="radio" >
                                <input type="radio" style="transform: scale(1.25);margin-left: 1cm" name="optradio"><p style="margin-left: 1.5cm">Rate</p> </input>
                            </label>
                            <div class="row">
                                <div class="col-sm-6 col-md-6 col-lg-6">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-6 col-lg-6">
                                            <label class="radio" >
                                                <input type="radio" style="transform: scale(1.25);margin-left: 1cm" name="optradio"> <p style="margin-left: 1.5cm">Others</p></input>
                                            </label>
                                        </div>
                                        <div class="col-sm-6 col-md-6 col-lg-6" >
                                            <label> <input type="text"  style=" width:80%" ; name="others"/></label>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <hr>
                        <div>  <h4 style="">Amount</h4>
                            <label class="radio">
                                <input type="radio" style=" transform: scale(1.25); margin-left: 1cm;" name="optradio"> <p style="margin-left: 1.5cm;">Amount</p></input>
                            </label>
                            <div class="row">
                                <div class="col-sm-6 col-md-6 col-lg-6">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-6 col-lg-6">
                                            <label class="radio" >
                                                <input type="radio" style="transform: scale(1.25);margin-left: 1cm" name="optradio"> <p style="margin-left: 1.5cm">Others</p></input>
                                            </label>
                                        </div>
                                        <div class="col-sm-6 col-md-6 col-lg-6" >
                                            <label> <input type="text" style=" width:80%" name="others"/></label>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <p style="font-size:22px; font-weight:300;">Hide columns:</p>
                            </div>
                            <div class="col-sm-8 col-md-8 col-lg-8">
                                <div class="row">
                                    <div class="col-sm-6 col-md-6 col-lg-6">
                                        <label class="checkbox">
                                            <input type="checkbox" value="" >Hide Item Name
                                        </label>
                                    </div>
                                    <div class="col-sm-6 col-md-6 col-lg-6">
                                        <label class="checkbox">
                                            <input type="checkbox" value="" >Hide Item Description
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <h6 >Your invoice must show at least one of the above.</h6>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4"> </div>
                            <div class="col-sm-8 col-md-8 col-lg-8">
                                <label class="checkbox">
                                    <input type="checkbox" value="">Hide Units
                                </label>
                                <label class="checkbox">
                                    <input type="checkbox" value="">Hide Price
                                </label>
                                <label class="checkbox">
                                    <input type="checkbox" value="">Hide Amounts
                                </label>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-4 col-md-4 col-lg-4"></div>
                            <div class="col-sm-8 col-md-8 col-lg-8">
                                <label class="checkbox">
                                    <input type="checkbox" value=""> <p>Apply these settings for all future invoices.</p>
                                    <h6> You can change these anytime from Invoice Customization settings.</h6>
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer" style="background-color:#f2f2f2">
                    <button type="button" class="btn btn-primary" >Save</button>
                    <button type="button" class="btn btn-default">Cancel</button>
                </div>
            </div>

        </div>
    </div>
    <div id="tax" name="taxname" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <g:formRemote name="myForm" on404="alert('not found!')" update="updateMe1"
              url="[controller: 'Tax', action:'createTax']">

            <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row">
                            <div class=" col-sm-3 col-md-3 col-lg-3"></div>
                            <div class="col-sm-9 col-md-9 col-lg-9">
                                <div class="form-group">
                                    <label >Tax Name:</label>
                                    <input type="text" name="taxName"class="form-control" style="width:60% " id="taxname">
                                </div>
                                <div class="form-group">
                                    <label >Tax Rate:</label>
                                    <input type="number" name="taxRate" placeholder="e.g: 3%" class="form-control" style=" width: 60%" id="taxrate">
                                </div>
                                <div class="form-group">
                                    <label >Tax Number / ID:</label>
                                    <input type="text" name="taxId"class="form-control" style="width:60% " id="taxid">
                                </div>
                            </div>
                        </div>
                        <div class="row" name="taxes">
                            <div class=" col-sm-4 col-md-4 col-lg-4"></div>
                            <div class="col-sm-8 col-md-8 col-lg-8">
                                <label class="checkbox">
                                    <input style=" transform: scale(1.2)" type="checkbox" value=""><h5> Show Tax number on Invoice</h5>
                                </label>
                                <label class="checkbox">
                                    <input style=" transform: scale(1.2)" type="checkbox" value=""><p> This is a recoverable tax</p>
                                    <h5> A tax is recoverable if you can deduct the tax that you've paid from the tax that you have collected.<a href="#">Learn More</a></h5>
                                </label>
                                <label class="checkbox">
                                    <input style=" transform: scale(1.2)" type="checkbox" value=""><p> This is a compound tax</p>
                                    <h5> A compound tax, or stacked tax, is calculated on top of a primary tax.<a href="#">Learn More</a></h5>
                                </label>
                            </div>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-default">Save</button>
                </div>
                </div>
            </g:formRemote>
        </div>
    </div>

   <!-- Modal -->
    <div class="modal fade" id="addcustomer" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <div class="container">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#contact">Contact</a></li>
                            <li><a data-toggle="tab" href="#billing">Billing</a></li>
                            <li><a data-toggle="tab" href="#more">More</a></li>
                        </ul>
                        <br>
                    </div>
                </div>
                <br>
                <div>
                    <g:formRemote name="myForm" on404="alert('not found!')" update="updateMe"
                                  url="[controller: 'Client', action:'createClient']">
                        <div class="row">
                            <div class="col-xs-offset-1 col-sm-offset-1 col-md-offset-1 col-lg-offset-1 col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                <div class="tab-content">
                                    <div id="contact" class="tab-pane fade in active">
                                        <label>Company
                                            <input type="text" name="companyName" style=" position: relative; left: 33px;" placeholder="Business or person">
                                        </label><br><br>
                                        <label>Email
                                            <input type="text" name="email" style=" position: relative;left: 60px;">
                                        </label><br><br>
                                        <label>Phone
                                            <input type="text" name="phoneNumber" style=" position: relative;left: 52px;">
                                        </label><br><br>
                                        <label>Contact
                                            <input type="text" name="mobileNumber" style=" position: relative;left: 43px;" >
                                        </label><br><br>
                                        <label>FirstName
                                            <input type="text" name="firstName" style=" position: relative;left: 26px;">
                                        </label><br><br>
                                        <label>LastName
                                            <input type="text" name="lastName" style=" position: relative;left: 29px;">
                                        </label>
                                      </div>
                                    <div id="billing" class="tab-pane fade">
                                        <div class="row" >
                                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                                <label style="font-weight: bold">Currency</label>
                                            </div>
                                            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                                <div class="dropdown">
                                                    %{--onchange="clientCurr(this)"--}%
                                                    <g:select name="currency" id="clientCurrency" style="padding: 2px 0 5px 0" from="${currency}" optionKey="id" optionValue="${{it.name +' - '+it.code}}">
                                                    </g:select>
                                                </div>
                                            </div>
                                     </div>
                        <br>
                        <div class="row" >
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"><label>Street</label></div>
                            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8"><input type="text" name="street"> </div>
                        </div>
                        <br>
                        <div class="row" >
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"><label>City </label></div>
                            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8"><input type="text" name="city"> </div>
                        </div>
                        <br>
                        <div class="row" >
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"><label>Postal/ZIP code </label></div>
                            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8"><input type="text" name="pincode"> </div>
                        </div>
                        <br>
                        <div class="row" >
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"><label>Landmark </label></div>
                            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8"><input type="text" name="landMark"> </div>
                        </div>
                        <br>
                        <div class="row" >
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"><label>Description </label></div>
                            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8"><input type="text" name="description"> </div>
                        </div>
                        <br>
                        <div class="row" >
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                <label style="font-weight: bold">Country</label>
                            </div>
                            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                <div class="dropdown">
                                    <input type="text" name="country" id="menu1">
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="row" >
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                <label style="font-weight: bold">State/Province</label>
                            </div>
                            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                <div class="dropdown">
                                    <input type="text" name="state" id="menu1">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="more" class="tab-pane fade">
                        <div class="row" >
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"><label>Fax</label></div>
                            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8"><input type="text" name="fax"> </div>
                        </div><br>
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4"><label>Website</label></div>
                            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8"><input type="text" name="website"> </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
%{--               <button type="button" name="update" value="Update" class="btn btn-default" data-dismiss="modal">Update</button>
--}%               <g:submitButton name="update" value="Update" class="btn btn-default" />
                        </div>
                    </g:formRemote>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>

</div>

</body>
<script>
    $(document).ready(function(){
        $("#delbutton").click(function(){
            alert("delete button - 2")
            var x =document.getElementsByName('shre')
            if(x.length>1){
            $("#itemrow").remove();}
        });
    });
        $(document).ready(function() {
            $("#addmorebutton").click(function() {
                $('#itemrow').clone(true).insertAfter("#itemrow");
                alert("Add Item")
            })
        });

        $('#selectClient').change(function () {
            var selectClientCurrency = $(this).val()
            $('#invoiceCurrency').val(selectClientCurrency)

        })

 /*   function savedClient(selectedVal){
        var clientid=selectedVal.value;
        alert("saved client!"+clientid)
        $.ajax({
            url: "${request.contextPath}/clientx/createClient/",
            update:updateMe,
            data : {
                client:clientid
                       },
            success : function(data) {
                $("#updateOrganiztionName").html(data);
            }
        });
    }
*/
$('#clientCurrency').change(function () {
    var test = $(this).val()
    $('#invoiceCurrency').val(test);

    $.ajax({
        url:'${request.contextPath}/clientx/createClient/',
        update:updateMe,
        data: {
            currency:test,
                  },
        success: function (data) {
            $(' #invoiceCurrency').html(data);
        }
    });

});
    function savedCurrency(selectedVal){
        var currencyId = selectedVal.value;
        $.ajax({
            url: "${request.contextPath}/clientx/createClient/",
            update:updateMe,
            data : {
                currency : currencyId
                       },
            success : function(data) {
                $("#updateCurrencyName").html(data);
            }
        });
    }
    function savedItem(selectedVal) {
        var itemid = selectedVal.value;
        $.ajax({
            url: "{request.contextPath}/item/saveItem/",
            update: updateYou,
            data: {
                itemx: itemid
            },
            success: function (itemx) {
                  alert("done")
                $("#updateItemName").html(itemx);
            }
        });
    }
</script>
</html>
