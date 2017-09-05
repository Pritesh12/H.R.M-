
<p>Invoice created</p>
<g:form>
    <g:each in="${invoices}" status="i" var="invoiceInstance">
        ${fieldValue(bean: invoiceInstance,field: "clientx") }
    </g:each>
        <g:link controller="Invoice" action="savePdf" > <a href=" ${request.requestURI}.pdf" >Generate Pdf</a></g:link>
</g:form>
