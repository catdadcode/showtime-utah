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

public partial class AddEditShow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            long showID = Request["ShowID"] != null ? Int64.Parse(Request["ShowID"].ToString()) : 0;

            if (showID > 0)
            {
                hdShow.Value = showID.ToString();
                ShowsTableAdapters.ShowSelectALLTableAdapter stat = new ShowsTableAdapters.ShowSelectALLTableAdapter();
                Shows.ShowSelectALLRow dr = (Shows.ShowSelectALLRow)stat.GetDataByID(showID).Rows[0];
                txtBxName.Text = dr.Name;
                txtBxDesc.Text = dr.IsDescriptionNull() ? String.Empty : dr.Description;
                txtBxShowDate.Text = String.Format("{0:d}",dr.Date);
                txtBxTicketPrice.Text = String.Format("{0:C}",dr.Price);
                txtBxTicketQuantity.Text = dr.Quantity.ToString();
                txtBxMusic.Text = dr.IsMusicNull() ? String.Empty : dr.Music;
            }
        }
    }
    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if (Wizard1.ActiveStepIndex == 0)
        {
            //ShowsTableAdapters.ShowSelectALLTableAdapter ssat = new ShowsTableAdapters.ShowSelectALLTableAdapter();
            //ddlShowMeals.DataTextField = "Name";
            //ddlShowMeals.DataValueField = "ShowID";
            //ddlShowMeals.DataSource = ssat.GetData();
            //ddlShowMeals.DataBind();
            lblMealShowName.Text = txtBxName.Text;
        }
        else if (Wizard1.ActiveStepIndex == 1)
        {
            //ShowsTableAdapters.ShowSelectALLTableAdapter ssat = new ShowsTableAdapters.ShowSelectALLTableAdapter();
            //ddlShowDesserts.DataTextField = "Name";
            //ddlShowDesserts.DataValueField = "ShowID";
            //ddlShowDesserts.DataSource = ssat.GetData();
            //ddlShowDesserts.DataBind();
            lblDessertShowName.Text = txtBxName.Text;
        }
    }
    
    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {

    }

    protected void btnAddShow_Click(object sender, EventArgs e)
    {
        ShowsTableAdapters.ShowsInsertUpdate sta = new ShowsTableAdapters.ShowsInsertUpdate();

        long id = long.Parse(sta.ShowsInsert(this.txtBxName.Text, txtBxDesc.Text, int.Parse(txtBxTicketQuantity.Text), decimal.Parse(txtBxTicketPrice.Text), Convert.ToDateTime(txtBxShowDate.Text), string.IsNullOrEmpty(txtBxMusic.Text) ? null : txtBxMusic.Text).ToString());
        string message;
        if (id > 0)
        {
            message = "Insertion Successful";
        }
        else
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            message = "Insertion Failed";
        }

        lblMessage.Text = message;
        lblMessage.Visible = true;
    }
    protected void btnAddMeal_Click(object sender, EventArgs e)
    {
        MealsTableAdapters.MealsSelectByShowIDTableAdapter msta = new MealsTableAdapters.MealsSelectByShowIDTableAdapter();
        long id = long.Parse(msta.MealsInsert(txtBxMealName.Text, txtBxMealDesc.Text, long.Parse(hdShow.Value)).ToString());

        string message;
        if (id > 0)
        {
            message = "Insertion Successful";
           
        }
        else
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            message = "Insertion Failed";
        }

        lblMealAddMessage.Text = message;
        lblMealAddMessage.Visible = true;

    }
    protected void btnAddDessert_Click(object sender, EventArgs e)
    {
        DessertsTableAdapters.DessertSelectByShowIDTableAdapter dsta = new DessertsTableAdapters.DessertSelectByShowIDTableAdapter();
        long id = long.Parse(dsta.DessertsInsert(txtBxDessertName.Text, txtBxDessertDesc.Text, long.Parse(hdShow.Value)).ToString());

        string message;
        if (id > 0)
        {
            message = "Insertion Successful";
        }
        else
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            message = "Insertion Failed";
        }

        lblDessertAddMessage.Text = message;
        lblDessertAddMessage.Visible = true;
    }
}
