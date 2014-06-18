<%@ Page Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" CodeFile="AddEditShow.aspx.cs" Inherits="AddEditShow" Title="Untitled Page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel runat="server" ID="UpdatePanelShows" UpdateMode="Conditional">
                    <ContentTemplate>
    <asp:HiddenField ID="hdShow" runat="server" />
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0"  OnNextButtonClick="Wizard1_NextButtonClick"
        onfinishbuttonclick="Wizard1_FinishButtonClick" Width="550px" 
        BorderColor="#3125B2">
        <WizardSteps>
            
            <asp:WizardStep ID="WizardStep1" runat="server" Title="Shows">
                
                    <div>
             <table style="width: 425px; margin-left: 51px;">
                <thead title="Add a new Show"/>
                 <tr>
                   <td colspan="2" style="width:150px">
                   <a style="font-size:x-large;">Shows</a>
                   </td>
                    
                </tr>
                    <tr>
                        <td colspan="2" style="width:150px">
                            &nbsp;</td>
                    </tr>
                 <tr>
                   <td rowspan="2">
                       <asp:Label ID="Label1" runat="server" Text="Show Name:"></asp:Label>
                     </td>
                     
                </tr>
                <tr>
                    <td style="width:250px">
                        <asp:TextBox ID="txtBxName" runat="server" Width="100%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width:150px">
                         <asp:Label ID="Label2" runat="server" Text="Show Description:"></asp:Label>
                    </td>
                      <td style="width:250px">
                        <asp:TextBox ID="txtBxDesc" runat="server" Width="100%" Height="57px" 
                              TextMode="MultiLine"></asp:TextBox>
                     </td>
                </tr>
                <tr>
                    <td style="width:150px">
                         <asp:Label ID="Label4" runat="server" Text="Ticket Quantity:"></asp:Label>
                    </td>
                      <td style="width:250px">
                        <asp:TextBox ID="txtBxTicketQuantity" runat="server" Width="100%"></asp:TextBox>
                     </td>
                </tr>
                <tr>
                    <td style="width:150px">
                         <asp:Label ID="Label5" runat="server" Text="Ticket Price:"></asp:Label>
                    </td>
                      <td style="width:250px">
                        <asp:TextBox ID="txtBxTicketPrice" runat="server" Width="100%"></asp:TextBox>
                     </td>
                </tr>
                <tr>
                    <td style="width:150px">
                         <asp:Label ID="Label6" runat="server" Text="Show Date:"></asp:Label>
                    </td>
                      <td style="width:250px">
                      <asp:TextBox runat="server" ID="txtBxShowDate" Width="100%"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="ShowDate" TargetControlID="txtBxShowDate" runat="server"></ajaxToolkit:CalendarExtender>
                     </td>
                </tr>
                <tr>
                    <td style="width:150px">
                         <asp:Label ID="Label7" runat="server" Text="Show Music:"></asp:Label>
                    </td>
                      <td style="width:250px">
                        <asp:TextBox ID="txtBxMusic" runat="server" Width="100%"></asp:TextBox>
                     </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:right;">
                        &nbsp;</td>
                </tr>
               
                <tr>
                    <td colspan="2" style="text-align:justify;">
                        <asp:Label ID="lblMessage" runat="server" Text="Label" ForeColor="Green" 
                            Visible="False"></asp:Label>
                    </td>
                </tr>
               
            </table>
        </div>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" Title="Meals">
           
            <div>
         <table style="width: 425px; margin-left: 51px;">
            <thead title="Add a new Meal"/>
             <tr>
               <td colspan="2" style="width:150px">
               <a style="font-size:x-large;">Meals</a>
               </td>
                
            </tr>
                <tr>
                    <td colspan="2" style="width:150px">
                        &nbsp;</td>
                </tr>
            <tr>
               <td style="width:150px">
                   <asp:Label ID="Label3" runat="server" Text="Show:"></asp:Label>
                </td>
                 
                <td style="width:250px">
                   <asp:Label ID="lblMealShowName" runat="server"></asp:Label>
                </td>
                 
            </tr>

             <tr>
               <td style="width:150px">
                     <asp:Label ID="Label23" runat="server" Text="Meal Name:"></asp:Label>
                </td>
                 <td style="width:250px" width="100%">
                     <asp:TextBox ID="txtBxMealName" runat="server" Width="100%" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:150px">
                    <asp:Label ID="Label8" runat="server" Text="Meal Description:"></asp:Label>
                </td>
                  <td style="width:250px">
                    <asp:TextBox ID="txtBxMealDesc" runat="server" Width="100%" Height="57px" 
                              TextMode="MultiLine"></asp:TextBox>
                 </td>
            </tr>
            <tr>
                <td style="text-align: right;" colspan="2">
                     &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:right;">
                    <asp:Button ID="btnAddMeal" runat="server" OnClick="btnAddMeal_Click" 
                        Text="Add Meal" />
                </td>
            </tr>
           
            <tr>
                <td colspan="2" style="text-align:justify;">
                    <asp:Label ID="lblMealAddMessage" runat="server" ForeColor="Green" Text="Label" 
                        Visible="False"></asp:Label>
                </td>
            </tr>
           
        </table>
    </div> 
            </asp:WizardStep>
             <asp:WizardStep ID="WizardStep3" runat="server" Title="Desserts">
               
                <div>
        <table style="width: 425px; margin-left: 51px;">
        <tr>
               <td colspan="2" style="width:150px">
               <a style="font-size:x-large;">Desserts</a>
               </td>
                
            </tr>
            <tr>
                <td colspan="2" style="width:150px">
                    &nbsp;</td>
            </tr>
            <tr>
               <td style="width:150px">
                   <asp:Label ID="Label10" runat="server" Text="Show:"></asp:Label>
                </td>
                 
                <td style="width:250px">
                   <asp:Label ID="lblDessertShowName" runat="server"></asp:Label>
                </td>
                 
            </tr>

             <tr>
                <td style="width:150px">
                     <asp:Label ID="Label11" runat="server" Text="Dessert Name:"></asp:Label>
                </td>
               <td style="width:250px">
                    <asp:TextBox ID="txtBxDessertName" runat="server" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:150px">
                    <asp:Label ID="Label12" runat="server" Text="Dessert Description:"></asp:Label>
                </td>
                 <td style="width:250px">
                    <asp:TextBox ID="txtBxDessertDesc" runat="server" Width="100%" Height="57px" 
                              TextMode="MultiLine"></asp:TextBox>
                 </td>
            </tr>
            <tr>
                <td style="text-align: right;" colspan="2">
                     &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:right;">
                    <asp:Button ID="btnAddDessert" runat="server" OnClick="btnAddDessert_Click" 
                        Text="Add Dessert" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:justify;">
                    <asp:Label ID="lblDessertAddMessage" runat="server" ForeColor="Green" Text="Label" 
                        Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
    </div> 
             </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
    </ContentTemplate></asp:UpdatePanel>
</asp:Content>

