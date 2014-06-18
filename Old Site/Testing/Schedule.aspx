<%@ Page Language="C#" AutoEventWireup="true" Inherits="Schedule" Codebehind="Schedule.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Showtime Utah (Schedule)</title>
<!-- InstanceEndEditable -->
<style type="text/css">

</style>
<script type="text/javascript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
//-->
</script>
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<!-- InstanceBeginEditable name="head" -->

<!-- InstanceEndEditable -->
</head>

<body background="images/background2.jpg">
    <form id="form1" runat="server">
        
         
          <table width="600" height="205" border="0" align="center" cellpadding="0" cellspacing="0" 
                                id="sheduleDiv">
        <tr>
        <td>
            <asp:Repeater ID="rpShows" runat="server" >
                                <ItemTemplate>
                                <table>
                                    <tr>
                                        <td style="width:200px; text-align:left; color:Yellow; ">
                                            <a href="Transaction.aspx?ShowID=<%#DataBinder.Eval(Container, "DataItem.ShowID")%>" style="color:Yellow;"><asp:Label ID="lblShowDate" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Date","{0:d}")%>' /></a>
                                        </td>
                                       <td style="width:115px; text-align:right; color:ButtonFace;">
                                            <asp:Label ID="lblShow" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Music")%>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="color:Red;">
                                            <asp:Label ID="lblTickets" runat="server" Text='<%#GetAvailableTickets(DataBinder.Eval(Container,"DataItem.ShowID"))%>'/> 
                                        </td>
                                     
                                    </tr>
                                </table>
                                </ItemTemplate>
                           </asp:Repeater>
        </td>
        </tr>
          </table>
          <!-- InstanceEndEditable --></td>
        <td width="47">&nbsp;</td>
      </tr>
    </table>
      <table width="1000" height="30" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center">
            <p class="style8"><a href="index.html">Home</a> :: <a href="auditions.html">Entertainers</a> :: <a href="dinnerfare.html">Dinner Fare</a> :: <a href="pricing.html">Pricing </a>:: <a href="schedule.html">Show Schedule</a> :: <a href="concerts.html">Concerts</a> :: <a href="location.html">Location</a> :: <a href="aboutus.html">About Us</a> :: <a href="contact.html">Contact Us</a> :: <a href="concerts.html"></a></p>
            <p class="style8">&nbsp;</p>
          </div></td>
        </tr>
      </table></td>
  </tr>
</table>
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
