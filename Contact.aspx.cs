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

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
            btnEditContact.Visible = true;
        else
            btnEditContact.Visible = false;
        StreamReader sr = new StreamReader(MapPath("~/DataFiles/ContactInfo.stu"));
        contactinfo.InnerHtml = sr.ReadToEnd().Replace("\r", "<br />").Replace("\n", "");
        sr.Close();
    }
}
