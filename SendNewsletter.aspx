<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="SendNewsletter.aspx.cs" Inherits="SendNewsletter" Title="Send Newsletter"
    ValidateRequest="false" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script type="text/javascript">
window.onload = function(){
        var strCook = document.cookie;
        if(strCook.indexOf("!~")!=0){
          var intS = strCook.indexOf("!~");
          var intE = strCook.indexOf("~!");
          var strPos = strCook.substring(intS+2,intE);
          document.getElementById("scrollbox").scrollTop = strPos;
            }
        }
      function SetDivPosition(){
        var intY = document.getElementById("scrollbox").scrollTop;

        document.cookie = "yPos=!~" + intY + "~!";
        }
    </script>

    <center>
        <div id="scrollbox" style="background-image: url(images/grid2.gif); height: 450px;
            overflow: auto; padding: 25px;" onscroll="SetDivPosition()">
            <div style="width: 700px; border: dashed 5px #000000; background-color:#FFFFFF;">
                <div style="background-color: #000000;height:153px;">
                    <img src="images/nlbanner.jpg" width="700" />
                </div>
                <div style="background-color: #ffffff; text-align: left;">
                    <center>
                        <asp:Button ID="btnHeader" runat="server" Text="Edit Header" PostBackUrl="~/editheader.aspx" /></center>
                    <div id="letterheader" runat="server">
                    </div>
                </div>
                <div id="letterbody">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="vertical-align: top; width: 350px; background-color: #ffffff;">
                                <center>
                                    <asp:Button ID="btnEditColumn1" runat="server" Text="Edit This Column" PostBackUrl="~/EditColumn.aspx?n=1&f=newsletter/column" /></center>
                                <div id="column1" runat="server">
                                </div>
                            </td>
                            <td style="vertical-align: top; width: 350px; background-color: #ffffff;">
                                <center>
                                    <asp:Button ID="btnEditColumn2" runat="server" Text="Edit This Column" PostBackUrl="~/EditColumn.aspx?n=2&f=newsletter/column" /></center>
                                <div id="column2" runat="server">
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div style="padding: 5px; font-size: 14px; color: #000000; background-color: #FFF0BA;
                        text-align: left;">
                        Click <u style="color: #0000ff;">here</u> to unsubscribe.</div>
                </div>
            </div>
            <br />
            <div id="sendbox" style="border: dashed 5px #000000;width:500px;background-color:#FFF0BA;color:#000000;padding:15px;" runat="server">
            <b>Email subject for newsletter:</b>
            <asp:TextBox ID="tbxSubject" Width="200px" Text="ShowTime Utah Newsletter" runat="server"></asp:TextBox>
            <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxSubject"
                    ErrorMessage="* Subject Required."></asp:RequiredFieldValidator><br />
            <asp:Button ID="btnSendNewsletter" runat="server" Text="Send Newsletter" OnClick="btnSendNewsletter_Click" />
            </div>
            <br />
            <br />
        </div>
    </center>
</asp:Content>
