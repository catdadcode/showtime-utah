<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="Contact.aspx.cs" Inherits="Contact" Title="Contact Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <div id="fullbackdrop">
            <table>
                <tr>
                    <td valign="middle">
                        <img height="250" src="images/Joan.gif" />
                    </td>
                    <td valign="middle">
                        <div style="margin-left: 15px; width: 217px; height: 290px; text-align: left; background-image: url(images/bluebox.gif);
                            background-repeat: no-repeat; padding:20px;">
                            <div id="contactinfo" style="color: #000000; overflow: auto; height: 290px;" runat="server">
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <asp:Button ID="btnEditContact" runat="server" Text="Edit Contact Info" PostBackUrl="EditContact.aspx" />
    </center>
</asp:Content>
