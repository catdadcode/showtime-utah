using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Web.Mail;

public partial class SendNewsletter : System.Web.UI.Page
{
    SqlConnection sConnection = new SqlConnection("Data Source=stuDB.db.2959523.hostedresource.com; Initial Catalog=stuDB; User ID=stuDB; Password='Watchme50';");

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Application.Add("onscroll", "document.cookie = this.id + '=' + this.scrollTop;");

        if (User.Identity.IsAuthenticated)
        {
            btnHeader.Visible = true;
            btnEditColumn1.Visible = true;
            btnEditColumn2.Visible = true;
            sendbox.Visible = true;
        }
        else
        {
            btnHeader.Visible = false;
            btnEditColumn1.Visible = false;
            btnEditColumn2.Visible = false;
            sendbox.Visible = false;
        }

        if (!this.IsPostBack)
        {
            StreamReader sr = new StreamReader(MapPath("~/DataFiles/newsletter/header.stu"));
            string sBackColor = sr.ReadLine();
            string sForeColor = "#000000";
            if (sBackColor == "#000000")
                sForeColor = "#ffffff";
            letterheader.InnerHtml = "<div style=\"padding:15px;color:" + sForeColor + ";background-color:" + sBackColor + ";\">";
            letterheader.InnerHtml += sr.ReadToEnd();
            letterheader.InnerHtml += "</div>";
            sr.Close();

            sr = new StreamReader(MapPath("~/DataFiles/newsletter/column1.stu"));
            sBackColor = sr.ReadLine();
            sForeColor = "#000000";
            if (sBackColor == "#000000")
                sForeColor = "#ffffff";
            column1.InnerHtml = "<div style=\"padding:15px;color:" + sForeColor + ";background-color:" + sBackColor + ";\">";
            column1.InnerHtml += sr.ReadToEnd();
            column1.InnerHtml += "</div>";
            sr.Close();

            sr = new StreamReader(MapPath("~/DataFiles/newsletter/column2.stu"));
            sBackColor = sr.ReadLine();
            sForeColor = "#000000";
            if (sBackColor == "#000000")
                sForeColor = "#ffffff";
            column2.InnerHtml = "<div style=\"padding:15px;color:" + sForeColor + ";background-color:" + sBackColor + ";\">";
            column2.InnerHtml += sr.ReadToEnd();
            column2.InnerHtml += "</div>";
            sr.Close();
        }
    }

    protected void btnSendNewsletter_Click(object sender, EventArgs e)
    {
        int iMaxPages = Convert.ToInt32(Math.Ceiling(Convert.ToDecimal(GetEmailCount()) / 250m));

        Response.Write("<h2>Email list. Separated into groups of 80 for easy cut and past sending.</h2><br />");
        Response.Write("<span style=\"color:#009900;font-size:x-large;\">Newsletter has been sent to Joan@ShowtimeUtah.com for manual forwarding</span><br /><br />");
        int iCount = 0;
        for (iCount = 0; iCount < iMaxPages; iCount++)
        {
            DataTable dt = Get250EmailsBy_Number(iCount);
            int i80 = 0;
            foreach (DataRow dr in dt.Rows)
            {
                Response.Write(dr.ItemArray[0].ToString() + "; ");
                i80++;
                if (i80 == 80)
                {
                    Response.Write("<br /><br />****************************<br /><br />");
                    i80 = 0;
                }
            }
            Response.Write("<br /><br /><hr />End of 250 set<hr /><br /><br />");
        }

        ////////////////////////////////////
        // Send Newsletter For Forwarding //
        ////////////////////////////////////

        StreamReader sr = new StreamReader(MapPath("~/DataFiles/newsletter/header.stu"));
        string sBackColor = sr.ReadLine();
        string sForeColor = "#000000";
        if (sBackColor == "#000000")
            sForeColor = "#ffffff";
        string sHeader = "<div style=\"padding:15px;color:" + sForeColor + ";background-color:" + sBackColor + ";\">";
        sHeader += sr.ReadToEnd();
        sHeader += "</div>";
        sr.Close();

        sr = new StreamReader(MapPath("~/DataFiles/newsletter/column1.stu"));
        sBackColor = sr.ReadLine();
        sForeColor = "#000000";
        if (sBackColor == "#000000")
            sForeColor = "#ffffff";
        string sColumn1 = "<div style=\"padding:15px;color:" + sForeColor + ";background-color:" + sBackColor + ";\">";
        sColumn1 += sr.ReadToEnd();
        sColumn1 += "</div>";
        sr.Close();

        sr = new StreamReader(MapPath("~/DataFiles/newsletter/column2.stu"));
        sBackColor = sr.ReadLine();
        sForeColor = "#000000";
        if (sBackColor == "#000000")
            sForeColor = "#ffffff";
        string sColumn2 = "<div style=\"padding:15px;color:" + sForeColor + ";background-color:" + sBackColor + ";\">";
        sColumn2 += sr.ReadToEnd();
        sColumn2 += "</div>";
        sr.Close();

        MailMessage mm = new MailMessage();
        mm.BodyFormat = MailFormat.Html;
        mm.To = "Joan@ShowtimeUtah.com";
        mm.Bcc = "Alex@Chevtek.com";
        mm.From = "NoReply@ShowtimeUtah.com";
        mm.Subject = "A copy of the newsletter for forwarding.";
        mm.Body = "<div style=\"width: 700px; border: solid 5px #000000;\"><div style=\"background-color: #000000;height:153px;\"><img height=\"153\" src=\"http://www.showtimeutah.com/images/nlbanner.jpg\" width=\"700\" /></div>";
        mm.Body += sHeader;
        mm.Body += "<div><table><tr><td style=\"vertical-align: top; width: 350px;\">";
        mm.Body += sColumn1;
        mm.Body += "</td><td style=\"vertical-align: top; width: 350px;\">";
        mm.Body += sColumn2;
        mm.Body += "</td></tr></table><div style=\"padding:5px; font-size:14px;color:#000000;background-color:#FFF0BA;text-align:left;\">Click <a href=\"http://www.showtimeutah.com/Newsletter.aspx?unsubscribe=true\">here</a> to unsubscribe.</div></div></div><div style=\"width: 700px; text-align: right; margin-top: 5px;\"><a href=\"http://www.chevtek.com\"><img style=\"border: solid 3px #000000; background-color: #ffffcc; padding: 5px;\" src=\"http://www.chevtek.com/images/createdby.png\" /></a></div>";
        iCount = 0;
        bool bLoop = true;
        while (bLoop)
        {
            try
            {
                SmtpMail.Send(mm);
                bLoop = false;
            }
            catch (Exception ex)
            {
                System.Threading.Thread.Sleep(1000);
                iCount++;
                if (iCount >= 3)
                {
                    bLoop = false;
                }
            }
        }

        Response.Flush();
        Response.Close();
    }

    public DataTable Get250EmailsBy_Number(int iPageNumber)
    {
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter("SELECT TOP 250 * FROM stuNewsletter WHERE Email NOT IN (SELECT TOP (" + iPageNumber.ToString() + "*250) Email FROM stuNewsletter ORDER BY Email) ORDER BY Email", sConnection);
        sda.Fill(dt);
        return dt;
    }

    public int GetEmailCount()
    {
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter("SELECT COUNT(*)AS 'Email Count' FROM stuNewsletter", sConnection);
        sda.Fill(dt);
        return Convert.ToInt32(dt.Rows[0].ItemArray[0]);
    }
}
