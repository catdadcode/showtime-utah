using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text.RegularExpressions;
using System.Collections;

using System.Net;
using System.IO;


public partial class _Default : System.Web.UI.Page 
{
    private double _salesTax = 0.0745;
    private double _adultPrice = 24.95;
    private double _childPrice = 9.95;
    private double _total = 0.00;
    private int startYear = DateTime.Now.Year;

    /**
     * coupon discounts
     * change these when the discount prices change 
     */
    private double _couponDiscount = 10.00;

    /**
     * change these when coupon codes change
     */
    private String _couponDiscountCode = "boots";


    // DO NOT MODIFY ANYTHING BELOW THIS POINT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    private Boolean _couponUsed = false;
    private Boolean _certificatUsed = false;
    private Boolean _birthdayCertificateUsed = false;

    private String _authNetURL = "https://secure.authorize.net/gateway/transact.dll";

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!Request.IsSecureConnection)
        {
            // send user to SSL 
            string serverName = HttpUtility.UrlEncode(Request.ServerVariables["SERVER_NAME"]);
            string filePath = Request.FilePath;
            Response.Redirect("https://" + serverName + filePath);
        }        

        if(!Page.IsPostBack )
        {
            
            for (int i = 0; i < 11; i++,startYear++)
            {
                DropDownListExpYear.Items.Add(new ListItem(startYear.ToString(), startYear.ToString()));
            }
			
			for (int i = 0; i < 51; i++,startYear++)
            {
                adultTickets.Items.Add(new ListItem(i.ToString(),i.ToString()));
				if(i < 21) 
				{
                	DropDownListChildTickets.Items.Add(new ListItem(i.ToString(), i.ToString()));
				}
            }

            for(int i = 1;i<13;i++) {
                string num = "";
                if (i < 10)
                {
                    num = "0" + i.ToString();
                }
                else
                {
                    num = i.ToString();
                }
                DropDownListExpMonth.Items.Add(new ListItem(num, num));
            }
            LabelResult.Visible = false;
        }
        
    }


    protected void ButtonFormSubmit_Click(object sender, EventArgs e)
    {
        authorize();
    }

    private void calculateTotal(Boolean calculateDiscount)
    {
        double adultTotal =  Int16.Parse(adultTickets.SelectedValue.ToString()) * _adultPrice;
        double childTotal = Int16.Parse(DropDownListChildTickets.SelectedValue.ToString()) * _childPrice;
        double tmpTotal = (adultTotal + childTotal);


        //calculate coupon discounts
        if (calculateDiscount)
        {
            tmpTotal -= CalculateDiscount();
        }

        double totalSalesTax = tmpTotal * _salesTax;
        _total = tmpTotal +totalSalesTax;

        _total = Math.Round(_total,2,MidpointRounding.AwayFromZero);

        LabelTotal.Text = "Total with Sales Tax: " + _total.ToString("C");
    }

    private String postString()
    {
        String strPost = "x_login=25m5tJRhSY&x_tran_key=2rZ9726uuHjh23G6"
                         + "&x_method=CC&x_type=AUTH_CAPTURE&x_amount="
                         + _total
                         + "&x_delim_data=TRUE&x_delim_char=|&x_relay_response=FALSE&x_card_num="
                         + cleanText(TextBoxCC.Text)
                        + "&x_exp_date="
                        + cleanText(DropDownListExpMonth.SelectedValue) + cleanText(DropDownListExpYear.SelectedValue)
                        + "&x_version=3.1"
                        + "&x_zip=" + cleanText(TextBoxZipCode.Text)
                        + "&x_first_name=" + cleanText(TextBoxFirstName.Text)
                        + "&x_last_name=" + cleanText(TextBoxLastName.Text)
                        + "&x_email=" + cleanText(TextBoxEmail.Text)
                        + "&comments=" + cleanText(TextBoxSpecialRequest.Text)
                        + "&party=" + cleanText(TextBoxParty.Text)
                        + "&show=" + cleanText(DropDownListShow.SelectedValue)
                        + "&adult=" + adultTickets.SelectedValue.ToString()
                        + "&child=" + DropDownListChildTickets.SelectedValue.ToString()
                        + "&coupon=" + _couponUsed.ToString();

        return strPost;
    }

    private void authorize()
    {
        calculateTotal(true);
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
            LabelResult.Text = e.Message;
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
                newString += "Your show is on " + DropDownListShow.SelectedValue.ToString() + ".<br />";
                newString += "You have purchased " + adultTickets.SelectedValue.ToString() + " adult ticket(s) and ";
                newString += DropDownListChildTickets.SelectedValue.ToString() + " child ticket(s).<br /><br />";
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
                
                break;
            case "2":
                newString += "The transaction has been <b>declined</b> by Authorize.net<br />If you have received this error message, go back one page and renter your credit card number or enter another card. Transaction Id: "+ resultArray[6].ToString();
                break;
            case "3":
                newString += "There was an error in processing your request.<br />If you have received this error message, go back one page and renter your credit card number or enter another card. Transaction Id: "+ resultArray[6].ToString();
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
                LabelResult.ForeColor = System.Drawing.Color.Red;
                break;
            case "4":
                newString += "Held For review by Authorize.net.";
                break;
        }

        ticketSelect.Visible = false;
        LabelResult.Visible = true;
        
        LabelResult.Text = newString + "</p>";
    }

    private string cleanText(string txt)
    {
        return Server.HtmlEncode(txt);
    }

    private double CalculateDiscount()
    {
        double discount = 0.00;

        int numberOfAdultTickets = Int16.Parse(adultTickets.SelectedValue.ToString());
        int numberOfChildTickets = Int16.Parse(DropDownListChildTickets.SelectedValue.ToString());

        if (numberOfAdultTickets >= 2 &&
            TextBoxCoupon.Text.Equals(_couponDiscountCode))
        {
            discount = _couponDiscount;
            _couponUsed = true;
        }
        else
        {
            _couponUsed = false;
        }

        return discount;
    }
    protected void ButtonCalculateTotal_Click(object sender, EventArgs e)
    {
        calculateTotal(true);
    }
}