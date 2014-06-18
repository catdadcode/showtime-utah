<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="ManageCouponCodes.aspx.cs" Inherits="ManageCouponCodes" Title="Manage Coupon Codes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <table>
            <tr>
                <td>
                    <div style="color: #000000; background-image: url(images/legendbackground.gif); background-repeat: no-repeat;
                        height: 440px; width: 290px; padding: 30px; font-family: Arial;">
                        <h3 align="center">
                            Coupon Codes</h3>
                        <center>
                            <div style="font-size: 12px; color: #ff0000;">
                                Click a coupon code to edit it.</div>
                            <asp:ListBox ID="lbxCouponCodes" Width="250px" Height="300px" runat="server" AutoPostBack="True"
                                OnSelectedIndexChanged="lbxCouponCodes_SelectedIndexChanged"></asp:ListBox>
                            <br />
                            <br />
                            <asp:Button ID="btnSubmit" runat="server" Text="Save Changes" OnClick="btnSubmit_Click"
                                CausesValidation="False" />
                            <asp:Button ID="btnNewCode" runat="server" Text="New Code" OnClick="btnNewCode_Click"
                                CausesValidation="False" />
                        </center>
                    </div>
                </td>
                <td>
                    <div style="text-align: left; background-image: url(images/mainpanel.gif); background-repeat: no-repeat;
                        height: 470px; width: 520px; margin-left: 15px; padding: 15px; font-family: Arial;">
                        <div id="addoredit" runat="server" style="text-align: center; font-size: 25px;">
                        </div>
                        <br />
                        <asp:CheckBox ID="cbxDelete" Text="Delete Coupon Code" runat="server" AutoPostBack="True"
                            OnCheckedChanged="cbxDelete_CheckedChanged" />
                        <br />
                        <br />
                        Code:
                        <asp:TextBox ID="tbxCode" Width="150px" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tbxCode" runat="server" ErrorMessage="* Required"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        Discount: $<asp:TextBox ID="tbxDiscount" Width="150px" runat="server"></asp:TextBox>
                        <asp:CheckBox ID="cbxBirthday" Text="Birthday Code" AutoPostBack="true" runat="server"
                            OnCheckedChanged="cbxBirthday_CheckedChanged" />
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbxDiscount"
                            ErrorMessage="* Not valid US currency." ValidationExpression="^\$?(\d{1,3},?(\d{3},?)*\d{3}(\.\d{0,2})?|\d{1,3}(\.\d{0,2})?|\.\d{1,2}?)$"></asp:RegularExpressionValidator>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="tbxDiscount"
                            ErrorMessage="* Discount Amount Required." OnServerValidate="CustomValidator1_ServerValidate"
                            ValidateEmptyText="True"></asp:CustomValidator><br />
                        <asp:CheckBox ID="cbxApplyAdults" Text="Applies to adult tickets." runat="server" />
                        &nbsp
                        <asp:CheckBox ID="cbxApplyChildren" Text="Applies to child tickets." runat="server" />
                        <br />
                        <br />
                        Number of tickets required:
                        <asp:TextBox ID="tbxNumberRequired" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="tbxNumberRequired" runat="server" ErrorMessage="* Required"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbxNumberRequired"
                            ErrorMessage="* Must be a positive number." ValidationExpression="^(0)$|^([1-9][0-9]*)$"></asp:RegularExpressionValidator><br />
                        <asp:Button ID="btnAddEditCode" runat="server" Text="Add Coupon Code" OnClick="btnAddEditCode_Click" />
                        <br />
                        <br />
                        <div style="color: #ff0000; font-size: 14px;">
                            *NOTE: After adding or editing your codes, don't forget to click "Save Changes"
                            in the bottom left*</div>
                    </div>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
