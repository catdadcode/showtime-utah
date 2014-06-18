<%@ Register TagPrefix="cc1" Namespace="CustomControls" Assembly="CustomControls" %>
<%@ Page language="c#" Codebehind="Default.aspx.cs" AutoEventWireup="false" Inherits="Demo.DefaultPage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
  <head>
		<title>AjaxDropDownList Demo</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
  </head>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<cc1:ajaxdropdownlist id="ddlCustomers" style="Z-INDEX: 101; LEFT: 136px; POSITION: absolute; TOP: 24px"
				runat="server" DataValueField="VALUE" DataTextField="TEXT" LookupName="Customer" Width="176px"></cc1:ajaxdropdownlist><asp:label id="lblCustomers" style="Z-INDEX: 103; LEFT: 24px; POSITION: absolute; TOP: 24px"
				runat="server" Width="88px">Customers</asp:label><asp:label id="lblOrders" style="Z-INDEX: 101; LEFT: 24px; POSITION: absolute; TOP: 56px" runat="server"
				Width="96px">Orders</asp:label><asp:label id="lblProducts" style="Z-INDEX: 102; LEFT: 24px; POSITION: absolute; TOP: 88px"
				runat="server" Width="96px">Products</asp:label><cc1:ajaxdropdownlist id="ddlOrders" style="Z-INDEX: 105; LEFT: 136px; POSITION: absolute; TOP: 56px"
				runat="server" DataValueField="VALUE" DataTextField="TEXT" LookupName="Order" Width="176px"></cc1:ajaxdropdownlist><cc1:ajaxdropdownlist id="ddlProducts" style="Z-INDEX: 106; LEFT: 136px; POSITION: absolute; TOP: 88px"
				runat="server" DataValueField="VALUE" DataTextField="TEXT" LookupName="Product" Width="176px"></cc1:ajaxdropdownlist><asp:label id="lblCustomersResult" style="Z-INDEX: 104; LEFT: 432px; POSITION: absolute; TOP: 24px"
				runat="server"></asp:label><asp:label id="lblOrdersResult" style="Z-INDEX: 105; LEFT: 432px; POSITION: absolute; TOP: 56px"
				runat="server"></asp:label><asp:label id="lblProductsResult" style="Z-INDEX: 106; LEFT: 432px; POSITION: absolute; TOP: 88px"
				runat="server"></asp:label><asp:button id="btnSubmit" style="Z-INDEX: 107; LEFT: 16px; POSITION: absolute; TOP: 120px"
				runat="server" Text="Submit"></asp:button>
		</form></FORM>
	
<!-- Begin OrangeSoda Tracking Code --> 
<script language="javascript" type="text/javascript"> 
	var cid = 101600; 	// client identifier: must match cid provided by Orange Soda
	var amt = 0.00; 	// amount: optional value of conversion
	var qty = 0;		// quantity: optional quantity of items purchased/requested
	var t = 'h';		// type: 'h' for tracking; 'c' for conversion
	var tid = '';		// transaction id: optional id used by customer to identify the transaction
</script> 
<script type="text/javascript">
	var strProtocol = (document.location.protocol == "https:") ? "https://" : "http://";
	document.write(unescape("%3Cscript src='" + strProtocol + "otracking.com/js/Tracking.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<!-- End OrangeSoda Tracking Code -->

</body>
</html>
