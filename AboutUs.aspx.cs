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

public partial class AboutUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
            btnEditAboutUs.Visible = true;
        else
            btnEditAboutUs.Visible = false;

        StreamReader sr = new StreamReader(MapPath("~/DataFiles/AboutUs.stu"));
        aboutus.InnerHtml = sr.ReadToEnd();
        sr.Close();
    }
}
