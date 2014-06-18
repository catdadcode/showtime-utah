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

public partial class EditContact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Response.Redirect("Default.aspx");
        }

        if (!this.IsPostBack)
        {
            StreamReader sr = new StreamReader(MapPath("~/DataFiles/ContactInfo.stu"));
            tbxContactInfo.Text = sr.ReadToEnd();
            sr.Close();
            if (tbxContactInfo.Text.Length > 2)
                tbxContactInfo.Text = tbxContactInfo.Text.Remove(tbxContactInfo.Text.Length - 2);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        StreamWriter sw = new StreamWriter(MapPath("~/DataFiles/ContactInfo.stu"));
        sw.WriteLine(tbxContactInfo.Text);
        sw.Close();
        Response.Redirect("Contact.aspx");
    }
}
