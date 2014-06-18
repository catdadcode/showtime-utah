<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" Title="Change Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="color: #000000; background-image: url(images/mainpanel.gif); width: 500px;
        margin-left: auto; margin-right: auto; height: 450px; padding: 25px;">
        Current Password:
        <asp:TextBox ID="tbxCurrentPassword" TextMode="password" Width="150px" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredCurrent" ControlToValidate="tbxCurrentPassword"
            runat="server" ErrorMessage="* Required"></asp:RequiredFieldValidator>
        <asp:CustomValidator ID="cvInvalidPassword" runat="server" ControlToValidate="tbxCurrentPassword"
            ErrorMessage="* Invalid Password"></asp:CustomValidator>
        <br />
        <br />
        <br />
        New Password:
        <asp:TextBox ID="tbxNewPassword" TextMode="password" Width="150px" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvRequired" ControlToValidate="tbxNewPassword" runat="server"
            ErrorMessage="* Required"></asp:RequiredFieldValidator>
        <br />
        <br />
        Confirm Password:
        <asp:TextBox ID="tbxConfirmPassword" TextMode="password" Width="150px" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Required2" ControlToValidate="tbxConfirmPassword"
            runat="server" ErrorMessage="* Required"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cvNoMatch" ControlToCompare="tbxNewPassword" ControlToValidate="tbxConfirmPassword"
            runat="server" ErrorMessage="* Passwords do not match"></asp:CompareValidator>
        <br />
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Change Password" OnClick="btnSubmit_Click" />
    </div>
</asp:Content>
