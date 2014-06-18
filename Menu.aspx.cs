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

public partial class Menu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            btnEditMenu.Visible = true;
        }
        else
        {
            btnEditMenu.Visible = false;
        }

        StreamReader sr = new StreamReader(MapPath("~/DataFiles/Starters.stu"));
        LiteralControl lc = new LiteralControl(sr.ReadToEnd().Replace("\r", "<br />").Replace("\n", ""));
        column1.Controls.Add(lc);
        sr.Close();

        sr = new StreamReader(MapPath("~/DataFiles/MainCourse.stu"));
        lc = new LiteralControl(sr.ReadToEnd().Replace("\r", "<br />").Replace("\n", ""));
        column2.Controls.Add(lc);
        sr.Close();

        sr = new StreamReader(MapPath("~/DataFiles/Dessert.stu"));
        lc = new LiteralControl(sr.ReadToEnd().Replace("\r", "<br />").Replace("\n", ""));
        column3.Controls.Add(lc);
        sr.Close();
    }
}
