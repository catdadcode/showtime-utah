<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" ValidateRequest="false" 
    MaintainScrollPositionOnPostback="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Showtime Utah (Pricing)</title>
    <style type="text/css">
        
        .results 
        {
            border:medium solid #0000ff;	
        }
        
        .style8 {color: #666666}
        a:link {
	        color: #FF0000;
        }
        a:visited {
	        border: 0;
	        color: #FF0000;
        }
        .style9 {
	        color: #FFFFFF;
	        font-size: medium;
        }
        .style9 {color: #FFFFFF}
        .style13 {
	        font-size: medium;
	        color: #FFFFFF;
        }
        
        .white { color:#ffffff;}
        
        a:link {
	        color: #FF0000;
        }
        a:visited {
	        color: #FF0000;
        }
        .style15 {
	        color: #FFFF00;
	        font-size: x-large;
        }
        
        .left 
        {
        	text-align:left;
        }
        #additionalCoupons
        {
            width: 314px;
        }
        #DivAdditionalCertificates
        {
            width: 319px;
        }
    .style137 {	color: #0000FF;
	font-size: x-large;
}
        .style166
        {
            width: 754px;
        }
    .style16 {color: #0000FF}
    .style17 {color: #FFFF00}
    .style18 {color: #FF0000}
    .style19 {
	color: #FFFFFF;
	font-size: x-large;
}
    .style21 {
	color: #FFFF00;
	font-size: xx-large;
}
    .style22 {font-size: xx-large}
    .style24 {color: #FFFFFF; font-size: xx-large; }
    .style26 {
	color: #FF0000;
	font-size: x-large;
	font-weight: bold;
}
    .style27 {color: #FFFF00; font-style: italic; }
.style28 {color: #FFFF00; font-size: x-large; font-style: italic; }
    .style29 {color: #33FF33; font-size: x-large; }
.style31 {color: #996600; font-size: x-large; font-weight: bold; }
    .style32 {
	color: #FFCC00;
	font-size: x-large;
	font-weight: bold;
}
    .style33 {color: #66FFCC}
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
    <script src="https://www.showtimeutah.com/Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
</head>
    <body background="https://www.showtimeutah.com/images/background2.jpg" >
<table width="1000" height="708" border="0" align="center" cellpadding="0" cellspacing="0" style="background-image:url(https://www.showtimeutah.com/images/background.jpg);background-repeat:no-repeat;">
  <tr>
    <td width="891" height="700" align="center" valign="top"><table width="1000" height="677" border="0" cellpadding="0" cellspacing="5">
      <tr>
        <td width="69" height="677">&nbsp;</td>
        <td width="884" valign="top">
        
        <table width="981" height="237" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="197" colspan="9">&nbsp;</td>
          </tr>
            <tr bordercolor="#99FF00">
              <td width="116" height="40"><div align="center"><a href="http://www.showtimeutah.com/index.html"><img src="https://www.showtimeutah.com/Templates/homebutton.jpg" alt="Home" width="103" height="21" border="0" /></a></div></td>
              <td width="104"><div align="center"><a href="http://www.showtimeutah.com/auditions.html"><img src="https://www.showtimeutah.com/Templates/entertainersbutton.jpg" alt="Entertainmers" width="103" height="21" border="0" /></a></div></td>
              <td width="103"><div align="center"><a href="http://www.showtimeutah.com/dinnerfare.html"><img src="https://www.showtimeutah.com/Templates/menubutton.jpg" alt="Menu" width="103" height="21" border="0" /></a></div></td>
              <td width="103"><div align="center"><a href="http://www.showtimeutah.com/websiteorders/"><img src="https://www.showtimeutah.com/Templates/ticketsbutton.jpg" alt="Tickets" width="103" height="21" border="0" /></a></div></td>
              <td width="103"><div align="center"><a href="http://www.showtimeutah.com/schedule.html"><img src="https://www.showtimeutah.com/Templates/schedulebutton.jpg" alt="Schedule" width="103" height="21" border="0" /></a></div></td>
              <td width="103"><div align="center"><a href="http://www.showtimeutah.com/concerts.html"><img src="https://www.showtimeutah.com/Templates/concertsbutton.jpg" alt="Concerts" width="103" height="21" border="0" /></a></div></td>
            <td width="111"><div align="center"><a href="http://www.showtimeutah.com/location.html"><img src="https://www.showtimeutah.com/Templates/locationbutton.jpg" alt="Location" width="103" height="21" border="0" /></a></div></td>
            <td width="103"><div align="center"><a href="http://www.showtimeutah.com/aboutus.html"><img src="https://www.showtimeutah.com/Templates/aboutusbutton.jpg" alt="About Us" width="103" height="21" border="0" /></a></div></td>
            <td width="107"><div align="center"><a href="http://www.showtimeutah.com/contact.html"><img src="https://www.showtimeutah.com/Templates/contactbutton.jpg" alt="Contact Us" width="103" height="21" border="0" /></a></div></td>
            </tr>
            </table>
          <table width="776" height="345" border="10" align="center" cellpadding="20" cellspacing="0" bordercolor="#990000">
            <tr>
              <td nowrap="nowrap" bgcolor="#000000" class="style166" 
                    style="font-size: 1.2em" scope="col" filter:alpha(opacity=20)>              
              <p align="center" class="style9">Dinner includes 2 hours of live, rip-roaring, boot-stompin' entertainment, plus all the menu items on our <a href="http://www.showtimeutah.com/dinnerfare.html" target="_self">dinner fare</a> page.</p>
                <p align="center" class="style13">The dinner show is <span class="style15">$24.95</span> per person for adults,<span class="style15"> $9.95</span> for children under 12 plus tax.</p>
                <p align="left" class="style137 style18">DECEMBER Shows</p>
                <p align="left" class="style29">                  Saturday, Dec 13th – No Show<br />
                  Friday, Dec 19th – Dyer Highway<br />
                  Saturday, Dec 20th – Dyer Highway<br />
                  Friday, Dec 26th – NO SHOW<br />
                  Saturday, Dec 27th – Dyer Highway</p>
                <p align="left"><span class="style27">Wednesday, Dec 31st - New Year's Eve Party<br />
                  Spend your New Year’s Eve with us! Join Comedic Hypnotist/Imaginist </span><span class="style17"><br />
                  <span class="style32">Trayce Waterlyn</span></span><span class="style27"> as he brings in the new year! <br />
                  Tickets $10 - includes party favors CALL for reservations 801-636-9669</span></p>
                <p align="left" class="style26"><span class="style33">JANUARY Shows</span></p>
                <p align="left" class="style31">                  Friday, Jan 2nd - No Show - Winter Break<br />
                  Saturday, Jan 3rd - No Show - Winter Break<br />
                  Friday, Jan 9th - Sizzling Strings<br />
                  Saturday, Jan 10th - Sizzling Strings<br /> 
                  Friday, January 16th - Band TBD <br />
Saturday, January 17th - Band TBD  <br />
                </p>
                <p align="left" class="style32">CHECK BACK FOR CONTINUING SHOWS!</p>
                <p align="left" class="style27"><br />
                </p>
                <p class="style28"><strong><span class="style9" style="font-size: 1.2em">Purchase your tickets online for<br /> 
                  The Old West Dinner Adventure Show <br />
                  by using the form below</span></strong></p>
                <p><strong><span class="style9" style="font-size: 1.2em"> For your convenience we accept </span></strong></p>
                <ul>
                  <li><strong><span class="style9" style="font-size: 1.2em">Visa </span></strong></li>
                  <li><strong><span class="style9" style="font-size: 1.2em">Mastercard</span></strong></li>
                  <li><strong><span class="style9" style="font-size: 1.2em">American Express</span></strong></li>
                </ul>
                <p><strong><span class="style9" style="font-size: 1.2em"><br />
                   Or you can call 801-636-9669 for reservations </span></strong></p>
                <p><strong><span class="style9" style="font-size: 1.2em">&nbsp; </span></strong> <span class="style9"><br />
                  <strong style="font-size: 1.2em">When you call please have thefollowing information:</strong></span></p>
                <ul>
                  <li><span class="style9"><strong style="font-size: 1.2em">Number  of people in your group</strong></span></li>
                  <li><span class="style9"><strong style="font-size: 1.2em">Date you would like to attend </strong></span></li>
                  <li><span class="style9"><strong style="font-size: 1.2em">Your credit card information</strong></span></li>
                </ul>
                <p class="white" style="font-size: 1.2em">To redeem a vendor certificate or to 
                                            celebrate with a birthday certificate, please  call 801-636-9669 
                                            and will be happy to assist you.</p>
                
                
                
                
                
                
                <form runat="server" id="ticketSelect" method="post" style="text-align:left;padding-left:20px;border:thin solid #ffffff;">
                
                <!-- show list
                    
                    replace each ListItem Text and Value with the same date
                 -->
                    <br />
                    <asp:Label ID="LabelShow" Width="150px" runat="server" CssClass="white" 
                    Font-Size="Large">Show: </asp:Label>
                    <asp:DropDownList ID="DropDownListShow" runat="server" AutoPostBack="False" 
                    Font-Size="Large">
                                         
                      
                      <asp:ListItem Text="Friday December 19, 2008" Value="Friday December 19, 2008" />  
                      <asp:ListItem Text="Saturday December 20, 2008" Value="Saturday December 20, 2008" />                      <asp:ListItem Text="Saturday December 27, 2008" Value="Saturday December 27, 2008" />                      <asp:ListItem Text="Friday January 9, 2009" Value="Friday January 9, 2009" /> 
                      <asp:ListItem Text="Saturday January 10, 2009" Value="Saturday January 10, 2009" />                      <asp:ListItem Text="Friday January 16, 2009" Value="Friday January 16, 2009" />    
                      <asp:ListItem Text="Saturday January 17, 2009" Value="Saturday January 17, 2008" />         
                    </asp:DropDownList>
                    <br />
                    
                    <!-- end show list -->
                    
                    <asp:Label Width="150px" runat="server" CssClass="white" 
                    Font-Size="Large">Adult Tickets: </asp:Label>
                    <asp:DropDownList ID="adultTickets" runat="server" Font-Size="Large">                    </asp:DropDownList>
                    <br />
                    <asp:Label Width="150px" ID="Label1" runat="server" CssClass="white" 
                    Font-Size="Large">Child Tickets: </asp:Label>
                    <asp:DropDownList ID="DropDownListChildTickets" runat="server" Font-Size="Large" 
                         >                    </asp:DropDownList>
                    <br />
                    
                    <asp:Label Width="150px" ID="LabelCouponCode" runat="server" 
                    CssClass="white" Font-Size="Large">Coupon Code: </asp:Label>
                    <asp:TextBox runat="server" ID="TextBoxCoupon" Width="150" 
                    Font-Size="Large" />
                    
                    <br />
                <br />
                    
                    <asp:Button runat="server" ID="ButtonCalculateTotal" Text="Calculate Total" 
                    onclick="ButtonCalculateTotal_Click" Font-Size="Large" Height="41px" 
                    Width="221px" CausesValidation="False" />
                    
                    <br />
                    <br />
                    <asp:Label ID="LabelTotal" runat="server" CssClass="white" 
                    Font-Size="XX-Large"/>
                    
                    <br />
                    <br />
                    
                    <asp:Label Width="200" runat="server" ID="LabelName" Font-Size="Large" Text="First Name:" CssClass="white" />
                    <asp:TextBox Width="200" runat="server" ID="TextBoxFirstName" Font-Size="Large" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" 
                        ControlToValidate="TextBoxFirstName" Display="Dynamic"  Font-Size="Large"
                        ErrorMessage="Please Enter Your First Name."></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label Width="200" runat="server" ID="LabelLastName" Text="Last Name:" CssClass="white" Font-Size="Large" />
                    <asp:TextBox Width="200" runat="server" ID="TextBoxLastName" Font-Size="Large" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" Font-Size="Large" 
                        ControlToValidate="TextBoxLastName" Display="Dynamic" 
                        ErrorMessage="Please Enter Your Last Name."></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label Width="200" runat="server" ID="LabelEmail" Text="Email:" CssClass="white" Font-Size="Large" />
                    <asp:TextBox Width="200" runat="server" ID="TextBoxEmail" Font-Size="Large" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" Font-Size="Large"
                        ControlToValidate="TextBoxEmail" Display="Dynamic" 
                        ErrorMessage="Please Enter Your Email."></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label Width="200" runat="server" ID="LabelPhone" Text="Phone Number:" CssClass="white" Font-Size="Large"/>
                    <asp:TextBox Width="200" runat="server" ID="TextBoxPhoneNumber" Font-Size="Large"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhone" runat="server" Font-Size="Large"
                        ControlToValidate="TextBoxPhoneNumber" Display="Dynamic" 
                        ErrorMessage="Please Enter Your Phone Number."></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label Width="200" runat="server" ID="LabelZip" Text="Zip Code:" CssClass="white" Font-Size="Large"/>
                    <asp:TextBox Width="200" runat="server" ID="TextBoxZipCode" Font-Size="Large"
                    Height="22px" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorName1" runat="server" Font-Size="Large"
                        ControlToValidate="TextBoxZipCode" Display="Dynamic" 
                        ErrorMessage="Please Enter Your Zip Code."></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label Width="200" runat="server" ID="LabelCC" Text="Credit Card Number:" CssClass="white" Font-Size="Large"/>
                    <asp:TextBox Width="200" runat="server" ID="TextBoxCC" Font-Size="Large"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorName2" runat="server" Font-Size="Large"
                        ControlToValidate="TextBoxCC" Display="Dynamic" 
                        ErrorMessage="Please Enter Your Credit Card Number."></asp:RequiredFieldValidator>
                    <br />
                     <asp:Label Width="200" runat="server" ID="LabelExp" Text="Expiration Date:" CssClass="white" Font-Size="Large" />
                    <asp:DropDownList ID="DropDownListExpMonth" runat="server" Font-Size="Large" /> 
                    <asp:Label runat="server" ID="LabelDivider" Font-Size="Large" CssClass="white" Text="/" />
                    <asp:DropDownList ID="DropDownListExpYear" runat="server" Font-Size="Large" /> 
                    
                    <br />
                    <br />
                    <br />
                    
                    <asp:Label ID="LabelSpecialRequest" runat="server" Text="Special Comments And Requests:" CssClass="white" Font-Size="Large" /><br />
                    <asp:TextBox ID="TextBoxSpecialRequest" runat="server" Height="150px" 
                    TextMode="MultiLine" Width="650px" />
                    
                    <br />
                    <br />
                    <asp:Label ID="LabelParty" runat="server" Text="Seated With Another Party (Please Enter The Name of The Party):" Font-Size="Large" CssClass="white" /><br />
                    <asp:TextBox ID="TextBoxParty" runat="server" Width="650px" />
                    
                    <br />
                    <br />
                    <br />
                    
                    <asp:Button ID="ButtonFormSubmit" runat="server" Text="Buy Now" 
                        onclick="ButtonFormSubmit_Click" Font-Size="Large" Height="50px" 
                    Width="145px" />      
                    <br />
                    <br />
                </form>
                
                <asp:Label ID="LabelResult" runat="server" class="white" Visible="False" 
                                            style="text-align:left;border:thin solid #ffffff;padding-left:20px;" 
                                            Width="97%" BackColor="White" ForeColor="Black" CssClass="results" />
                
                
                <p class="style19"><strong>For tickets to:</strong></p>
                <p align="center" class="style19"><span class="style22"><strong class="style9"><span class="style16">Family Night Live</span> ( $5 per person $20 per family) </strong></span></p>
                <p align="center" class="style24"><strong class="style9"><span class="style17">Entertainment Hot Spot</span> ($5 per person $3.50 with student I.D.)</strong></p>
                <p align="center" class="style19"><span class="style22"><strong class="style9"><span class="style18">All That Jazz</span> ($7 per person)</strong></span></p>
                <p class="style19">Can be purchased at the door.</p>
                <p align="center" class="style19"> <strong>Thanks for visiting us here at  Showtime Utah for the Old West Dinner Adventure Show.&nbsp; We look forward to  entertaining you!</strong></p>
                <p align="center" class="style21">Ya'll come back now ya' hear!</p></td>
              </tr>
          </table>
          
          </td>
        <td width="47">&nbsp;</td>
      </tr>
    </table>
      <table width="974" height="30" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><div align="center" class="style8">
            <p class="style8"><span class="style9"><a href="http://www.showtimeutah.com/index.html"> Home</a> :: <a href="http://www.showtimeutah.com/auditions.html">Entertainers</a> :: <a href="http://www.showtimeutah.com/dinnerfare.html">Dinner Fare</a> :: <a href="http://www.showtimeutah.com/pricing.html">Pricing </a>:: <a href="http://www.showtimeutah.com/schedule.html">Show Schedule</a> :: <a href="concerts.html">Concerts</a> :: <a href="http://www.showtimeutah.com/location.html">Location</a> :: <a href="http://www.showtimeutah.com/aboutus.html">About Us</a> :: <a href="http://www.showtimeutah.com/contact.html">Contact Us</a></span></p>
          </div></td>
        </tr>
      </table></td>
  </tr>
</table>

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
