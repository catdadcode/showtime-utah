<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="EditMenu.aspx.cs" Inherits="EditMenu" Title="Edit Menu" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <div id="menu">
            <table>
                <tr>
                    <td style="width:275px;vertical-align:top;color:#000000;height:470px;">
                        <h1 style="color:#000000; text-align:center; text-decoration:underline;">
                            Starters</h1>
                        <center>
                            <asp:TextBox ID="tbxStarters" Height="375px" Width="250px" TextMode="multiLine" runat="server"></asp:TextBox>
                        </center>
                    </td>
                    <td style="width:275px;vertical-align:top;color:#000000;height:470px;">
                        <h1 style="color:#000000; text-align:center; text-decoration:underline;">
                            Main Course</h1>
                        <center>
                            <asp:TextBox ID="tbxMainCourse" Height="375px" Width="250px" TextMode="multiLine"
                                runat="server"></asp:TextBox>
                        </center>
                    </td>
                    <td style="width:275px;vertical-align:top;color:#000000;height:470px;">
                        <h1 style="color:#000000; text-align:center; text-decoration:underline;">
                            Dessert</h1>
                        <center>
                            <asp:TextBox ID="tbxDessert" Height="375px" Width="250px" TextMode="multiLine" runat="server"></asp:TextBox>
                        </center>
                    </td>
                </tr>
            </table>
            <center>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Changes" OnClick="btnSubmit_Click" />
            </center>
        </div>
    </center>
</asp:Content>
