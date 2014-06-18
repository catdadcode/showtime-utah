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

public partial class ManageShows : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Response.Redirect("Default.aspx");
        }

        if (!this.IsPostBack)
        {
            StreamReader sr = new StreamReader(MapPath("~/DataFiles/UpcomingShows.stu"));
            lbxShows.Items.Clear();
            while (!sr.EndOfStream)
            {
                int iMonth = DateTime.Now.Month;
                int iDay = DateTime.Now.Day;
                int iYear = DateTime.Now.Year;
                string s = sr.ReadLine();
                int iIndex = s.IndexOf('/');
                string sDate = s.Remove(0, iIndex - 2);
                sDate = sDate.Remove(10);
                string[] sDates = sDate.Split('/');
                int iMonth2 = Convert.ToInt32(sDates[0]);
                int iDay2 = Convert.ToInt32(sDates[1]);
                int iYear2 = Convert.ToInt32(sDates[2]);
                if (iYear < iYear2)
                {
                    lbxShows.Items.Add(s);
                }
                else if (iYear == iYear2)
                {
                    if (iMonth < iMonth2)
                    {
                        lbxShows.Items.Add(s);
                    }
                    else if (iMonth == iMonth2)
                    {
                        if (iDay <= iDay2)
                        {
                            lbxShows.Items.Add(s);
                        }
                    }
                }
            }
            sr.Close();
            cbxDelete.Visible = false;
            addoredit.InnerText = "Add New Show";
            btnAddEditShow.Text = "Add Show";

            for (int i = 0; i <= 10; i++)
            {
                ddlYear.Items.Add(Convert.ToString(DateTime.Now.Year + i));
            }
        }
    }

    protected void cbxDelete_CheckedChanged(object sender, EventArgs e)
    {
        if (cbxDelete.Checked)
        {
            tbxShowName.Enabled = false;
            tbxShowName.BackColor = Color.LightGray;
            ddlDayOfWeek.Enabled = false;
            ddlDayOfWeek.BackColor = Color.LightGray;
            ddlMonth.Enabled = false;
            ddlMonth.BackColor = Color.LightGray;
            ddlDay.Enabled = false;
            ddlDay.BackColor = Color.LightGray;
            ddlYear.Enabled = false;
            ddlYear.BackColor = Color.LightGray;
        }
        else
        {
            tbxShowName.Enabled = true;
            tbxShowName.BackColor = Color.White;
            ddlDayOfWeek.Enabled = true;
            ddlDayOfWeek.BackColor = Color.White;
            ddlMonth.Enabled = true;
            ddlMonth.BackColor = Color.White;
            ddlDay.Enabled = true;
            ddlDay.BackColor = Color.White;
            ddlYear.Enabled = true;
            ddlYear.BackColor = Color.White;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        StreamWriter sw = new StreamWriter(MapPath("~/DataFiles/UpcomingShows.stu"));
        foreach (ListItem li in lbxShows.Items)
        {
            sw.WriteLine(li.Text);
        }
        sw.Close();
        Response.Redirect("Tickets.aspx");
    }

    protected void btnNewShow_Click(object sender, EventArgs e)
    {
        Response.Redirect("ManageShows.aspx", true);
    }

    protected void btnAddEditShow_Click(object sender, EventArgs e)
    {
        if (btnAddEditShow.Text == "Submit Change")
        {
            if (cbxDelete.Checked)
            {
                lbxShows.Items.RemoveAt(lbxShows.SelectedIndex);
                cbxDelete.Checked = false;
                cbxDelete_CheckedChanged(null, null);
                cbxDelete.Visible = false;
                tbxShowName.Text = "";
                ddlDayOfWeek.SelectedIndex = 0;
                ddlMonth.SelectedIndex = 0;
                ddlDay.SelectedIndex = 0;
                ddlYear.SelectedIndex = 0;
                btnAddEditShow.Text = "Add Show";
                addoredit.InnerText = "Add New Show";
            }
            else
            {
                int iIndex = lbxShows.SelectedIndex;
                lbxShows.Items.RemoveAt(iIndex);
                lbxShows.Items.Insert(iIndex, new ListItem(ddlDayOfWeek.SelectedValue + ", " + ddlMonth.SelectedValue.PadLeft(2, '0') + "/" + ddlDay.SelectedValue.PadLeft(2, '0') + "/" + ddlYear.SelectedValue + " - " + tbxShowName.Text));
                lbxShows.SelectedIndex = iIndex;
                lbxShows_SelectedIndexChanged(null, null);
            }
        }
        else
        {
            lbxShows.Items.Add(ddlDayOfWeek.SelectedValue + ", " + ddlMonth.SelectedValue.PadLeft(2, '0') + "/" + ddlDay.SelectedValue.PadLeft(2, '0') + "/" + ddlYear.SelectedValue + " - " + tbxShowName.Text);
        }
    }

    protected void lbxShows_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnAddEditShow.Text = "Submit Change";
        addoredit.InnerText = "Edit Show";
        cbxDelete.Visible = true;
        string sDayOfWeek = lbxShows.SelectedValue.Remove(lbxShows.SelectedValue.IndexOf(','));
        for (int i = 0; i < ddlDayOfWeek.Items.Count; i++)
        {
            if (ddlDayOfWeek.Items[i].ToString() == sDayOfWeek)
            {
                ddlDayOfWeek.SelectedIndex = i;
            }
        }
        string sMonth = lbxShows.SelectedValue.Remove(0, lbxShows.SelectedValue.IndexOf(' '));
        string sDay = sMonth.Remove(0, 4);
        string sYear = sDay.Remove(0, 3);
        string sShowName = sYear.Remove(0, 7);
        sMonth = sMonth.Remove(sMonth.IndexOf('/'));
        sDay = sDay.Remove(sDay.IndexOf('/'));
        sYear = sYear.Remove(sYear.IndexOf(' '));

        ddlMonth.SelectedIndex = Convert.ToInt32(sMonth) - 1;
        ddlDay.SelectedIndex = Convert.ToInt32(sDay) - 1;
        ddlYear.SelectedIndex = Convert.ToInt32(sYear) - DateTime.Now.Year;
        tbxShowName.Text = sShowName;
    }
}
