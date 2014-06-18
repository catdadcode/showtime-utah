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
using System.Data.SqlClient;
using System.Web.Mail;

public partial class Newsletter : System.Web.UI.Page
{
    Random random = new Random();
    static SqlConnection sConnection = new SqlConnection("Data Source=stuDB.db.2959523.hostedresource.com; Initial Catalog=stuDB; User ID=stuDB; Password='Watchme50';");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            admin.Visible = true;
            signup.Visible = false;
            unsubscribe.Visible = false;
        }
        else
        {
            admin.Visible = false;
            if (Request.QueryString["unsubscribe"] == "true")
            {
                signup.Visible = false;
                unsubscribe.Visible = true;
            }
            else
            {
                signup.Visible = true;
                unsubscribe.Visible = false;
            }
        }

        if (!this.IsPostBack)
        {
            this.Session["CaptchaImageText"] = CaptchaImage.GenerateRandomCode(random);

            DataTable dt = new DataTable();
            SqlDataAdapter sda = new SqlDataAdapter("SELECT COUNT(*)AS 'Email Count' FROM stuNewsletter", sConnection);
            sda.Fill(dt);
            newslettercount.InnerText = Convert.ToInt32(dt.Rows[0].ItemArray[0]).ToString() + " total subscribers.";
            //foreach (DataRow dr in dt.Rows)
            //{
            //    lbxDeleteEmails.Items.Add(dr.ItemArray[0].ToString());
            //}
        }
    }

    //protected void btnDelete_Click(object sender, EventArgs e)
    //{
    //    int[] iIndices = lbxDeleteEmails.GetSelectedIndices();

    //    sConnection.Open();
    //    for (int iCount = 0; iCount < iIndices.Length; iCount++)
    //    {
    //        string sDeleteEmail = lbxDeleteEmails.Items[iIndices[iCount]].ToString();
    //        SqlCommand scomm = new SqlCommand("DELETE FROM stuNewsletter WHERE Email='" + sDeleteEmail + "'", sConnection);
    //        int iRowsAffected = scomm.ExecuteNonQuery();
    //    }
    //    sConnection.Close();

    //    Response.Write("<h2 style=\"text-align:center;color:990000;\">Selected emails have been removed.</h2><center><a href=\"Newsletter.aspx\">(Click here to continue)</a></center>");
    //    Response.Flush();
    //    Response.Close();
    //}

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (tbxCode.Text == Session["CaptchaImageText"].ToString())
        {
            cvInvalidCode.IsValid = true;

            try
            {
                SqlCommand scomm = new SqlCommand("INSERT INTO stuNewsletter VALUES ('" + tbxEmail.Text + "','True')", sConnection);
                sConnection.Open();
                int iRowsAffected = scomm.ExecuteNonQuery();
                sConnection.Close();

                Response.Write("<h2 style=\"text-align:center;color:009900;\">Success! You are now signed up for the ShowTime Utah newsletter.</h2><center><a href=\"Default.aspx\">(Click here to continue)</a></center>");
                Response.Flush();
                Response.Close();
            }
            catch
            {
                Response.Write("<h2 style=\"text-align:center;color:990000;\">You are already signed up for the ShowTime Utah newsletter.</h2><center><a href=\"Default.aspx\">(Click here to continue)</a></center>");
                Response.Flush();
                Response.Close();
            }
        }
        else
        {
            cvInvalidCode.IsValid = false;
        }
    }

    protected void btnAddEmails_Click(object sender, EventArgs e)
    {
        tbxAddEmails.Text = tbxAddEmails.Text.Replace(" ", "");
        string[] sEmails = tbxAddEmails.Text.Split(';');
        sConnection.Open();
        ArrayList alErrors = new ArrayList();
        foreach (string s in sEmails)
        {
            if (s.Length > 1)
            {
                try
                {
                    SqlCommand scomm = new SqlCommand("INSERT INTO stuNewsletter VALUES ('" + s + "','True')", sConnection);
                    int iRowsAffected = scomm.ExecuteNonQuery();
                }
                catch
                {
                    alErrors.Add(s);
                }
            }
        }
        sConnection.Close();
        if (alErrors.Count == 0)
        {
            Response.Write("<h2 style=\"text-align:center;color:#009900;\">You have successfuly added new emails to the newsletter.</h2><center><a href=\"Newsletter.aspx\">(Click here to continue)</a></center>");
            Response.Flush();
            Response.Close();
        }
        else
        {
            Response.Write("<h2 style=\"text-align:center;color:#990000;\">The following email addresses have already been entered.</h2><center>");
            foreach (string s in alErrors)
            {
                Response.Write(s + "<br />");
            }
            Response.Write("<br /><span style=\"font-size:20px;color:#009900;\">Any not on this list were entered successfuly.</span><br /><br /><a href=\"Newsletter.aspx\">(Click here to continue)</a></center>");
            Response.Flush();
            Response.Close();
        }
    }

    protected void btnSendNewsletter_Click(object sender, EventArgs e)
    {
        Response.Redirect("SendNewsletter.aspx", true);
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lbxResults.Items.Clear();
        DataTable dtSearchResults = SearchEmails(tbxSearch.Text);
        if (dtSearchResults.Rows.Count > 0)
        {
            foreach (DataRow dr in dtSearchResults.Rows)
            {
                lbxResults.Items.Add(dr.ItemArray[0].ToString());
            }
        }
        else
        {
            lbxResults.Items.Add("No results.");
        }
    }

    protected void btnDeleteFromSearch_Click(object sender, EventArgs e)
    {
        if (lbxResults.Items[0].Value != "No results.")
        {
            int[] iIndices = lbxResults.GetSelectedIndices();

            sConnection.Open();
            for (int iCount = 0; iCount < iIndices.Length; iCount++)
            {
                string sDeleteEmail = lbxResults.Items[iIndices[iCount]].ToString();
                SqlCommand scomm = new SqlCommand("DELETE FROM stuNewsletter WHERE Email='" + sDeleteEmail + "'", sConnection);
                int iRowsAffected = scomm.ExecuteNonQuery();
            }
            sConnection.Close();

            Response.Write("<h2 style=\"text-align:center;color:990000;\">Selected emails have been removed.</h2><center><a href=\"Newsletter.aspx\">(Click here to continue)</a></center>");
            Response.Flush();
            Response.Close();
        }
        else
        {
            Response.Write("<h2 style=\"text-align:center;color:990000;\">No emails were selected.</h2><center><a href=\"Newsletter.aspx\">(Click here to continue)</a></center>");
            Response.Flush();
            Response.Close();
        }
    }

    public DataTable SearchEmails(string sSearchString)
    {
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM stuNewsletter WHERE Email LIKE '%" + sSearchString + "%'", sConnection);
        sda.Fill(dt);
        return dt;
    }

    protected void btnUnusubscribe_Click(object sender, EventArgs e)
    {
        SqlCommand scomm = new SqlCommand("DELETE FROM stuNewsletter WHERE Email='" + tbxUnsubscribe.Text + "'", sConnection);
        sConnection.Open();
        int iRowsAffected = scomm.ExecuteNonQuery();
        sConnection.Close();

        SmtpMail.SmtpServer = "relay-hosting.secureserver.net";
        MailMessage mm = new MailMessage();
        mm.BodyFormat = MailFormat.Html;
        mm.To = "Joan@ShowTimeUtah.com;Alex@Chevtek.com";
        mm.From = "NoReply@ShowTimeUtah.com";
        mm.Subject = "A user unsubscribed from your newsletter.";
        mm.Body = tbxUnsubscribe.Text + " unsubscribed from your newsletter.<br /><br />THIS EMAIL WAS GENERATED AUTOMATICALLY. PLEASE DO NOT REPLY.";
        try
        {
            SmtpMail.Send(mm);
        }
        catch
        {

        }

        Response.Write("<h2 style=\"text-align:center;color:990000;\">You have been unsubscribed. Sorry to see you go.</h2><center><a href=\"Default.aspx\">(Click here to continue)</a></center>");
        Response.Flush();
        Response.Close();
    }
}
