<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="EditPricing.aspx.cs" Inherits="EditPricing" Title="Edit Pricing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <div style="text-align: left; background-image: url(images/mainpanel.gif); background-repeat: no-repeat;
            height: 470px; width: 520px; margin-left: 15px; padding: 15px; font-family: Arial;text-align:left;">
            <div style="text-align:center;font-size:25px;">Edit Pricing</div>
            <br />
            Sales Tax: 
            $<asp:TextBox ID="tbxSalesTax" Width="100px" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="* Not a valid decimal number." ControlToValidate="tbxSalesTax" ValidationExpression="^(?=.*[1-9].*$)\d{0,7}(?:\.\d{0,9})?$"></asp:RegularExpressionValidator>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxSalesTax"
                ErrorMessage="* Sales Tax Required"></asp:RequiredFieldValidator><br />
            Adult Ticket Price: 
            $<asp:TextBox ID="tbxAdultPrice" Width="100px" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbxAdultPrice"
                ErrorMessage="* Not valid US currency." ValidationExpression="^\$?(\d{1,3},?(\d{3},?)*\d{3}(\.\d{0,2})?|\d{1,3}(\.\d{0,2})?|\.\d{1,2}?)$"></asp:RegularExpressionValidator><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxAdultPrice"
                ErrorMessage="* Adult Price Required"></asp:RequiredFieldValidator><br />
            Child Ticket Price:
            $<asp:TextBox ID="tbxChildPrice" Width="100px" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tbxChildPrice"
                ErrorMessage="* Not valid US currency." ValidationExpression="^\$?(\d{1,3},?(\d{3},?)*\d{3}(\.\d{0,2})?|\d{1,3}(\.\d{0,2})?|\.\d{1,2}?)$"></asp:RegularExpressionValidator><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbxChildPrice"
                ErrorMessage="* Child Price Required"></asp:RequiredFieldValidator><br />
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Changes" OnClick="btnSubmit_Click" />
        </div>
    </center>
</asp:Content>
