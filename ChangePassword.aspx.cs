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
using System.IO;

public partial class ChangePassword : System.Web.UI.Page
{
    string sCurrentPassword;
    string sUsername;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Response.Redirect("Default.aspx");
        }

        if (!this.IsPostBack)
        {
            StreamReader sr = new StreamReader(MapPath("~/DataFiles/AdminCredentials.stu"));
            sUsername = sr.ReadLine();
            sCurrentPassword = sr.ReadLine();
            this.ViewState["CurrentPassword"] = sCurrentPassword;
            this.ViewState["Username"] = sUsername;
            sr.Close();
        }
        else
        {
            sCurrentPassword = this.ViewState["CurrentPassword"].ToString();
            sUsername = this.ViewState["Username"].ToString();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (tbxCurrentPassword.Text == sCurrentPassword)
        {
            cvInvalidPassword.IsValid = true;

            StreamWriter sw = new StreamWriter(MapPath("~/DataFiles/AdminCredentials.stu"));
            sw.WriteLine(sUsername);
            sw.WriteLine(tbxNewPassword.Text);
            sw.Close();

            Response.Write("<h2 style=\"text-align:center;color:009900;\">Password successfully changed.</h2><center><a href=\"http://www.showtimeutah.com\">(Click here to continue)</a></center>");
            Response.Flush();
            Response.Close();
        }
        else
        {
            cvInvalidPassword.IsValid = false;
        }
    }
}
