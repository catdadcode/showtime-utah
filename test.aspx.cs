using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
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

public partial class test : System.Web.UI.Page
{
    SqlConnection sConnection = new SqlConnection("Data Source=stuDB.db.2959523.hostedresource.com; Initial Catalog=stuDB; User ID=stuDB; Password='Watchme50';");

    protected void Page_Load(object sender, EventArgs e)
    {
        //int iMaxPages = Convert.ToInt32(Math.Ceiling(Convert.ToDecimal(GetEmailCount()) / 250m));

        //Response.Write("<h2>Email list. Separated into groups of 80 for easy cut and past sending.</h2><br /><br />");
        //int iCount = 0;
        //for (iCount = 0; iCount < iMaxPages; iCount++)
        //{
        //    DataTable dt = Get250EmailsBy_Number(iCount);
        //    int i80 = 0;
        //    foreach (DataRow dr in dt.Rows)
        //    {
        //        Response.Write(dr.ItemArray[0].ToString() + "; ");
        //        i80++;
        //        if (i80 >= 80)
        //        {
        //            Response.Write("<br /><br />****************************<br /><br />");
        //            i80 = 0;
        //        }
        //    }
        //    Response.Write("<br /><br /><hr />End of 250 set<hr /><br /><br />");
        //}


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

    public DataTable SearchEmails(string sSearchString)
    {
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM stuNewsletter WHERE Email LIKE '%" + sSearchString + "%'", sConnection);
        sda.Fill(dt);
        return dt;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        results.InnerHtml = "";
        DataTable dtSearchResults = SearchEmails(tbxSearchString.Text);
        foreach (DataRow dr in dtSearchResults.Rows)
        {
            results.InnerHtml += dr.ItemArray[0].ToString() + "<br />";
        }
    }
}
