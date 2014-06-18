<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="Newsletter.aspx.cs" Inherits="Newsletter" Title="Newsletter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="newsletterpanel">
        <div id="admin" style="text-align: left; overflow: auto; height: 400px;" runat="server">
            <center>
                <div style="font-size: 20px; text-align: center;" id="newslettercount" runat="server">
                </div>
                <br />
                <asp:Button ID="btnSendNewsletter" CausesValidation="false" runat="server" Text="Preview and Send Newsletter"
                    OnClick="btnSendNewsletter_Click" /></center>
            <br />
            Or use this form to add new email address to the newsletter list. As the admin you
            can add multiple email addresses at once. Just separate them by a semi-colon (;).<br />
            <asp:TextBox ID="tbxAddEmails" TextMode="multiLine" Width="400px" Height="100px"
                runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnAddEmails" runat="server" OnClick="btnAddEmails_Click" Text="Add Emails" />
            <!--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbxAddEmails"
                ErrorMessage="* One or more email addresses are invalid." ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*([,;]\s*\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*)*"></asp:RegularExpressionValidator>-->
            <hr />
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    If you are having emails returned as bad, feel free to delete them using the form
                    below. Type something in the search box to find specific addresses or leave it blank
                    and click search to get all emails on the list. Hold down CTRL to select multiple
                    email addresses.<br />
                    <br />
                    <%--<br />
            <asp:ListBox ID="lbxDeleteEmails" SelectionMode="Multiple" Width="300px" Height="350px"
                runat="server"></asp:ListBox>
            <br />
            <asp:Button ID="btnDelete" runat="server" Text="Delete Selected" OnClick="btnDelete_Click"
                CausesValidation="False" />
            <br />
            <br />--%>
                    <asp:TextBox ID="tbxSearch" Width="225px" runat="server">
                    </asp:TextBox>
                    <asp:Button Width="65px" ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" /><br />
                    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="0"
                        runat="server">
                        <ProgressTemplate>
                            <br />
                            <img alt="Loading..." width="300px" height="15px" src="images/ajax-loader.gif" />
                            <br />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <br />
                    <asp:ListBox ID="lbxResults" SelectionMode="Multiple" Width="300px" Height="300px"
                        runat="server"></asp:ListBox>
                    <br />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:Button ID="btnDeleteFromSearch" runat="server" Text="Delete Selected" OnClick="btnDeleteFromSearch_Click" />
        </div>
        <div id="signup" runat="server">
            <div style="color: #ffffcc; text-align: center; font-size: 35px;">
                Sign up for our newsletter!</div>
            <br />
            Email:
            <asp:TextBox ID="tbxEmail" Width="250px" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="revEmail" ControlToValidate="tbxEmail" runat="server"
                ErrorMessage="* Not a valid email." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="rfvRequired" ControlToValidate="tbxEmail" runat="server"
                ErrorMessage="* Required."></asp:RequiredFieldValidator>
            <br />
            Confirm Email:
            <asp:TextBox ID="tbxConfirmEmail" Width="250px" runat="server"></asp:TextBox>
            <br />
            <asp:RegularExpressionValidator ID="revEmail2" ControlToValidate="tbxConfirmEmail"
                runat="server" ErrorMessage="* Not a valid email." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="rfvRequired2" ControlToValidate="tbxConfirmEmail"
                runat="server" ErrorMessage="* Required."></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvCompare" ControlToValidate="tbxConfirmEmail" ControlToCompare="tbxEmail"
                runat="server" ErrorMessage="* Emails do not match."></asp:CompareValidator>
            <br />
            <br />
            <img src="JpegImage.aspx" /><br />
            <br />
            Enter the code above in the box below.
            <br />
            <br />
            <asp:TextBox ID="tbxCode" runat="server"></asp:TextBox>
            <asp:CustomValidator ID="cvInvalidCode" runat="server" ErrorMessage="* Invalid Code"></asp:CustomValidator>
            <br />
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Sign Up!" OnClick="btnSubmit_Click" />
        </div>
        <div id="unsubscribe" runat="server">
            <center>
                <h3>
                    If you wish to unsubscribe from our newsletter, please type your email in the box
                    below and click "Unsubscribe Me".</h3>
                <asp:TextBox ID="tbxUnsubscribe" Width="300px" runat="server"></asp:TextBox>
                <asp:Button ID="btnUnusubscribe" runat="server" Text="Unsubscribe Me" OnClick="btnUnusubscribe_Click" />
            </center>
        </div>
    </div>
</asp:Content>
