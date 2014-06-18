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
using System.Drawing;

public partial class ManageCouponCodes : System.Web.UI.Page
{
    ArrayList alCodes;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Response.Redirect("Default.aspx");
        }

        if (!this.IsPostBack)
        {
            StreamReader sr = new StreamReader(MapPath("~/DataFiles/CouponCodes.stu"));
            lbxCouponCodes.Items.Clear();
            alCodes = new ArrayList();
            while (!sr.EndOfStream)
            {
                string sCodeName = sr.ReadLine();
                string sDiscount = sr.ReadLine();
                string sApplyAdult = sr.ReadLine();
                string sApplyChild = sr.ReadLine();
                string sTicketsRequired = sr.ReadLine();
                alCodes.Add(sCodeName);
                alCodes.Add(sDiscount);
                alCodes.Add(sApplyAdult);
                alCodes.Add(sApplyChild);
                alCodes.Add(sTicketsRequired);
                lbxCouponCodes.Items.Add(sCodeName);
            }
            sr.Close();
            cbxDelete.Visible = false;
            addoredit.InnerText = "Add Coupon Code";
            btnAddEditCode.Text = "Add Code";
            this.ViewState["alCodes"] = alCodes;
        }
        else
        {
            alCodes = (ArrayList)this.ViewState["alCodes"];
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        StreamWriter sw = new StreamWriter(MapPath("~/DataFiles/CouponCodes.stu"));
        foreach (string s in alCodes)
        {
            sw.WriteLine(s);
        }
        sw.Close();
        Response.Redirect("Tickets.aspx");
    }

    protected void btnNewCode_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageCouponCodes.aspx", true);
    }

    protected void btnAddEditCode_Click(object sender, EventArgs e)
    {
        if (cbxDelete.Checked)
        {
            int iIndex = lbxCouponCodes.SelectedIndex;
            alCodes.RemoveAt((iIndex*5) + 4);
            alCodes.RemoveAt((iIndex * 5) + 3);
            alCodes.RemoveAt((iIndex * 5) + 2);
            alCodes.RemoveAt((iIndex * 5) + 1);
            alCodes.RemoveAt((iIndex * 5));
            this.ViewState["alCodes"] = alCodes;
            lbxCouponCodes.Items.RemoveAt(iIndex);
            
            cbxDelete.Checked = false;
            cbxDelete_CheckedChanged(null, null);
            tbxCode.Text = "";
            tbxDiscount.Text = "";
            cbxBirthday.Checked = false;
            cbxApplyAdults.Checked = false;
            cbxApplyChildren.Checked = false;
            tbxNumberRequired.Text = "";
            cbxDelete.Visible = false;
            btnAddEditCode.Text = "Add Code";
            addoredit.InnerText = "Add Coupon Code";
        }
        else
        {
            if (btnAddEditCode.Text == "Add Code")
            {
                alCodes.Add(tbxCode.Text);
                if (cbxBirthday.Checked)
                {
                    alCodes.Add("birthday");
                }
                else
                {
                    alCodes.Add(tbxDiscount.Text);
                }
                alCodes.Add(cbxApplyAdults.Checked.ToString());
                alCodes.Add(cbxApplyChildren.Checked.ToString());
                alCodes.Add(tbxNumberRequired.Text);
                this.ViewState["alCodes"] = alCodes;
                lbxCouponCodes.Items.Add(tbxCode.Text);
            }
            else
            {
                int iIndex = lbxCouponCodes.SelectedIndex;
                alCodes.RemoveAt((iIndex * 5) + 4);
                alCodes.RemoveAt((iIndex * 5) + 3);
                alCodes.RemoveAt((iIndex * 5) + 2);
                alCodes.RemoveAt((iIndex * 5) + 1);
                alCodes.RemoveAt((iIndex * 5));
                alCodes.Insert((iIndex * 5), tbxCode.Text);
                if (cbxBirthday.Checked)
                {
                    alCodes.Insert((iIndex * 5) + 1, "birthday");
                }
                else
                {
                    alCodes.Insert((iIndex * 5) + 1, tbxDiscount.Text);
                }
                alCodes.Insert((iIndex * 5)+2, cbxApplyAdults.Checked.ToString());
                alCodes.Insert((iIndex * 5)+3, cbxApplyChildren.Checked.ToString());
                alCodes.Insert((iIndex * 5)+4, tbxNumberRequired.Text);
                lbxCouponCodes.Items.RemoveAt(iIndex);
                lbxCouponCodes.Items.Insert(iIndex, tbxCode.Text);
                lbxCouponCodes.SelectedIndex = iIndex;
                lbxCouponCodes_SelectedIndexChanged(null, null);
            }
        }
    }

    protected void cbxDelete_CheckedChanged(object sender, EventArgs e)
    {
        if (cbxDelete.Checked)
        {
            tbxCode.Enabled = false;
            tbxCode.BackColor = Color.LightGray;
            tbxDiscount.Enabled = false;
            tbxDiscount.BackColor = Color.LightGray;
            cbxBirthday.Enabled = false;
            cbxApplyAdults.Enabled = false;
            cbxApplyChildren.Enabled = false;
            tbxNumberRequired.Enabled = false;
            tbxNumberRequired.BackColor = Color.LightGray;
        }
        else
        {
            tbxCode.Enabled = true;
            tbxCode.BackColor = Color.White;
            tbxDiscount.Enabled = true;
            tbxDiscount.BackColor = Color.White;
            cbxBirthday.Enabled = true;
            cbxApplyAdults.Enabled = true;
            cbxApplyChildren.Enabled = true;
            tbxNumberRequired.Enabled = true;
            tbxNumberRequired.BackColor = Color.White;
        }
    }

    protected void lbxCouponCodes_SelectedIndexChanged(object sender, EventArgs e)
    {
        addoredit.InnerText = "Edit Coupon Code";
        btnAddEditCode.Text = "Submit Change";
        cbxDelete.Visible = true;
        int iIndex = lbxCouponCodes.SelectedIndex;
        tbxCode.Text = alCodes[(iIndex*5)].ToString();
        string sDiscount = alCodes[(iIndex*5) + 1].ToString();
        if (sDiscount != "birthday")
        {
            tbxDiscount.Text = alCodes[(iIndex*5) + 1].ToString();
            tbxDiscount.Enabled = true;
            tbxDiscount.BackColor = Color.White;
            cbxBirthday.Checked = false;
        }
        else
        {
            tbxDiscount.Text = "";
            tbxDiscount.Enabled = false;
            tbxDiscount.BackColor = Color.LightGray;
            cbxBirthday.Checked = true;
        }
        cbxApplyAdults.Checked = Convert.ToBoolean(alCodes[(iIndex*5) + 2]);
        cbxApplyChildren.Checked = Convert.ToBoolean(alCodes[(iIndex*5) + 3]);
        tbxNumberRequired.Text = alCodes[(iIndex*5) + 4].ToString();
    }
    protected void cbxBirthday_CheckedChanged(object sender, EventArgs e)
    {
        if (cbxBirthday.Checked)
        {
            tbxDiscount.Enabled = false;
            tbxDiscount.BackColor = Color.LightGray;
            tbxDiscount.Text = "";
        }
        else
        {
            tbxDiscount.Enabled = true;
            tbxDiscount.BackColor = Color.White;
        }
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if ((tbxDiscount.Enabled == true) && (tbxDiscount.Text != ""))
        {
            args.IsValid = true;
        }
        else if ((tbxDiscount.Enabled == true) && (tbxDiscount.Text == ""))
        {
            args.IsValid = false;
        }
        else if (tbxDiscount.Enabled == false)
        {
            args.IsValid = true;
        }
    }
}
