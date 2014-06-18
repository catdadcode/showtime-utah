using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Dessert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AuthToken"] == null)
            Response.Redirect("login.aspx");
        else
        {
            if (!IsPostBack)
            {
                ShowsTableAdapters.ShowSelectALLTableAdapter ssat = new ShowsTableAdapters.ShowSelectALLTableAdapter();
                ddlShow.DataTextField = "Name";
                ddlShow.DataValueField = "ShowID";
                ddlShow.DataSource = ssat.GetData();
                ddlShow.DataBind();
            }
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        DessertsTableAdapters.DessertSelectByShowIDTableAdapter dsta = new DessertsTableAdapters.DessertSelectByShowIDTableAdapter();
        long id = long.Parse(dsta.DessertsInsert(txtBxName.Text, txtBxDesc.Text, long.Parse(ddlShow.SelectedValue)).ToString());

        string message;
        if (id > 0)
        {
            message = "Insertion Successful";
            ClearForm();
        }
        else
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            message = "Insertion Failed";
        }

        lblMessage.Text = message;
        lblMessage.Visible = true;
    }

    private void ClearForm()
    {
        txtBxName.Text = string.Empty;
        txtBxDesc.Text = string.Empty;

    }
}
