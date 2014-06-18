<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="login.aspx.cs" Inherits="login" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <center>
        <div style="background-image: url(images/loginbackdrop.gif); background-repeat: no-repeat;
            width: 400px; height: 205px; background-position: center;">
            <br />
            <asp:Login ID="Login1" runat="server" ForeColor="White" FailureText="Invalid username or password." Height="156px" LoginButtonText="Sign In" OnAuthenticate="Login1_Authenticate" TitleText="Administrator Sign In" Width="318px">
            </asp:Login>
        </div>
    </center>
</asp:Content>
