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

public partial class EditConcerts : System.Web.UI.Page
{
    string sNum;
    string sFile;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Response.Redirect("Default.aspx");
        }

        sNum = Request.QueryString["n"];
        sFile = Request.QueryString["f"];
        if (!this.IsPostBack)
        {
            StreamReader sr = new StreamReader(MapPath("~/DataFiles/" + sFile + sNum + ".stu"));
            tbxColor.Text = sr.ReadLine();
            if (tbxColor.Text == "#000000")
                tbxColor.ForeColor = System.Drawing.Color.White;
            else
                tbxColor.ForeColor = System.Drawing.Color.Black;
            tbxColor.BackColor = System.Drawing.ColorTranslator.FromHtml(tbxColor.Text);
            rteColumn.Value = sr.ReadToEnd();
            sr.Close();

            //string[] sFiles = Directory.GetFiles(MapPath("~/DataFiles/images/"));
            //foreach (string s in sFiles)
            //{
            //    string s2 = s.Remove(0, s.LastIndexOf('\\') + 1);
            //    ddlExistingImages.Items.Add(s2);
            //}
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        StreamWriter sw = new StreamWriter(MapPath("~/DataFiles/" + sFile + sNum + ".stu"));
        sw.WriteLine(tbxColor.Text);
        sw.Write(rteColumn.Value);
        sw.Close();

        if (sFile == "concerts")
        {
            Response.Redirect("Concerts.aspx");
        }
        else
        {
            Response.Redirect("SendNewsletter.aspx");
        }
    }

    //protected void btnUpload_Click(object sender, EventArgs e)
    //{
    //    string sFloat = "";
    //    if (rblFloat.Items[1].Selected)
    //    {
    //        sFloat = "style=\"float:right;\"";
    //    }
    //    else if (rblFloat.Items[2].Selected)
    //    {
    //        sFloat = "style=\"float:left;\"";
    //    }
    //    fuContentImage.SaveAs(MapPath("~/DataFiles/images/" + fuContentImage.FileName));
    //    rteColumn.Text += "<img " + sFloat + " src=\"http://www.showtimeutah.com/MakeThumbnail.aspx?size=500&image=DataFiles/images/" + fuContentImage.FileName + "\" />";
    //}

    //protected void btnAddImage_Click(object sender, EventArgs e)
    //{
    //    if (ddlExistingImages.SelectedValue != "Not Selected")
    //    {
    //        string sFloat = "";
    //        if (rblFloat.Items[1].Selected)
    //        {
    //            sFloat = "style=\"float:right;\"";
    //        }
    //        else if (rblFloat.Items[2].Selected)
    //        {
    //            sFloat = "style=\"float:left;\"";
    //        }
    //        rteColumn.Text += "<img " + sFloat + " src=\"http://www.showtimeutah.com/MakeThumbnail.aspx?size=500&image=DataFiles/images/" + ddlExistingImages.SelectedValue + "\" />";
    //    }
    //}
}
