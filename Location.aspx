<%@ Page Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true"
    CodeFile="Location.aspx.cs" Inherits="Location" Title="Location" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <div id="fullbackdrop">
            <table width="850">
                <tr>
                    <td style="vertical-align: middle; text-align: center;">
                        <iframe width="325" height="250" frameborder="1" scrolling="no" marginheight="0"
                            marginwidth="0" src="http://maps.google.com/maps?f=d&amp;hl=en&amp;geocode=&amp;saddr=&amp;daddr=20+S.+Main+Street+Pleasant+Grove+Utah+84062&amp;mra=ps&amp;mrcr=0&amp;sll=40.363653,-111.74076&amp;sspn=0.008976,0.023217&amp;ie=UTF8&amp;ll=40.363653,-111.74076&amp;spn=0.008976,0.023217&amp;output=embed&amp;s=AARTsJpjMfQ4PfI9KWbt86__QbVf3Giy-g">
                        </iframe>
                        <br />
                        <a href="http://maps.google.com/maps?f=d&amp;hl=en&amp;geocode=&amp;saddr=&amp;daddr=20+S.+Main+Street+Pleasant+Grove+Utah+84062&amp;mra=ps&amp;mrcr=0&amp;sll=40.363653,-111.74076&amp;sspn=0.008976,0.023217&amp;ie=UTF8&amp;ll=40.363653,-111.74076&amp;spn=0.008976,0.023217&amp;source=embed"
                            target="_blank" class="style10" style="color: #FFff00; text-align: left"><span class="style11">
                                Click Here for Directions</span></a>
                    </td>
                    <td style="vertical-align: middle; text-align: center;">
                        <h1>
                            Showtime Utah</h1>
                        <b>is located at:<br />
                            <br />
                            20 S. Main Street<br />
                            Pleasant Grove, UT 84062
                            <br />
                            <br />
                            (located at the Grove Event Center)</b>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; vertical-align: middle;">
                        <span style="font-size: 25px;">Easy directions from I-15</span><br />
                        From I-15 take exit 275. Go East exactly 2 miles to the 4-way stop at Center and
                        Main Streets Turn right.
                        <br />
                        We are the second building on the right. (Just FYI - Pleasant Grove BLVD changes
                        to Center St. at State St.)
                    </td>
                </tr>
            </table>
        </div>
    </center>
</asp:Content>
