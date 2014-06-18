<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" Title="About Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <div id="fullbackdrop">
            <div id="aboutus" style="text-align: left; color: #000000; font-size: 20px; overflow: auto;
                height: 320px; padding: 15px;" runat="server">
            </div>
        </div>
        <br />
        <asp:Button ID="btnEditAboutUs" runat="server" Text="Edit About Us" PostBackUrl="EditAboutUs.aspx" />
    </center>
</asp:Content>
