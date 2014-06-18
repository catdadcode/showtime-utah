<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div >
        <img src="Images/paypalimage.jpg"/>
    </div>
        <asp:Menu ID="Menu1" runat="server" Height="19px" Orientation="Horizontal" 
            Width="311px">
            <Items>
                <asp:MenuItem Text="Shows" Value="Shows">
                    <asp:MenuItem Text="New Show" Value="New Show"></asp:MenuItem>
                    <asp:MenuItem Text="Edit Show" Value="Edit Show"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="Meals" Value="Meals">
                    <asp:MenuItem NavigateUrl="~/Meal.aspx" Text="New Meal" Value="New Meal">
                    </asp:MenuItem>
                    <asp:MenuItem Text="Edit Meal" Value="Edit Meal"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="Desserts" Value="Desserts">
                    <asp:MenuItem NavigateUrl="~/Dessert.aspx" Text="New Meal" Value="New Meal">
                    </asp:MenuItem>
                    <asp:MenuItem Text="Edit Meal" Value="Edit Meal"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
        </asp:Menu>
    
    </div>
    </form>

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
