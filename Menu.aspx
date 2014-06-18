<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="Menu.aspx.cs" Inherits="Menu" Title="Dinner Fare" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <div id="menu">
            <table>
                <tr>
                    <td style="width:275px;vertical-align:top;color:#000000;height:470px;">
                        <h1 style="color:#000000; text-align:center; text-decoration:underline;">
                            Starters</h1>
                        <div id="column1" style="text-align: center; overflow:auto; height:400px;" runat="server">
                        </div>
                    </td>
                    <td style="width:275px;vertical-align:top;color:#000000;height:470px;">
                        <h1 style="color:#000000; text-align:center; text-decoration:underline;">
                            Main Course</h1>
                        <div id="column2" style="text-align: center; overflow:auto; height:400px;" runat="server">
                        </div>
                    </td>
                    <td style="width:275px;vertical-align:top;color:#000000;height:470px;">
                        <h1 style="color:#000000; text-align:center; text-decoration:underline;">
                            Dessert</h1>
                        <div id="column3" style="text-align: center; overflow:auto;height:400px;" runat="server">
                        </div>
                    </td>
                </tr>
            </table>
            <center>
                <asp:Button ID="btnEditMenu" runat="server" Text="Edit Menu" PostBackUrl="~/EditMenu.aspx" />
            </center>
        </div>
    </center>
</asp:Content>
