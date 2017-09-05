<%@ page import = "com.invoice.Item" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
    .bigHr {
        background-color: royalblue !important;
        color: royalblue!important;
        height: 25px !important;
        width: 100% !important;
    }
    .s{
        background-color: blue;
        color: black;
        height: 1px !important;
        width: 100% !important;
    }
    </style>
</head>
<body>
    <div class="col-lg-offset-1 col-lg-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-sm-10  ">
        <div class="container">
            <hr class="bigHr">
        </div>
<g:form>
    <g:each in="${invoices}" status="i" var="invoiceInstance">
    <div class="row container-fluid">
        <div class="col-sm-6 col-md-6 col-lg-6 col-xs-6 " >
         %{--  <h2>${user}</h2>
         --}%  <h2>List</h2>
            <h4>
                A
                B
                C
  %{--              ${invoiceInstance.company.country}
                ${invoiceInstance.company.state}
                ${invoiceInstance.company.website}
  --}%          </h4>
           <h4>
     %{--          ${invoiceInstance.company.city}
               ${invoiceInstance.company.address}
     --}%      </h4>

        </div>
        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-3 " align="right">
            <span class="property-value" aria-labelledby="logo-label">
                <img src="http://localhost:8080/invoice/"${createLink(action : 'displayLogo', id : invoiceInstance?.id)}" />
            </span>
        </div>
    </div>
    <br>
    <div class="row">
        <table style="width:100%">
            <tr>
                <th><h4>BILL TO</h4></th>
                <td><h4>Invoice #</h4> <td><h4>${fieldValue(bean : invoiceInstance ,field: "referenceNumber") }</h4></td>
            </td>
            </tr>
            <tr>
                <td>
                    <h4>
         %{--               ${invoiceInstance.clientx.country}
                        ${invoiceInstance.clientx.state}
                        ${invoiceInstance.clientx.city}
         --}%           </h4>
                    <h4>
             %{--           ${invoiceInstance.clientx.street}
                        ${invoiceInstance.clientx.pincode}
             --}%       </h4>
                </td>
            </td>
                <td><h4>Invoice Date</h4> <td> <h4> ${fieldValue(bean:invoiceInstance ,field: "invoiceDate") }</h4></td>
            </td>
            </tr>
%{--
            <tr>
                <td> <td> <h4>P.O#</h4> <td> <h4> ${fieldValue(bean:invoiceInstance ,field: "poNumber") }</h4></td>
            </td>
--}%
                <td></td>
            </tr>
            <tr>
                <td></td><td><h4>Due Date</h4><td> <h4> ${fieldValue(bean:invoiceInstance ,field: "dueDate") }</h4></td>
            </td>
            </tr>

        </table>

    <div><hr class="s"></div>
    <div class="row">
        <div class="col-sm-6 col-md-6 col-lg-6 col-xs-6 " align="left"> <h2>INVOICE TOTAL</h2></div>
        <div class="col-sm-6 col-md-6 col-lg-6 col-xs-6 " align="center"> <h1>$</h1></div>
    </div>
    <div><hr class="s"></div>
    <div class="row">

        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-3 "><h4>ITEM</h4></div>
        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-3 "><h4>UNIT PRICE</h4></div>
        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-3 "><h4 >QTY</h4></div>
        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-3  "><h4>AMOUNT</h4></div>
       %{-- <%if(item != null){
            for(com.invoice.Item items: item) {%>
        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-3 "><h5>${items.itemName}</h5></div>
        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-3 "><h5>${items.price}</h5></div>
        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-3 "><h5>${items.quantity}</h5></div>
        <div class="col-sm-3 col-md-3 col-lg-3 col-xs-3 "><h5>${items.amount}</h5></div>

        <%}}%>
   --}% </div>
        <div class="row">
            <div class="col-sm-3 col-md-3 col-lg-3 col-xs-3 col-lg-offset-9 col-md-offset-9 col-sm-offset-9 col-xs-offset-9"> </div>
        </div>

    <div class="row">
      <div class="col-sm-6 col-md-6 col-lg-6 col-xs-6 "><h4>Notes</h4></div>
   </div>
   <div class="row">
    <div class="col-sm-6 col-md-6 col-lg-6 col-xs-6"><h4>${fieldValue(bean : invoiceInstance ,field : "notes") }</h4></div>
</div>
    </g:each>
</g:form>
    <br>
    <div class=" ">
        <footer>
        </footer>
    </div>
    <hr class="bigHr">
</div>
</body>
</html>