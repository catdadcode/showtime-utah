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
using System.Data.SqlClient;

public partial class AddEmails : System.Web.UI.Page
{
    static SqlConnection sConnection = new SqlConnection("Data Source=whsql-v22.prod.mesa1.secureserver.net; Initial Catalog=ChevDB; User ID=ChevDB; Password='Ch3vyF0rd!'");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Response.Redirect("Default.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand scomm = new SqlCommand("DELETE FROM stuNewsletter", sConnection);
        sConnection.Close();
        sConnection.Open();
        int iRowsAffected = scomm.ExecuteNonQuery();
        sConnection.Close();

        StreamReader sr = new StreamReader(MapPath("~/DataFiles/emailtext.txt"));
        int x = 0;
        int y = 0;
        ArrayList al = new ArrayList();
        ArrayList al2 = new ArrayList();
        sConnection.Open();
        while (!sr.EndOfStream)
        {
            string sLine = sr.ReadLine();
            try
            {
                scomm = new SqlCommand("INSERT INTO stuNewsletter VALUES ('" + sLine + "')", sConnection);
                iRowsAffected = scomm.ExecuteNonQuery();
                x++;
                al.Add(sLine);
            }
            catch (Exception ex)
            {
                y++;
                al2.Add(sLine);
                Label1.Text = ex.ToString();
            }
        }
        sConnection.Close();
        sr.Close();

        al.Sort();
        al2.Sort();

        lbxSuccess.DataSource = al;
        lbxSuccess.DataBind();

        lbxFailed.DataSource = al2;
        lbxFailed.DataBind();
    }
}
