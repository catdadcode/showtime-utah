using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Mail;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net;
using System.IO;

public partial class Tickets : System.Web.UI.Page
{
    private double _salesTax;
    private double _adultPrice;
    private double _childPrice;
    private double _total = 0.00;
    private int startYear = DateTime.Now.Year;

    private Boolean _couponUsed = false;
    private Boolean _certificateUsed = false;
    private Boolean _birthdayCertificateUsed = false;
    private String _authNetURL = "https://secure.authorize.net/gateway/transact.dll";

    private double _couponDiscount = 0.00;
    private String _couponDiscountCode;

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Request.IsSecureConnection)
        //{
        //    // send user to SSL 
        //    string serverName = HttpUtility.UrlEncode(Request.ServerVariables["SERVER_NAME"]);
        //    string filePath = Request.FilePath;
        //    Response.Redirect("https://" + serverName + filePath);
        //}

        StreamReader sr2 = new StreamReader(MapPath("~/DataFiles/Pricing.stu"));
        _salesTax = Convert.ToDouble(sr2.ReadLine());
        _adultPrice = Convert.ToDouble(sr2.ReadLine());
        _childPrice = Convert.ToDouble(sr2.ReadLine());
        sr2.Close();

        if (!Page.IsPostBack)
        {
            for (int i = 0; i < 11; i++)
            {
                ddlYear.Items.Add(Convert.ToString(DateTime.Now.Year + i));
            }

            StreamReader sr = new StreamReader(MapPath("~/DataFiles/UpcomingShows.stu"));
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
                int iHyphen = s.IndexOf('-');
                string sShowName = s.Remove(0, iHyphen + 2).ToUpper();
                if (sShowName.Length > 7)
                    sShowName = sShowName.Remove(7);
                if (iYear < iYear2)
                {
                    if (sShowName != "NO SHOW")
                        ddlShow.Items.Add(s);
                    UpcomingShows.InnerHtml += "<b>" + s + "</b><br />";
                }
                else if (iYear == iYear2)
                {
                    if (iMonth < iMonth2)
                    {
                        if (sShowName != "NO SHOW")
                            ddlShow.Items.Add(s);
                        UpcomingShows.InnerHtml += "<b>" + s + "</b><br />";
                    }
                    else if (iMonth == iMonth2)
                    {
                        if (iDay <= iDay2)
                        {
                            if (sShowName != "NO SHOW")
                                ddlShow.Items.Add(s);
                            UpcomingShows.InnerHtml += "<b>" + s + "</b><br />";
                        }
                    }
                }
            }
            sr.Close();
        }
        lblAdultPrice.Text = _adultPrice.ToString("C");
        lblChildrenPrice.Text = _childPrice.ToString("C");
    }

    protected void btnCalculateTotal_Click(object sender, EventArgs e)
    {
        double dNumAdults = Convert.ToInt16(ddlAdults.SelectedValue.ToString());
        double dNumChildren = Convert.ToInt16(ddlChildren.SelectedValue.ToString());
        double dTotalTickets = dNumAdults + dNumChildren;
        double adultTotal = dNumAdults * _adultPrice;
        double childTotal = dNumChildren * _childPrice;
        double tmpTotal = (adultTotal + childTotal);

        //calculate coupon discounts
        double dDiscount = CalculateDiscount();
        tmpTotal -= dDiscount;


        double totalSalesTax = tmpTotal * _salesTax;
        _total = tmpTotal + totalSalesTax;

        _total = Math.Round(_total, 2, MidpointRounding.AwayFromZero);

        lblTotal.Text = _total.ToString("C");
    }

    private double CalculateDiscount()
    {
        double discount = 0.00;

        int numberOfAdultTickets = Int16.Parse(ddlAdults.SelectedValue.ToString());
        int numberOfChildTickets = Int16.Parse(ddlChildren.SelectedValue.ToString());

        _couponDiscount = 0.00;
        _couponUsed = false;
        StreamReader sr = new StreamReader(MapPath("~/DataFiles/CouponCodes.stu"));
        while (!sr.EndOfStream)
        {
            string sCode = sr.ReadLine();
            string sDiscount = sr.ReadLine();
            string sApplyAdult = sr.ReadLine();
            string sApplyChild = sr.ReadLine();
            string sNumRequired = sr.ReadLine();
            if (tbxCouponCode.Text.ToUpper() == sCode.ToUpper())
            {
                if (((numberOfAdultTickets > 0) && (sApplyAdult == "True") || (numberOfChildTickets > 0) && (sApplyChild == "True")))
                {
                    if ((numberOfChildTickets >= Convert.ToInt32(sNumRequired)) || (numberOfAdultTickets >= Convert.ToInt32(sNumRequired)))
                    {
                        if (sDiscount == "birthday")
                        {
                            if ((numberOfAdultTickets > 0) && (numberOfChildTickets == 0))
                            {
                                _couponDiscount = _adultPrice;
                            }
                            else if ((numberOfChildTickets > 0) && (numberOfAdultTickets == 0))
                            {
                                _couponDiscount = _childPrice;
                            }
                            else if ((numberOfAdultTickets > 0) && (numberOfChildTickets > 0))
                            {
                                _couponDiscount = _adultPrice;
                            }
                            _couponUsed = true;
                            break;
                        }
                        else
                        {
                            if ((sApplyAdult == "True") && (sApplyChild == "True"))
                            {
                                _couponDiscount = (Convert.ToDouble(sDiscount) * Convert.ToDouble(numberOfAdultTickets + numberOfChildTickets));
                            }
                            else if ((sApplyAdult == "True") && (sApplyChild == "False"))
                            {
                                _couponDiscount = (Convert.ToDouble(sDiscount) * Convert.ToDouble(numberOfAdultTickets));
                            }
                            else if ((sApplyAdult == "False") && (sApplyChild == "True"))
                            {
                                _couponDiscount = (Convert.ToDouble(sDiscount) * Convert.ToDouble(numberOfChildTickets));
                            }
                            _couponUsed = true;
                            break;
                        }
                    }
                }
            }
        }

        discount = _couponDiscount;
        sr.Close();
        return discount;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        authorize();
    }

    private void authorize()
    {
        btnCalculateTotal_Click(null, null);
        String newString = "<p style=\"font-size:1.5em\">";

        String result = "";
        String strPost = postString();
        StreamWriter myWriter = null;

        HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(_authNetURL);
        objRequest.Method = "POST";
        objRequest.ContentLength = strPost.Length;
        objRequest.ContentType = "application/x-www-form-urlencoded";

        try
        {
            myWriter = new StreamWriter(objRequest.GetRequestStream());
            myWriter.Write(strPost);
        }
        catch (Exception e)
        {
            lblResult.Text = e.Message;
        }
        finally
        {
            myWriter.Close();
        }

        HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
        using (StreamReader sr =
           new StreamReader(objResponse.GetResponseStream()))
        {
            result = sr.ReadToEnd();

            // Close and clean up the StreamReader
            sr.Close();
        }

        String[] resultArray = result.Split('|');


        switch (resultArray[0])
        {
            case "1":
                newString += "Thank you, " + resultArray[13] + " " + resultArray[14] + ", ";
                newString += "the transaction has been <b>approved</b> by Authorize.net.<br /><br />";
                newString += "Your show is on " + ddlShow.SelectedValue.ToString() + ".<br />";
                newString += "You have purchased " + ddlAdults.SelectedValue.ToString() + " adult ticket(s) and ";
                newString += ddlChildren.SelectedValue.ToString() + " child ticket(s).<br /><br />";
                newString += "The Transaction ID for this purchase is: " + resultArray[6].ToString() + "<br /><br />";

                if (_birthdayCertificateUsed)
                {
                    newString += "Enjoy your birthday party!<br />";
                }

                if (_couponUsed)
                {
                    newString += "Using a coupon you received a discount making your total ";
                }
                else
                {
                    newString += " Your total is ";
                }

                newString += _total.ToString("C") + ".<br /><br />Thank you and we'll see you at the show!<br />";

                SmtpMail.SmtpServer = "relay-hosting.secureserver.net";
                MailMessage mm = new MailMessage();
                mm.To = tbxEmail.Text;
                mm.From = "Events@ShowtimeUtah.com";
                mm.BodyFormat = MailFormat.Html;
                mm.Subject = "Your Showtime Ticket Purchase!";
                mm.Body = "Howdy!<br /><br />Thank you for purchasing tickets to the Old West Dinner Adventure, we want to make your visit with us a fun and exciting event.<br /><br />Please arrive by 6:45 so our Sheriff can meet you and get you seated before the show begins (He's always looking for those missing outlaws, so ya better not be on any wanted poster!)<br />Our wait staff will take your drink and dessert order before the show begins promptly at 7 PM (Soda's are $2 extra.)  Be sure an try an old fashioned Sarsaparilla, it's a taste right out of the Old West!  Desserts are included with your dinner. You'll have a choice of homemade Cream Cheese Brownies with ice cream, drizzle with chocolate (Our secret recipe made fresh in our kitchen).  Mmmm good!  Or a root beer float in a frozen mug, (It's the frozen mug that makes this more than an ordinary root beer float!)<br /><br />If you haven't visited us before, here's the easiest way to find us:<br />From I-15 take exit 275<br />Go East exactly 2 miles to the first stop sign which is a 4-way stop. (Main and Center) You will pass a few stop lights along the way.<br />Turn right at the 4-way stop.  We are the second building on the right. It's the old Grove Theater.<br />Parking is along the street or if it's full, there is plenty of parking behind the building.<br /><br />Get all gussied up or wear your favorite jeans, cowboy hat and dancing boots; our dress code is whatever makes you comfortable for two hours of hand clapping, boot stomping, grub eating fun!<br /><br />See you soon!<br /><br />Miss Ruby and her gang at the Silver Spur Junction";
                try
                {
                    SmtpMail.Send(mm);
                }
                catch
                {

                }

                break;
            case "2":
                newString += "The transaction has been <b>declined</b> by Authorize.net<br />If you have received this error message, go back one page and renter your credit card number or enter another card. Transaction Id: " + resultArray[6].ToString();
                break;
            case "3":
                newString += "There was an error in processing your request.<br />If you have received this error message, go back one page and renter your credit card number or enter another card. Transaction Id: " + resultArray[6].ToString();
                switch (resultArray[2])
                {
                    case "5":
                        newString += "<br />" + resultArray[3];
                        break;
                    case "6":
                        newString += "<br />" + resultArray[3];
                        break;
                    case "7":
                        newString += "<br />" + resultArray[3];
                        break;
                    case "8":
                        newString += "<br />" + resultArray[3];
                        break;
                }
                lblResult.ForeColor = System.Drawing.Color.Red;
                break;
            case "4":
                newString += "Held For review by Authorize.net.";
                break;
        }

        ticketselect.Visible = false;

        lblResult.Text = newString + "</p>";
    }

    private String postString()
    {
        String strPost = "x_login=*****&x_tran_key=*****"
                         + "&x_method=CC&x_type=AUTH_CAPTURE&x_amount="
                         + _total
                         + "&x_delim_data=TRUE&x_delim_char=|&x_relay_response=FALSE&x_card_num="
                         + cleanText(tbxCreditCardNumber.Text)
                        + "&x_exp_date="
                        + cleanText(ddlMonth.SelectedValue) + cleanText(ddlYear.SelectedValue)
                        + "&x_version=3.1"
                        + "&x_zip=" + cleanText(tbxZipCode.Text)
                        + "&x_first_name=" + cleanText(tbxFirstName.Text)
                        + "&x_last_name=" + cleanText(tbxLastName.Text)
                        + "&x_email=" + cleanText(tbxEmail.Text)
                        + "&comments=" + cleanText(tbxComments.Text + "Phone: " + tbxPhone.Text)
                        + "&party=" + cleanText(tbxSeatedPartyName.Text)
                        + "&show=" + cleanText(ddlShow.SelectedValue)
                        + "&adult=" + ddlAdults.SelectedValue.ToString()
                        + "&child=" + ddlChildren.SelectedValue.ToString()
                        + "&coupon=" + _couponUsed.ToString();

        return strPost;
    }

    private string cleanText(string txt)
    {
        return Server.HtmlEncode(txt);
    }
}
