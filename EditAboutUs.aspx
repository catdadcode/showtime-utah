<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="EditAboutUs.aspx.cs" Inherits="EditAboutUs" Title="Edit About Us" ValidateRequest="false" %>

<%--<%@ Register Assembly="RichTextEditor" Namespace="AjaxControls" TagPrefix="cc1" %>--%>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <div id="fullbackdrop2">
            <%--<table>
                <tr>
                    <td valign="middle">
                        Upload New Image:
                        <asp:FileUpload ID="fuContentImage" runat="server" />
                        <asp:Button ID="btnUpload" runat="server" Text="Upload & Add" OnClick="btnUpload_Click"
                            CausesValidation="False" OnClientClick="CopyText()" />
                        <br />
                        Add Existing Image:
                        <asp:DropDownList Width="200" ID="ddlExistingImages" runat="server">
                            <asp:ListItem>Not Selected</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="btnAddImage" runat="server" Text="Add Image" OnClick="btnAddImage_Click"
                            CausesValidation="False" OnClientClick="CopyText()" />
                    </td>
                    <td valign="middle">
                        <span style="font-size: 14px;">* The buttons below control where text wraps around
                            the image.</span>
                        <asp:RadioButtonList ID="rblFloat" RepeatDirection="horizontal" runat="server">
                            <asp:ListItem Selected="true">No Float</asp:ListItem>
                            <asp:ListItem>Float Right</asp:ListItem>
                            <asp:ListItem>Float Left</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </table>
            <span style="color: #000000; font-size: 14px;">* Images are added to the bottom of the
                content window. If you don't see your image then scroll down.</span>
            <br />
            <cc1:RichTextEditor ID="rteBody" BackColor="#6FAEE7" Width="744" Height="300" runat="server" DomMode="False">
            </cc1:RichTextEditor>--%>
            <FCKeditorV2:FCKeditor ID="rteBody" ToolbarSet="STUCustom" Width="97%" Height="400px"
                BasePath="fckeditor/" runat="server">
            </FCKeditorV2:FCKeditor>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Changes" OnClick="btnSubmit_Click" />
        </div>
    </center>
</asp:Content>
