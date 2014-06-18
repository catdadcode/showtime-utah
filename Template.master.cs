using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class chevtek_ShowTimeUtah_Template : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Note To New Developers. This code has been optimized in an easy to read fashion.
        //Hopefully we at Chevtek Web Solutions will be the only ones to have to access this
        //in the future, but in the event you have been hired to make changes to this site
        //you can contact us with any questions. Support@Chevtek.com or by phone (801) 669-6663.

        //if ((DateTime.Now.Month == 12)&&(DateTime.Now.Day <= 25))
        //{
        //    stylesheet.InnerHtml = "<link rel=\"Stylesheet\" type=\"text/css\" href=\"xmasstyle.css\" />";
        //}
        //else
        //{
            stylesheet.InnerHtml = "<link rel=\"Stylesheet\" type=\"text/css\" href=\"StyleSheet.css\" />";
        //}

        Page.Title += " | ShowTimeUtah.com";
        Page.MaintainScrollPositionOnPostBack = true;
        if (!Page.User.Identity.IsAuthenticated)
            ((LiteralControl)(LoginView1.Controls[0].Controls[0])).Text = "<div style=\"width: 32px; padding: 3px; background-color: #ffffcc; border: solid 1px #000000;\"><a href=\"login.aspx?returnurl=" + Request.FilePath + "\"><img border=\"0\" alt=\"login\" src=\"images/admin.gif\" /></a></div>";
    }
}
