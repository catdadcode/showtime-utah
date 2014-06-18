<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="Tickets.aspx.cs" Inherits="Tickets" Title="Purchase Show Tickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <table>
            <tr>
                <td>
                    <div style="text-align: left; background-image: url(images/mainpanel.gif); background-repeat: no-repeat;
                        height: 440px; width: 490px; margin-right: 15px; padding: 30px; font-family: Arial;">
                        <asp:LoginView ID="LoginView1" runat="server">
                            <LoggedInTemplate>
                                <center>
                                    <asp:Button ID="btnManageShows" CausesValidation="false" PostBackUrl="~/ManageShows.aspx"
                                        runat="server" Text="Manage Shows" />
                                    <asp:Button ID="btnManageCouponCodes" CausesValidation="false" PostBackUrl="~/ManageCouponCodes.aspx"
                                        runat="server" Text="Manage Coupon Codes" />
                                    <asp:Button ID="btnEditPricing" CausesValidation="false" PostBackUrl="~/EditPricing.aspx"
                                        runat="server" Text="Edit Pricing" />
                                </center>
                                <br />
                                <br />
                                <div style="overflow: auto; height: 370px;">
                            </LoggedInTemplate>
                            <AnonymousTemplate>
                                <div style="overflow: auto; height: 440px;">
                            </AnonymousTemplate>
                        </asp:LoginView>
                        <h3>
                            Purchase your tickets online by using the form below</h3>
                        Tickets are non-refundable.<br />
                        Dates can be changed up to 48 hours before the show with no charge.<br />
                        <br />
                        Or you can call <b>801-636-9669</b> for reservations.<br />
                        <br />
                        When you call please have the following information:
                        <br />
                        * Number of people in your group
                        <br />
                        * Date you would like to attend
                        <br />
                        * Your credit card information
                        <br />
                        <br />
                        <br />
                        <div id="ticketselect" runat="server">
                            Pick a show:
                            <asp:DropDownList ID="ddlShow" Width="300px" runat="server">
                            </asp:DropDownList>
                            <br />
                            Adults:
                            <asp:DropDownList ID="ddlAdults" runat="server">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem>
                                <asp:ListItem>17</asp:ListItem>
                                <asp:ListItem>18</asp:ListItem>
                                <asp:ListItem>19</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem>
                                <asp:ListItem>22</asp:ListItem>
                                <asp:ListItem>23</asp:ListItem>
                                <asp:ListItem>24</asp:ListItem>
                                <asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem>
                                <asp:ListItem>27</asp:ListItem>
                                <asp:ListItem>28</asp:ListItem>
                                <asp:ListItem>29</asp:ListItem>
                                <asp:ListItem>30</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp &nbsp &nbsp Children:
                            <asp:DropDownList ID="ddlChildren" runat="server">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>16</asp:ListItem>
                                <asp:ListItem>17</asp:ListItem>
                                <asp:ListItem>18</asp:ListItem>
                                <asp:ListItem>19</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>21</asp:ListItem>
                                <asp:ListItem>22</asp:ListItem>
                                <asp:ListItem>23</asp:ListItem>
                                <asp:ListItem>24</asp:ListItem>
                                <asp:ListItem>25</asp:ListItem>
                                <asp:ListItem>26</asp:ListItem>
                                <asp:ListItem>27</asp:ListItem>
                                <asp:ListItem>28</asp:ListItem>
                                <asp:ListItem>29</asp:ListItem>
                                <asp:ListItem>30</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <span style="font-size: 14px; color: #BB0000;">If you would like to see our show only,
                                without dinner, please use coupon code "Adult" for adults and "Child" for children.</span>
                            <br />
                            Coupon Code:
                            <asp:TextBox ID="tbxCouponCode" Width="75px" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="btnCalculateTotal" CausesValidation="false" runat="server" Text="Calculate Total"
                                OnClick="btnCalculateTotal_Click" />
                            &nbsp &nbsp &nbsp Total with sales tax:
                            <asp:Label ID="lblTotal" Font-Bold="true" runat="server" Text="$0.00"></asp:Label>
                            <br />
                            <br />
                            Required Information for booking on-line
                            <br />
                            <br />
                            First Name:
                            <asp:TextBox ID="tbxFirstName" Width="125px" runat="server"></asp:TextBox><br />
                            <br />
                            Last Name:
                            <asp:TextBox ID="tbxLastName" Width="125px" runat="server"></asp:TextBox><br />
                            <br />
                            Email:
                            <asp:TextBox ID="tbxEmail" Width="200px" runat="server"></asp:TextBox><br />
                            <br />
                            Phone:
                            <asp:TextBox ID="tbxPhone" Width="125px" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tbxPhone"
                                runat="server" ErrorMessage="* Required"></asp:RequiredFieldValidator><br />
                            <br />
                            Zip Code:
                            <asp:TextBox ID="tbxZipCode" Width="100px" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            Credit Card Number:
                            <asp:TextBox ID="tbxCreditCardNumber" Width="175px" runat="server"></asp:TextBox>
                            &nbsp
                            <img alt="Merchant Accounts" title="Merchant Accounts" src="http://www.credit-card-logos.com/images/visa_mastercard_amex_credit-card-logos/mc_vs_ax_accpt_h_023_gif.gif"
                                width="113" height="23" />
                            <br />
                            Expiration:
                            <asp:DropDownList ID="ddlMonth" runat="server">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp / &nbsp
                            <asp:DropDownList ID="ddlYear" runat="server">
                            </asp:DropDownList>
                            <br />
                            <br />
                            Comments and Special Requests:<br />
                            <asp:TextBox ID="tbxComments" Width="350px" Height="75px" TextMode="MultiLine" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            Seated with another party? Enter the name here please:
                            <br />
                            <asp:TextBox ID="tbxSeatedPartyName" Width="150px" runat="server"></asp:TextBox>
                            <br />
                            <br />
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        </div>
                        <asp:Label ID="lblResult" runat="server" ForeColor="#009900"></asp:Label>
                    </div>
                </td>
                <td>
                    <div style="color: #000000; background-image: url(images/legendbackground.gif); background-repeat: no-repeat;
                        height: 440px; width: 290px; padding: 30px; font-family: Arial;">
                        <div style="text-align: center;">
                            Show includes 2 hours of live, rip-roaring, boot-stompin' entertainment, plus all
                            the menu items on our <a href="menu.aspx">dinner fare</a>.</div>
                        <center>
                            <h3 style="text-align: center; color: #bb0000;">
                                Pricing</h3>
                            <div style="width: 275px; border: solid 0px #ff0000; text-align: left; color: #000000;">
                                Adult Price:
                                <asp:Label ID="lblAdultPrice" Font-Bold="true" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;$12
                                off w/o dinner
                                <br />
                                Children Price (4 to 12):
                                <asp:Label ID="lblChildrenPrice" Font-Bold="true" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;$4
                                off w/o dinner<br />
                                <span style="font-size: 14px; color: #ff0000;">(3 and younger are free)</span>
                            </div>
                            <h3 style="text-align: center; color: #bb0000;">
                                Upcoming Shows</h3>
                            <div style="height: 155px; width: 245px; border: solid 3px #bb0000; text-align: left;
                                color: #000000; padding: 15px;">
                                <div id="UpcomingShows" style="overflow: auto; height: 155px; font-size: 13px;" runat="server">
                                </div>
                            </div>
                        </center>
                    </div>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
