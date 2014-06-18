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

public partial class EditPricing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Response.Redirect("Default.aspx");
        }

        if (!this.IsPostBack)
        {
            StreamReader sr = new StreamReader(MapPath("~/DataFiles/Pricing.stu"));
            tbxSalesTax.Text = sr.ReadLine();
            tbxAdultPrice.Text = sr.ReadLine();
            tbxChildPrice.Text = sr.ReadLine();
            sr.Close();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        StreamWriter sw = new StreamWriter(MapPath("~/DataFiles/Pricing.stu"));
        sw.WriteLine(tbxSalesTax.Text);
        sw.WriteLine(tbxAdultPrice.Text);
        sw.WriteLine(tbxChildPrice.Text);
        sw.Close();
        Response.Redirect("Tickets.aspx");
    }
}
