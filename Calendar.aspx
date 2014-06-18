<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="Calendar.aspx.cs" Inherits="Schedule" Title="Schedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <!--
Note: You need to paste both of the following lines into your web page. The <ILAYER> line is for Netscape, and the <IFRAME> line is for Internet Explorer.
This style embedded calendar may not display correctly in other browsers. You can adjust the height and width parameters as desired.
-->
        <div style="height: 500px; overflow: auto;">
            <ilayer src="http://www.localendar.com/public/ShowtimeUtah" height="700" width="850"></ilayer>
            <iframe src="http://www.localendar.com/public/ShowtimeUtah" height="700" width="850"
                marginheight="0" marginwidth="0" scrolling="no" frameborder="0" border="0"></iframe>
        </div>
    </center>
</asp:Content>
