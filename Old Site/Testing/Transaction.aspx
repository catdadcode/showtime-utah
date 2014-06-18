<%@ Page Language="C#" AutoEventWireup="true" Inherits="Transaction" Codebehind="Transaction.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Showtime Utah (Schedule)</title>
<!-- InstanceEndEditable -->
<style type="text/css">

</style>
<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
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
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <table width="1000" height="708" border="0" align="center" cellpadding="0" cellspacing="0" background="images/background.jpg">
  <tr>
    <td width="891" height="700" align="center" valign="top" background="file:///F|/Showtime Utah/background.jpg"><table width="1000" height="677" border="0" cellpadding="0" cellspacing="5">
      <tr>
        <td width="69" height="677">&nbsp;</td>
        <td width="884" valign="top"><table width="981" height="237" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="197" colspan="10">&nbsp;</td>
          </tr>
            <tr bordercolor="#99FF00">
              <td width="110" height="40"><div align="center"><a href="index.html"><img src="images/homebutton.jpg" alt="Home" width="103" height="21" border="0" /></a></div></td>
              <td width="103"><div align="center"><a href="auditions.html"><img src="images/entertainersbutton.jpg" alt="Entertainmers" width="103" height="21" border="0" /></a></div></td>
              <td width="103"><div align="center"><a href="dinnerfare.html"><img src="images/menubutton.jpg" alt="Menu" width="103" height="21" border="0" /></a></div></td>
              <td width="103"><div align="center"><a href="pricing.html"><img src="images/ticketsbutton.jpg" alt="Tickets" width="103" height="21" border="0" /></a></div></td>
              <td width="103"><div align="center"><a href="schedule.html"><img src="images/schedulebutton.jpg" alt="Schedule" width="103" height="21" border="0" /></a></div></td>
              <td width="103"><div align="center"><a href="concerts.html"><img src="images/concertsbutton.jpg" alt="Concerts" width="103" height="21" border="0" /></a></div></td>
            <td width="103"><div align="center"><a href="location.html"><img src="images/locationbutton.jpg" alt="Location" width="103" height="21" border="0" /></a></div></td>
            <td width="103"><div align="center"><a href="aboutus.html"><img src="images/aboutusbutton.jpg" alt="About Us" width="103" height="21" border="0" /></a></div></td>
            <td width="117"><div align="center"><a href="contact.html"><img src="images/contactbutton.jpg" alt="Contact Us" width="103" height="21" border="0" /></a></div></td>
            <td width="0"></td>
          </table>
     <asp:UpdatePanel  id="TransactionReview" runat="server" UpdateMode="Conditional" >
     <ContentTemplate>
         <table width="425" class="modalPopup" id="tableTransactionReview" ;>
         <tr>
            <td colspan="3">
                <img src="Images/logo.jpg" style="border:0px;" />
            </td>
         </tr>
            <tr>
                <td colspan="3" style="font-size:x-large;">Transaction Review</td>
            </tr>
            <tr style="height:22px;">
                <td colspan="3" />
            </tr>
            <tr style="height:22px;" align="left">
                                  <td>
                                      <asp:Label ID="Label21" runat="server" Text="Customer Name:"></asp:Label>
                                  </td>
                                  <td>
                                      <asp:Label ID="lblCustomerName" runat="server"></asp:Label>
                                  </td>
                                  <td>
                                  </td>
                                   
                              </tr>
                              <tr style="height:22px;">
                                  <td colspan="3"></td>
                              </tr>
                              <tr style="height:22px;">
                                  <td colspan="3" align="left" style="font-size:large;">
                                      <asp:Label ID="Label22" runat="server" Text="Transaction Information"></asp:Label>
                                  </td>
                               </tr>
                              <tr align="left" style="height:22px;">
                                  <td>
                                      <asp:Label ID="Label38" runat="server" Text="Show Name:"></asp:Label>
                                  </td>
                                  <td>
                                      <asp:Label ID="lblTransactionShow" runat="server"></asp:Label>
                                  </td>
                                  <td>
                                      &nbsp;</td>
                </tr>
                <tr align="left" style="height:22px;">
                    <td>
                        <asp:Label ID="Label26" runat="server" Text="Show Date:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblTransactionShowDate" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr align="left" style="height:22px;">
                    <td>
                        <asp:Label ID="Label39" runat="server" Text="# of Tickets:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblTransactionTicketQuantity" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr align="left" style="height:22px;">
                    <td>
                        <asp:Label ID="Label24" runat="server" Text="Ticket Price:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblTransactionTicketPrice" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr align="left" style="height:22px;">
                    <td>
                        <asp:Label ID="Label25" runat="server" Text="Transaction Total:"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblTransactionTotal" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                              <tr style="height:22px;">
                                  <td colspan="3"></td>
                              </tr>
                              <tr style="height:22px;">
                                  <td colspan="3" align="left" style="font-size:large;">
                                      <asp:Label ID="Label27" runat="server" Text="Billing Information"></asp:Label>
                                  </td>
                               </tr>
                              <tr style="height:22px;" align="left">
                                  <td>
                                      <asp:Label ID="Label29" runat="server" Text="Billing Address"></asp:Label>
                                      :</td>
                                  <td colspan="2">
                                      
                                      <asp:Label ID="lblBillingAddress" runat="server"></asp:Label>
                                  </td>
                                  
                              </tr>
                              <tr align="left" style="height:22px;">
                                  <td>
                                      &nbsp;</td>
                                  <td colspan="2">
                                      <asp:Label ID="lblBillingAddress1" runat="server"></asp:Label>
                                  </td>
                </tr>
                              <tr style="height:22px;">
                                  <td colspan="3"></td>
                              </tr>
                              <tr style="height:22px;">
                                  <td colspan="3" align="left" style="font-size:large;">
                                      <asp:Label ID="Label28" runat="server" Text="Shipping Information"></asp:Label>
                                  </td>
                               </tr>
                              <tr style="height:22px;" align="left">
                                  <td>
                                      <asp:Label ID="Label37" runat="server" Text="Shipping Address:"></asp:Label>
                                  </td>
                                  <td colspan="2">
                                      <asp:Label ID="lblShippingAddress" runat="server"></asp:Label>
                                      <br />
                                  </td>
                              </tr>
                              <tr align="left" style="height:22px;">
                                  <td>
                                      &nbsp;</td>
                                  <td colspan="2">
                                      <asp:Label ID="lblShippingAddress1" runat="server"></asp:Label>
                                  </td>
                               </tr>
                              <tr style="height:22px;">
                                  <td colspan="3"></td>
                              </tr>
                              <tr style="height:22px;">
                                  <td colspan="3" align="left" style="font-size:large;">
                                      <asp:Label ID="Label43" runat="server" Text="Card Card Information"></asp:Label>
                                  </td>
                               </tr>
                                <tr align="left" style="height:22px;">
                                  <td>
                                      <asp:Label ID="Label40" runat="server" Text="Card Number:"></asp:Label>
                                    </td>
                                  <td colspan="2">
                                      <asp:Label ID="lblTransactionCardNumber" runat="server"></asp:Label>
                                  </td>
                               </tr>
                               <tr align="left" style="height:22px;">
                                  <td>
                                      <asp:Label ID="Label41" runat="server" Text="Card Expiration:"></asp:Label>
                                   </td>
                                  <td colspan="2">
                                      <asp:Label ID="lblTransactionCCExpiration" runat="server"></asp:Label>
                                  </td>
                               </tr>
                               <tr align="left" style="height:22px;">
                                  <td>
                                      <asp:Label ID="Label42" runat="server" Text="Card Type:"></asp:Label>
                                   </td>
                                  <td colspan="2">
                                      <asp:Label ID="lblTransactionCCType" runat="server"></asp:Label>
                                  </td>
                               </tr>
                              <tr style="height:22px;">
                                  <td colspan="3"></td>
                              </tr>
                              <tr style="height:22px;">
                                  <td colspan="3">
                                      &nbsp;</td>
                               </tr>
                              <tr style="height:22px;">
                                  <td></td>
                                  <td><asp:Button ID="btnSubmitTransaction" runat="server" Text="Buy Tickets" 
                                          onclick="btnSubmitTransaction_Click" /></td>
                                  <td><asp:Button ID="btnCancelTransaction" runat="server" Text="Cancel" 
                                          onclick="btnCancelTransaction_Click" /></td>
                              </tr>
                              </table>
                              </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hdShowID" runat="server" />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" 
                onfinishbuttonclick="Wizard1_FinishButtonClick" 
                onnextbuttonclick="Wizard1_NextButtonClick" Width="700" DisplaySideBar="false">
                <WizardSteps>
                    <asp:WizardStep ID="WizardStep0" runat="server" Title="Transaction Info" StepType="Start">
                    <table width="100%" >
                        <caption style="font-size:x-large;">Please Complete The Following Transaction Information</caption>
                         <tr style="height:22px;">
                            <td colspan="3" />
                         </tr>
                         <tr style="height:22px; width:99%;">
                            <td style="width:200px; text-align:right;">
                                <asp:Label runat="server" Text="Show:" CssClass="formLabels"></asp:Label>
                             </td>
                            <td style="width:200px; float:left;"><asp:Label ID="lblShow" runat="server"></asp:Label></td>
                            <td></td>
                            
                        </tr>
                        <tr style="height:22px; width:99%;">
                            
                            <td style="width:200px; text-align:right;"><asp:Label ID="Label18" Text="Show Date:" runat="server"></asp:Label></td>
                            <td style="width:200px; float:left;"><asp:Label ID="lblShowDate" runat="server"></asp:Label></td>
                            <td></td>
                            
                        </tr>
                        <tr style="height:22px;">
                            <td style="width:200px; text-align:right;"><asp:Label ID="Label15" Text="Quantity:" runat="server"></asp:Label></td>
                            <td style=" width:200px; float:left;"><asp:DropDownList runat="server" 
                                    ID="ddlTicketQuanity"  Width="50" AutoPostBack="True" 
                                    OnSelectedIndexChanged="ddlTicketQuanity_SelectedIndexChanged"/></td>
                           <td></td>
                           
                        </tr>
                         <tr style="height:22px;">
                        
                           <td colspan="2" style="width:245px;"> <center><hr style="width: 473px" /></center></td>
                            <td></td>
                        </tr>
                        <tr style="height:22px;">
                           
                            <td style="width:200px;  text-align:right"><asp:Label ID="Label17" Text="Price:" runat="server"></asp:Label></td>
                            <td style="width:200px;"><asp:Label ID="lblPrice" runat="server"></asp:Label></td>
                            <td></td>
                            
                        </tr>
                        <tr style="height:22px;">
                            <td style="width:200px; text-align:right"><asp:Label ID="Label34" Text="Sales Tax:" runat="server"></asp:Label></td>
                            <td style="width:200px;"><asp:Label ID="lblSaleTax" runat="server"></asp:Label></td>
                            <td></td>
                        </tr>
                        <tr style="height:22px;">
                            <td style="width:200px; text-align:right"><asp:Label ID="Label16" Text="Total:" runat="server"></asp:Label></td>
                            <td style="width:200px;"><asp:Label ID="lblTotalPrice" runat="server"></asp:Label></td>
                            <td></td>
                        </tr>
                        
                   </table>
                   <div style="height:25px;"></div>
                   <div id="MealDiv" runat="server" visible="false">
                   <table >
                       <tr >
                           <td valign="top" align="right" style="width:300px;">
                           <a style="float:left;"><u>Enter the quantity of each Meal (only 1 per ticket)</u></a> 
                           <asp:Repeater ID="rpMeals" runat="server" >
                                <ItemTemplate>
                                <table>
                                    <tr>
                                        <td style="width:270px; text-align:right">
                                            <asp:HiddenField ID="hdMealID" runat="server" Value='<%#DataBinder.Eval(Container, "DataItem.MealID")%>' />
                                            <asp:Label ID="lblMeal" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Name")%>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBxMeal" runat="server" Width="25"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                </ItemTemplate>
                           </asp:Repeater>
                           <asp:CustomValidator ID="CustomValidatorMeals" runat="server" ErrorMessage="CustomValidator"></asp:CustomValidator>
                       </td>
                       <td style="width:45px;"></td>
                       <td valign="top" align="right" style="width:320px;">
                           <a style="float:left;"><u>Enter the quantity of each Dessert (only 1 per ticket)</u></a>
                           <asp:Repeater ID="rpDessert" runat="server" >
                                <ItemTemplate>
                                <table>
                                    <tr>
                                        <td style="width:270px; text-align:right">
                                         <asp:HiddenField ID="hdDessertID" runat="server" Value='<%#DataBinder.Eval(Container, "DataItem.DessertID")%>' />
                                            <asp:Label ID="lblDessert" runat="server" Text='<%#DataBinder.Eval(Container, "DataItem.Name")%>' />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtBxDessert" runat="server" Width="25"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                </ItemTemplate>
                           </asp:Repeater>
                           <asp:CustomValidator ID="CustomValidatorDesserts" ClientValidationFunction="ValidateDesserts" runat="server" ErrorMessage="CustomValidator"></asp:CustomValidator>
                           <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="CustomValidatorDessertsExtender" TargetControlID="CustomValidatorDesserts" HighlightCssClass="validatorCalloutHighlight" />
                       </td>
                       </tr>
                   </table>
                   </div>
                </asp:WizardStep>
              <asp:WizardStep ID="WizardStep1" runat="server" Title="Billing Info" StepType="Step">
                   
    <table >
        <caption style="font-size:x-large;">Please Enter Your Billing Information</caption>
         <tr style="height:22px;">
                            <td colspan="6" />
                         </tr>
        <tr>
            <td style="width:115px; text-align:right">
                <asp:Label ID="Label1" runat="server" Text="First Name:"></asp:Label>
            </td>
            
            <td>
                <asp:TextBox ID="txtBxFirstNameBilling" runat="server" Width="200"></asp:TextBox>
            </td>
            <td style="width:75px;">
                <asp:RequiredFieldValidator runat="server" ID="NReq"
            ControlToValidate="txtBxFirstNameBilling"
            Display="None"
            ErrorMessage="<b>Required Field Missing</b><br />A first name is required." />
        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="NReqE"
            TargetControlID="NReq"
            HighlightCssClass="validatorCalloutHighlight" />
            </td>
             <td style="width:115px; text-align:right">
                <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBxLastNameBilling" runat="server" Width="200"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator runat="server" ID="NReq1"
            ControlToValidate="txtBxLastNameBilling"
            Display="None"
            ErrorMessage="<b>Required Field Missing</b><br />A last name is required." />
        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="NReq1E"
            TargetControlID="NReq1"
            HighlightCssClass="validatorCalloutHighlight" /></td>
        </tr>
        <tr>
            <td style="width:115px; text-align:right" >
                <asp:Label ID="Label3" runat="server" Text="Address:"></asp:Label>
            </td>
            <td colspan="4"><asp:TextBox runat="server" ID="txtbxAddressBilling" Width="99%"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator runat="server" ID="NReq2"
            ControlToValidate="txtBxAddressBilling"
            Display="None"
            ErrorMessage="<b>Required Field Missing</b><br />An address is required." />
        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="NReq2E"
            TargetControlID="NReq2"
            HighlightCssClass="validatorCalloutHighlight" /></td>
        </tr>
        <tr>
             <td style="width:115px; text-align:right">
                <asp:Label ID="Label5" runat="server" Text="City:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBxCityBilling" runat="server" Width="200"></asp:TextBox>
            </td>
            <td>
        <asp:RequiredFieldValidator runat="server" ID="NReq3"
            ControlToValidate="txtBxCityBilling"
            Display="None"
            ErrorMessage="<b>Required Field Missing</b><br />A city is required." />
        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="NReqE3"
            TargetControlID="NReq3"
            HighlightCssClass="validatorCalloutHighlight" /></td>
             <td style="width:115px; text-align:right">
                <asp:Label ID="Label6" runat="server" Text="State:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlStatesBilling" runat="server" Width="200" 
                    DataSourceID="StatesDataSource" DataTextField="State" 
                    DataValueField="PostalCode" ></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RFVstatesBilling" runat="server" Display="None" InitialValue="None" ErrorMessage="Billing state is required" ControlToValidate="ddlStatesBilling"></asp:RequiredFieldValidator>
                <ajaxToolkit:ValidatorCalloutExtender ID="RFVstatesBillingExtender" runat="server" TargetControlID="RFVstatesBilling"></ajaxToolkit:ValidatorCalloutExtender>
                                  
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
             <td style="width:115px; text-align:right">
                <asp:Label ID="Label7" runat="server" Text="Zip /Postal Code:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBxZipBilling" runat="server" Width="200"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5"
                ControlToValidate="txtBxZipBilling"
                Display="None"
                ErrorMessage="<b>Required Field Missing</b><br />A postal code is required." />
                <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender7"
                TargetControlID="RequiredFieldValidator5"
                HighlightCssClass="validatorCalloutHighlight" />
            </td>
              <td style="width:115px; text-align:right">
                <asp:Label ID="Label8" runat="server" Text="Email:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtBxEmail" runat="server" Width="200"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="NRFQ9"
                    ControlToValidate="txtBxEmail"
                    Display="None"
                    ErrorMessage="<b>Required Field Missing</b><br />An Email Address is required." />
                <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="NRFQ9Extender"
                    TargetControlID="NRFQ9"
                    HighlightCssClass="validatorCalloutHighlight" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
             <td style="width:115px; text-align:right">
                <asp:Label ID="Label9" runat="server" Text="Phone Number"></asp:Label>
            </td>
            <td>
                <ew:MaskedTextbox runat="server" Width="200" id="txtBxPhoneNumberBilling" Mask="(999) 999-9999" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" />
            </td>
            <td> 
            
        <asp:RequiredFieldValidator runat="server" ID="PNReq"
            ControlToValidate="txtBxPhoneNumberBilling"
            Display="None"
            ErrorMessage="<b>Required Field Missing</b><br />A phone number is required." />
        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="PNReqE"
            TargetControlID="PNReq"
            HighlightCssClass="validatorCalloutHighlight" />
            
        <asp:RegularExpressionValidator runat="server" ID="PNRegEx"
            ControlToValidate="txtBxPhoneNumberBilling"
            Display="None"
            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
            ErrorMessage="<b>Invalid Field</b><br />Please enter a phone number in the format:<br />(###) ###-####" />
        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="PNReqEx"
            TargetControlID="PNRegEx"
            HighlightCssClass="validatorCalloutHighlight" /></td>
             <td style="width:115px; text-align:right">
                <asp:Label ID="Label10" runat="server" Text="Fax Number"></asp:Label>
            </td>
            <td>
                <ew:MaskedTextbox runat="server" Width="200" id="txtBxFaxBilling" Mask="(999) 999-9999" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" />
            </td>
            <td> 
        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender5"
            TargetControlID="PNReq"
            HighlightCssClass="validatorCalloutHighlight" />
            
        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1"
            ControlToValidate="txtBxFaxBilling"
            Display="None"
            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
            ErrorMessage="<b>Invalid Field</b><br />Please enter a fax number in the format:<br />(###) ###-####" />
        <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender6"
            TargetControlID="RegularExpressionValidator1"
            HighlightCssClass="validatorCalloutHighlight" /></td>
        </tr>
         <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td colspan="2">
                <asp:CheckBox ID="cbShippingSame" runat="server" 
                    Text="Use As My Shipping Address." />
             </td>
        </tr>
        
    </table>
     </asp:WizardStep>
                    <asp:WizardStep ID="WizardStep2" runat="server" Title="Shipping Info" StepType="Step">
                     <table >
                      <thead>
                          <caption style="font-size:x-large;">
                              Please Enter Your Shipping Information
                          </caption>
                          </thead>
                              <tr style="height:22px;">
                                  <td colspan="6">
                                  </td>
                                  
                              </tr>
                              <tr>
                                  <td style="width:115px; text-align:right">
                                      <asp:Label ID="Label2" runat="server" Text="First Name:"></asp:Label>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="txtBxFirstNameShipping" runat="server" Width="200px"></asp:TextBox>
                                  </td>
                                  <td style="width:75px;">
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                          ControlToValidate="txtBxFirstNameShipping" Display="None" 
                                          ErrorMessage="&lt;b&gt;Required Field Missing&lt;/b&gt;&lt;br /&gt;A first name is required."></asp:RequiredFieldValidator>
                                      <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" 
                                          runat="server" Enabled="True" HighlightCssClass="validatorCalloutHighlight" 
                                          TargetControlID="NReq">
                                      </ajaxToolkit:ValidatorCalloutExtender>
                                  </td>
                                  <td style="width:115px; text-align:right">
                                      <asp:Label ID="Label4" runat="server" Text="Last Name:"></asp:Label>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="txtBxLastNameShipping" runat="server" Width="200px"></asp:TextBox>
                                  </td>
                                  <td>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                          ControlToValidate="txtBxLastNameShipping" Display="None" 
                                          ErrorMessage="&lt;b&gt;Required Field Missing&lt;/b&gt;&lt;br /&gt;A last name is required."></asp:RequiredFieldValidator>
                                      <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" 
                                          runat="server" Enabled="True" HighlightCssClass="validatorCalloutHighlight" 
                                          TargetControlID="NReq1">
                                      </ajaxToolkit:ValidatorCalloutExtender>
                                  </td>
                              </tr>
                              <tr>
                                  <td style="width:115px; text-align:right">
                                      <asp:Label ID="Label11" runat="server" Text="Address:" Width="99%"></asp:Label>
                                  </td>
                                  <td colspan="4">
                                      <asp:TextBox ID="txtBxAddressShipping" runat="server" Width="99%"></asp:TextBox>
                                  </td>
                                  <td>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                          ControlToValidate="txtBxAddressShipping" Display="None" 
                                          ErrorMessage="&lt;b&gt;Required Field Missing&lt;/b&gt;&lt;br /&gt;An address is required."></asp:RequiredFieldValidator>
                                      <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" 
                                          runat="server" Enabled="True" HighlightCssClass="validatorCalloutHighlight" 
                                          TargetControlID="NReq2">
                                      </ajaxToolkit:ValidatorCalloutExtender>
                                  </td>
                              </tr>
                              <tr>
                                  <td style="width:115px; text-align:right">
                                      <asp:Label ID="Label12" runat="server" Text="City:"></asp:Label>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="txtBxCityShipping" runat="server" Width="200px"></asp:TextBox>
                                  </td>
                                  <td>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                          ControlToValidate="txtBxCityShipping" Display="None" 
                                          ErrorMessage="&lt;b&gt;Required Field Missing&lt;/b&gt;&lt;br /&gt;A city is required."></asp:RequiredFieldValidator>
                                      <ajaxToolkit:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" 
                                          runat="server" Enabled="True" HighlightCssClass="validatorCalloutHighlight" 
                                          TargetControlID="NReq3">
                                      </ajaxToolkit:ValidatorCalloutExtender>
                                  </td>
                                  <td style="width:115px; text-align:right">
                                      <asp:Label ID="Label13" runat="server" Text="State:"></asp:Label>
                                  </td>
                                  <td>
                                      <asp:DropDownList ID="ddlStatesShipping" runat="server" 
                                          DataSourceID="StatesDataSource" DataTextField="State" 
                                          DataValueField="PostalCode" Width="200px">
                                      </asp:DropDownList>
                                      <asp:RequiredFieldValidator ID="rfvShippingState" Display="None" runat="server" InitialValue="None" ErrorMessage="Shipping state is required" ControlToValidate="ddlStatesShipping"></asp:RequiredFieldValidator>
                                      <ajaxToolkit:ValidatorCalloutExtender ID="rfvShippingStateExtender" runat="server" TargetControlID="rfvShippingState"></ajaxToolkit:ValidatorCalloutExtender>
                                  </td>
                                  <td>
                                      &nbsp;</td>
                              </tr>
                              <tr>
                                  <td style="width:115px; text-align:right">
                                      <asp:Label ID="Label14" runat="server" Text="Zip /Postal Code:"></asp:Label>
                                  </td>
                                  <td>
                                      <asp:TextBox ID="txtBxZipShipping" runat="server" Width="200px"></asp:TextBox>
                                  </td>
                                  <td>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6"
                                    ControlToValidate="txtBxZipShipping"
                                    Display="None"
                                    ErrorMessage="<b>Required Field Missing</b><br />A postal code is required." />
                                    <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender8"
                                    TargetControlID="RequiredFieldValidator6"
                                    HighlightCssClass="validatorCalloutHighlight" />
                                 </td>
                                  <td style="width:115px; text-align:right">
                                      &nbsp;</td>
                                  <td>
                                      &nbsp;</td>
                                  <td>
                                      &nbsp;</td>
                              </tr>
                              <tr>
                                  <td>
                                  </td>
                                  <td>
                                  </td>
                                  <td>
                                  </td>
                                  <td>
                                  </td>
                                  <td>
                                  </td>
                                  <td>
                                  </td>
                              </tr>
                     
                   
    </table>
                    </asp:WizardStep>
                    <asp:WizardStep Title="Credit Card Info" runat="server" StepType="Finish">
                        <table>
                            <thead>
                                  <caption style="font-size:x-large;">
                              Please Enter Your Credit Card Information
                          </caption>
                            </thead>
                            <tr style="height:22px;">
                                  <td colspan="2">
                                  </td>
                                  
                              </tr>
                              <tr>
                                <td style="width:115px; text-align:right">
                                      <asp:Label ID="Label23" runat="server" Text="Card Type:"></asp:Label>
                                  </td>
                                 <td colspan="2" >
                                    <asp:DropDownList ID="ddlCreditCardType" runat="server" RepeatDirection="Horizontal" Width="205px">
                                        <asp:ListItem Text="" Value="None"></asp:ListItem>
                                        <asp:ListItem Text="Visa" Value="Visa"></asp:ListItem>
                                        <asp:ListItem  Text="Master Card" Value="Master Card"></asp:ListItem>
                                        <asp:ListItem Text="Discover Card" Value="Discover Card"></asp:ListItem>
                                        <asp:ListItem   Text="American Express" Value="American Express"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvddlCreditCardType" runat="server" Display="None" InitialValue="None" ErrorMessage="Card Type is required" ControlToValidate="ddlCreditCardType"></asp:RequiredFieldValidator>
                                    <ajaxToolkit:ValidatorCalloutExtender ID="rfvddlCreditCardTypeExtender" runat="server" TargetControlID="rfvddlCreditCardType"></ajaxToolkit:ValidatorCalloutExtender>
                
                                  </td>
                              </tr>
                             <tr>
                                 <td style="width:115px; text-align:right">
                                      <asp:Label ID="Label19" runat="server" Text="Credit Card #:"></asp:Label>
                                  </td>
                                  <td >
                                    <asp:TextBox ID="txtBxCreditCardNumber" runat="server" Width="200px"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7"
                                        ControlToValidate="txtBxCreditCardNumber"
                                        Display="None"
                                        ErrorMessage="<b>Required Field Missing</b><br />A Credit/Debit Card # is required." />
                                    <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender9"
                                        TargetControlID="RequiredFieldValidator7"
                                        HighlightCssClass="validatorCalloutHighlight" />
                                        
                               
                                  </td>
                                
         
                                 
                              </tr>
                              <tr>
                                 <td style="width:115px; text-align:right">
                                      <asp:Label ID="Label31" runat="server" Text="Expiration Date:"></asp:Label>
                                  </td>
                                  <td>
                                    <asp:Label ID="Label32" runat="server" Text="Month:"></asp:Label>
                                      &nbsp;
                                    <asp:DropDownList runat="server" ID="ddlExpirationMonth">
                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                        <asp:ListItem Text="January" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Febuary" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="March" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="April" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="May" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="June" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="July" Value="7"></asp:ListItem>
                                        <asp:ListItem Text="August" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="September" Value="9"></asp:ListItem>
                                        <asp:ListItem Text="October" Value="10"></asp:ListItem>
                                        <asp:ListItem Text="November" Value="11"></asp:ListItem>
                                        <asp:ListItem Text="December" Value="12"></asp:ListItem>
                                    </asp:DropDownList>
                                    
                                    &nbsp;
                                    
                                    <asp:Label ID="Label33" runat="server" Text="Year:"></asp:Label>
                                    &nbsp;
                                    <asp:DropDownList runat="server" ID="ddlExpirationYear">
                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                        <asp:ListItem Text="2008" Value="2008"></asp:ListItem>
                                        <asp:ListItem Text="2009" Value="2009"></asp:ListItem>
                                        <asp:ListItem Text="2010" Value="2010"></asp:ListItem>
                                        <asp:ListItem Text="2011" Value="2011"></asp:ListItem>
                                        <asp:ListItem Text="2012" Value="2012"></asp:ListItem>
                                        <asp:ListItem Text="2013" Value="2013"></asp:ListItem>
                                        <asp:ListItem Text="2014" Value="2014"></asp:ListItem>
                                        <asp:ListItem Text="2015" Value="2015"></asp:ListItem>
                                        <asp:ListItem Text="2016" Value="2016"></asp:ListItem>
                                        <asp:ListItem Text="2017" Value="2017"></asp:ListItem>
                                    </asp:DropDownList>
                                     <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator8"
                                        ControlToValidate="ddlExpirationMonth" InitialValue=""
                                        Display="None"
                                        ErrorMessage="<b>Required Field Missing</b><br />A Credit Card Expiration is required." />
                                     <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender11"
                                        TargetControlID="RequiredFieldValidator8"
                                        HighlightCssClass="validatorCalloutHighlight" />
                                     <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator9"
                                        ControlToValidate="ddlExpirationYear" InitialValue=""
                                        Display="None"
                                        ErrorMessage="<b>Required Field Missing</b><br />A Credit Card Expiration is required." />
                                     <ajaxToolkit:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender10"
                                        TargetControlID="RequiredFieldValidator9"
                                        HighlightCssClass="validatorCalloutHighlight" />
                                  </td>
                                  
                              </tr>

                              
                        </table>
                    </asp:WizardStep>
                </WizardSteps>
                <SideBarButtonStyle BorderStyle="None" />
                <SideBarStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="False" />
            </asp:Wizard>
     </ContentTemplate>
     </asp:UpdatePanel>
    </div>
    
     
    <button runat="server" id="fakeBtn" class="fakeBtns"></button>
    <ajaxToolkit:ModalPopupExtender runat="server" CancelControlID="btnCancelTransaction" OkControlID="btnCancelTransaction" ID="modalPopup" TargetControlID="fakeBtn" BackgroundCssClass="modalBackground" PopupControlID="TransactionReview" DropShadow="true"></ajaxToolkit:ModalPopupExtender>
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
<asp:SqlDataSource ID="InsertCustomerDataSource" runat="server" InsertCommand="CustomerInsert"
        ConnectionString="<%$ ConnectionStrings:DinnerDetectiveConnectionString %>"   SelectCommandType="StoredProcedure" >
        <InsertParameters>
            <asp:FormParameter  FormField="txtBxFirstNameBilling" Name="FirstName" 
                 Type="String" />
           <asp:FormParameter FormField="txtBxLastNameBilling" Name="LastName" 
                 Type="String" />
            <asp:FormParameter FormField="txtbxAddressBilling" Name="Address" 
                 Type="String" />
            <asp:FormParameter FormField="txtBxCityBilling" DefaultValue="" Name="City" 
                 Type="String" />
            <asp:FormParameter FormField="ddlStatesBilling" DefaultValue=""  
                 Type="String" />
            <asp:FormParameter FormField="txtBxZipBilling" Name="Zip" 
                 Type="String" />
            <asp:FormParameter FormField="txtBxPhoneNumberBilling" Name="PhoneNumber" 
                Type="String" />
            <asp:FormParameter FormField="txtBxFaxBilling" Name="Fax" 
                 Type="String" />
            <asp:FormParameter FormField="txtBxEmailBilling" Name="Email" 
                 Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="StatesDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DinnerDetectiveConnectionString %>" 
        SelectCommand="SELECT [PostalCode], [State] FROM [States]">
    </asp:SqlDataSource>
    <asp:ObjectDataSource ID="TicketsAvailableDataSource" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ShowsTableAdapters.ShowTicketsAvailableTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="ShowID" QueryStringField="ShowID" 
                Type="Int64" />
        </SelectParameters>
    </asp:ObjectDataSource>
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
<!-- InstanceEnd --></html>
