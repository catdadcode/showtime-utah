<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="EditContact.aspx.cs" Inherits="EditContact" Title="Edit Contact Info"
    ValidateRequest="false" %>

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
                            background-repeat: no-repeat; padding: 20px;">
                            <center>
                                <asp:TextBox ID="tbxContactInfo" Width="212px" Height="285px" TextMode="multiLine"
                                    runat="server"></asp:TextBox>
                            </center>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Changes" OnClick="btnSubmit_Click" />
    </center>
</asp:Content>
