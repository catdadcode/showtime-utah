<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="ManageShows.aspx.cs" Inherits="ManageShows" Title="Manage Shows" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <table>
            <tr>
                <td>
                    <div style="color: #000000; background-image: url(images/legendbackground.gif); background-repeat: no-repeat;
                        height: 440px; width: 290px; padding: 30px; font-family: Arial;">
                        <h3 align="center">
                            Current Shows</h3>
                        <center>
                        <span style="font-size:12px;color:#ff0000;">Click a show to edit it.</span>
                            <asp:ListBox ID="lbxShows" Width="275px" Height="300px" runat="server" AutoPostBack="True"
                                OnSelectedIndexChanged="lbxShows_SelectedIndexChanged" AppendDataBoundItems="True"></asp:ListBox>
                                <br />
                                <br />
                                <asp:Button ID="btnSubmit" runat="server" Text="Save Changes" OnClick="btnSubmit_Click" CausesValidation="False" />
                                <asp:Button ID="btnNewShow" runat="server" Text="New Show" OnClick="btnNewShow_Click" CausesValidation="False" />
                        </center>
                    </div>
                </td>
                <td>
                    <div style="text-align: left; background-image: url(images/mainpanel.gif); background-repeat: no-repeat;
                        height: 470px; width: 520px; margin-left: 15px; padding: 15px; font-family: Arial;">
                        <div id="addoredit" style="text-align: center; font-size: 25px;" runat="server">
                        </div>
                        <br />
                        <asp:CheckBox ID="cbxDelete" Text="Delete Show" runat="server" AutoPostBack="True"
                            OnCheckedChanged="cbxDelete_CheckedChanged" />
                        <br />
                        <br />
                        Show Name:
                        <asp:TextBox ID="tbxShowName" Width="200px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxShowName"
                            ErrorMessage="* Name Required."></asp:RequiredFieldValidator><br />
                        <br />
                        Weekday:
                        <asp:DropDownList ID="ddlDayOfWeek" runat="server">
                            <asp:ListItem>Monday</asp:ListItem>
                            <asp:ListItem>Tuesday</asp:ListItem>
                            <asp:ListItem>Wednesday</asp:ListItem>
                            <asp:ListItem>Thursday</asp:ListItem>
                            <asp:ListItem>Friday</asp:ListItem>
                            <asp:ListItem>Saturday</asp:ListItem>
                            <asp:ListItem>Sunday</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                        Month:
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
                        &nbsp &nbsp &nbsp Day:
                        <asp:DropDownList ID="ddlDay" runat="server">
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
                            <asp:ListItem>31</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp &nbsp &nbsp Year:
                        <asp:DropDownList ID="ddlYear" runat="server">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Button ID="btnAddEditShow" runat="server" Text="Add Show" OnClick="btnAddEditShow_Click" />
                        <br />
                        <br />
                        <div style="color:#ff0000;font-size:14px;">*NOTE: Shows earlier than today's date will not be displayed*</div>
                        <br />
                        <div style="color:#ff0000;font-size:14px;">*NOTE: If the first part of the name is "NO SHOW" then no tickets can be purchased for it.*</div>
                    </div>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
