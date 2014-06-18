<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="Concerts.aspx.cs" Inherits="Concerts" Title="Concerts" ValidateRequest="false" %>

<%@ Register Assembly="RichTextEditor" Namespace="AjaxControls" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <table>
            <tr>
                <td style="width: 300px; height: 420px; text-align: left; vertical-align: top;">
                    <div id="column1" style="overflow: auto; height: 420px; text-align: left;
                        color: #ffffff;" runat="server">
                    </div>
                    <center>
                        <asp:Button ID="btnEdit1" runat="server" Text="Edit This Column" PostBackUrl="~/EditColumn.aspx?n=1&f=concerts" /></center>
                </td>
                <td style="width: 300px; height: 420px; text-align: left; vertical-align: top;">
                    <div id="column2" style="overflow: auto; height: 420px; text-align: left;
                        color: #ffffff;" runat="server">
                    </div>
                    <center>
                        <asp:Button ID="btnEdit2" runat="server" Text="Edit This Column" PostBackUrl="~/EditColumn.aspx?n=2&f=concerts" /></center>
                </td>
                <td style="width: 300px; height: 420px; text-align: left; vertical-align: top;">
                    <div id="column3" style="overflow: auto; height: 420px; text-align: left;
                        color: #ffffff;" runat="server">
                    </div>
                    <center>
                        <asp:Button ID="btnEdit3" runat="server" Text="Edit This Column" PostBackUrl="~/EditColumn.aspx?n=3&f=concerts" /></center>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
