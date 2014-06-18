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

public partial class Concerts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            StreamReader sr = new StreamReader(MapPath("~/DataFiles/concerts1.stu"));
            string sBackColor = sr.ReadLine();
            string sForeColor = "#000000";
            if (sBackColor == "#000000")
                sForeColor = "#ffffff";
            column1.InnerHtml = "<div style=\"padding:15px;color:" + sForeColor + ";background-color:" + sBackColor + ";\">";
            column1.InnerHtml += sr.ReadToEnd();
            column1.InnerHtml += "</div>";
            sr.Close();

            sr = new StreamReader(MapPath("~/DataFiles/concerts2.stu"));
            sBackColor = sr.ReadLine();
            sForeColor = "#000000";
            if (sBackColor == "#000000")
                sForeColor = "#ffffff";
            column2.InnerHtml = "<div style=\"padding:15px;color:" + sForeColor + ";background-color:" + sBackColor + ";\">";
            column2.InnerHtml += sr.ReadToEnd();
            column2.InnerHtml += "</div>";
            sr.Close();

            sr = new StreamReader(MapPath("~/DataFiles/concerts3.stu"));
            sBackColor = sr.ReadLine();
            sForeColor = "#000000";
            if (sBackColor == "#000000")
                sForeColor = "#ffffff";
            column3.InnerHtml = "<div style=\"padding:15px;color:" + sForeColor + ";background-color:" + sBackColor + ";\">";
            column3.InnerHtml += sr.ReadToEnd();
            column3.InnerHtml += "</div>";
            sr.Close();

            if (User.Identity.IsAuthenticated)
            {
                btnEdit1.Visible = true;
                btnEdit2.Visible = true;
                btnEdit3.Visible = true;
            }
            else
            {
                btnEdit1.Visible = false;
                btnEdit2.Visible = false;
                btnEdit3.Visible = false;
            }
        }
    }
}
