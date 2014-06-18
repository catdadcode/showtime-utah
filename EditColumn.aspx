<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="EditColumn.aspx.cs" Inherits="EditConcerts" Title="Edit Column" ValidateRequest="false" %>

<%@ Register Assembly="ColorPickerLib" Namespace="ColorPickerLib" TagPrefix="cc2" %>
<%--<%@ Register Assembly="RichTextEditor" Namespace="AjaxControls" TagPrefix="cc1" %>--%>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <table>
            <tr>
                <td style="width: 900px; height: 500px; text-align: left; vertical-align: top; padding: 15px;
                    color: #ffffff;">
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
                                <span style="font-size: 14px;">* The buttons below control where text wraps around the
                                    image.</span>
                                <asp:RadioButtonList ID="rblFloat" RepeatDirection="horizontal" runat="server">
                                    <asp:ListItem Selected="true">No Float</asp:ListItem>
                                    <asp:ListItem>Float Right</asp:ListItem>
                                    <asp:ListItem>Float Left</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                    </table>
                    <span style="color: #ffffcc; font-size: 14px;">* Images are added to the bottom of the
                        content window. If you don't see your image then scroll down.</span>
                    <br />
                    <br />--%>
                    Column Background Color:
                    <cc2:ColorPicker ID="colorPicker1" runat="server" ControlToSet-ID="tbxColor" />
                    <span style="font-size: 14px; color: #ffffcc;"><-- Click the color pallette to choose
                        a color.</span>
                    <br />
                    <asp:TextBox ID="tbxColor" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <center>
                        <%--<cc1:RichTextEditor ID="rteColumn" BackColor="#6FAEE7" Width="350" Height="200" runat="server"
                            DomMode="False"></cc1:RichTextEditor>--%>
                            <FCKeditorV2:FCKeditor ID="rteColumn" ToolbarSet="STUCustom" Width="500px" Height="350px"
                BasePath="fckeditor/" runat="server">
            </FCKeditorV2:FCKeditor>
                    </center>
                    <br />
                    <center>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit Changes"
                            OnClick="btnSubmit_Click" /></center>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
