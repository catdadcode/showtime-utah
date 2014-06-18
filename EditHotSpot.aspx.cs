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

public partial class EditHotSpot : System.Web.UI.Page
{
    string sHotSpotNumber = "1";
    string sImageName;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
            Response.Redirect("Default.aspx");

        sHotSpotNumber = Request.QueryString["p"];

        if (!this.IsPostBack)
        {
            StreamReader sr = new StreamReader(MapPath("~/DataFiles/Show" + sHotSpotNumber + ".stu"));
            tbxTitle.Text = sr.ReadLine();
            sImageName = sr.ReadLine();
            string sColor = sr.ReadLine();
            tbxColor.Text = sColor;
            tbxColor.BackColor = System.Drawing.ColorTranslator.FromHtml(sColor);
            ViewState["ImageName"] = sImageName;
            imgCurrentImage.ImageUrl = "MakeThumbnail.aspx?size=300&image=DataFiles/SidePanelImages/" + sImageName;
            rteBody.Value = sr.ReadToEnd();
            sr.Close();

            //string[] sFiles = Directory.GetFiles(MapPath("~/DataFiles/images/"));
            //foreach (string s in sFiles)
            //{
            //    string s2 = s.Remove(0, s.LastIndexOf('\\') + 1);
            //    ddlExistingImages.Items.Add(s2);
            //}
        }
        else
        {
            sImageName = ViewState["ImageName"].ToString();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        StreamWriter sw = new StreamWriter(MapPath("~/DataFiles/Show" + sHotSpotNumber + ".stu"));
        sw.WriteLine(tbxTitle.Text);
        if (fuImage.HasFile)
        {
            fuImage.SaveAs(MapPath("~/DataFiles/SidePanelImages/" + fuImage.FileName));
            sw.WriteLine(fuImage.FileName);
        }
        else
        {
            sw.WriteLine(sImageName);
        }
        sw.WriteLine(tbxColor.Text);
        sw.Write(rteBody.Value);
        sw.Close();
        Response.Redirect("Default.aspx?p=" + sHotSpotNumber);
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
    //    ddlExistingImages.Items.Add(fuContentImage.FileName);
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
