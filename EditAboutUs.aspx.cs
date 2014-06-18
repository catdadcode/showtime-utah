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

public partial class EditAboutUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Response.Redirect("Default.aspx");
        }

        if (!this.IsPostBack)
        {
            StreamReader sr = new StreamReader(MapPath("~/DataFiles/AboutUs.stu"));
            rteBody.Value = sr.ReadToEnd();
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
        StreamWriter sw = new StreamWriter(MapPath("~/DataFiles/AboutUs.stu"));
        sw.Write(rteBody.Value);
        sw.Close();
        Response.Redirect("AboutUs.aspx");
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
    //    rteBody.Text += "<img " + sFloat + " src=\"MakeThumbnail.aspx?size=500&image=DataFiles/images/" + fuContentImage.FileName + "\" />";
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
    //        rteBody.Text += "<img " + sFloat + " src=\"MakeThumbnail.aspx?size=500&image=DataFiles/images/" + ddlExistingImages.SelectedValue + "\" />";
    //    }
    //}
}