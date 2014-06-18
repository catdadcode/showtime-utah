<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="EditHotSpot.aspx.cs" Inherits="EditHotSpot" Title="Edit Hot Spot" ValidateRequest="false" %>

<%@ Register Assembly="ColorPickerLib" Namespace="ColorPickerLib" TagPrefix="cc2" %>
<%--<%@ Register Assembly="RichTextEditor" Namespace="AjaxControls" TagPrefix="cc1" %>--%>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <div id="fullbackdrop2">
            Hot Spot Title:
            <asp:TextBox ID="tbxTitle" Width="200px" runat="server"></asp:TextBox><asp:TextBox
                ID="tbxColor" Width="60px" runat="server"></asp:TextBox>
            <cc2:ColorPicker ID="colorPicker2" runat="server" ControlToSet-ID="tbxColor" />
            <span style="font-size: 14px; color: #000000;"><-- Click the color pallette to choose
                a color.</span><br />
            <table style="border: solid 0px #000000;">
                <tr>
                    <td valign="middle">
                        Hot Spot Image:
                        <asp:FileUpload ID="fuImage" runat="server" />
                    </td>
                    <td valign="middle">
                        <div style="margin-left: 50px; font-size: 12px;">
                            <center>
                                Current Hot Spot Image:<br />
                                <asp:Image ID="imgCurrentImage" Height="50" runat="server" />
                            </center>
                        </div>
                    </td>
                </tr>
            </table>
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
                            CausesValidation="False" />
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
            <span style="color: #ff0000; font-size: 14px;">* Images are added to the bottom of the
                content window. If you don't see your image then scroll down.</span>
            <br />
            <cc1:RichTextEditor ID="rteBody" BackColor="#6FAEE7" Width="500" Height="175" runat="server"
                DomMode="False"></cc1:RichTextEditor>--%>
            <FCKeditorV2:FCKeditor ID="rteBody" ToolbarSet="STUCustom" Width="500px" Height="300px"
                BasePath="fckeditor/" runat="server">
            </FCKeditorV2:FCKeditor>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Changes" OnClick="btnSubmit_Click" />
        </div>
    </center>
</asp:Content>
