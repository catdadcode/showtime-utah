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

public partial class EditMenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Response.Redirect("Default.aspx");
        }

        if (!this.IsPostBack)
        {
            StreamReader sr = new StreamReader(MapPath("~/DataFiles/Starters.stu"));
            tbxStarters.Text = sr.ReadToEnd();
            if (tbxStarters.Text.Length > 2)
                tbxStarters.Text = tbxStarters.Text.Remove(tbxStarters.Text.Length - 2);
            sr.Close();

            sr = new StreamReader(MapPath("~/DataFiles/MainCourse.stu"));
            tbxMainCourse.Text = sr.ReadToEnd();
            if (tbxMainCourse.Text.Length > 2)
                tbxMainCourse.Text = tbxMainCourse.Text.Remove(tbxMainCourse.Text.Length - 2);
            sr.Close();

            sr = new StreamReader(MapPath("~/DataFiles/Dessert.stu"));
            tbxDessert.Text = sr.ReadToEnd();
            if (tbxDessert.Text.Length > 2)
                tbxDessert.Text = tbxDessert.Text.Remove(tbxDessert.Text.Length - 2);
            sr.Close();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        StreamWriter sw = new StreamWriter(MapPath("~/DataFiles/Starters.stu"));
        sw.WriteLine(tbxStarters.Text);
        sw.Close();

        sw = new StreamWriter(MapPath("~/DataFiles/MainCourse.stu"));
        sw.WriteLine(tbxMainCourse.Text);
        sw.Close();

        sw = new StreamWriter(MapPath("~/DataFiles/Dessert.stu"));
        sw.WriteLine(tbxDessert.Text);
        sw.Close();

        Response.Redirect("Menu.aspx");
    }
}
