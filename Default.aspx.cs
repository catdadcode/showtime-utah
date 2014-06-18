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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Note To New Developers. This code has been optimized in an easy to read fashion.
        //Hopefully we at Chevtek Web Solutions will be the only ones to have to access this
        //in the future, but in the event you have been hired to make changes to this site
        //you can contact us with any questions. Support@Chevtek.com or by phone (801) 669-6663.

        //if ((DateTime.Now.Month == 12) && (DateTime.Now.Day <= 25))
        //{
        //    snow.Visible = true;
        //}
        //else
        //{
        snow.Visible = false;
        //}

        string sP = "1";
        if (Request.QueryString["p"] != null)
            sP = Request.QueryString["p"];

        StreamReader sr = new StreamReader(MapPath("~/DataFiles/Show1.stu"));
        string sTitle = sr.ReadLine();
        string sImage = sr.ReadLine();
        string sColor = sr.ReadLine();
        string sBody1 = sr.ReadToEnd();
        sr.Close();
        LiteralControl lc;
        ImageButton ib = new ImageButton();
        if (sP == "1")
        {
            lc = new LiteralControl("<div style=\"border: solid 0px #ff0000;height:80px;width:280px; background-image:url(images/sidepanel2.gif); background-repeat:no-repeat; background-position:center; padding: 10px;\">");
            ib.Height = 70;
        }
        else
        {
            lc = new LiteralControl("<div style=\"border: solid 0px #ff0000;height:80px;width:280px; background-image:url(images/sidepanel.gif); background-repeat:no-repeat; background-position:center; padding: 10px;\">");
            ib.Height = 70;
        }
        show1.Controls.Add(lc);
        lc = new LiteralControl("<table height=\"80\" width=\"100%\"><tr><td align=\"center\" valign=\"middle\">");
        show1.Controls.Add(lc);
        ib.ImageUrl = "MakeThumbnail.aspx?size=300&image=DataFiles/SidePanelImages/" + sImage;
        ib.PostBackUrl = "?p=1";
        lc = new LiteralControl("</td><td align=\"center\"><div style=\"font-size: 20px;\"><b><a style=\"text-decoration:none; color:" + sColor + ";\" href=\"?p=1\">" + sTitle + "</a></b></div></td></tr></table></div>");
        show1.Controls.Add(ib);
        show1.Controls.Add(lc);

        sr = new StreamReader(MapPath("~/DataFiles/Show2.stu"));
        sTitle = sr.ReadLine();
        sImage = sr.ReadLine();
        sColor = sr.ReadLine();
        string sBody2 = sr.ReadToEnd();
        sr.Close();
        ib = new ImageButton();
        if (sP == "2")
        {
            lc = new LiteralControl("<div style=\"border: solid 0px #ff0000;height:80px;width:280px; background-image:url(images/sidepanel2.gif); background-repeat:no-repeat; background-position:center; padding: 10px;\">");
            ib.Height = 70;
        }
        else
        {
            lc = new LiteralControl("<div style=\"border: solid 0px #ff0000;height:80px;width:280px; background-image:url(images/sidepanel.gif); background-repeat:no-repeat; background-position:center; padding: 10px;\">");
            ib.Height = 70;
        }
        show2.Controls.Add(lc);
        lc = new LiteralControl("<table height=\"80\" width=\"100%\"><tr><td align=\"center\" valign=\"middle\">");
        show2.Controls.Add(lc);
        ib.ImageUrl = "MakeThumbnail.aspx?size=300&image=DataFiles/SidePanelImages/" + sImage;
        ib.PostBackUrl = "?p=2";
        lc = new LiteralControl("</td><td align=\"center\"><div style=\"font-size: 20px;\"><b><a style=\"text-decoration:none; color:" + sColor + ";\" href=\"?p=2\">" + sTitle + "</a></b></div></td></tr></table></div>");
        show2.Controls.Add(ib);
        show2.Controls.Add(lc);

        sr = new StreamReader(MapPath("~/DataFiles/Show3.stu"));
        sTitle = sr.ReadLine();
        sImage = sr.ReadLine();
        sColor = sr.ReadLine();
        string sBody3 = sr.ReadToEnd();
        sr.Close();
        ib = new ImageButton();
        if (sP == "3")
        {
            lc = new LiteralControl("<div style=\"border: solid 0px #ff0000;height:80px;width:280px; background-image:url(images/sidepanel2.gif); background-repeat:no-repeat; background-position:center; padding: 10px;\">");
            ib.Height = 70;
        }
        else
        {
            lc = new LiteralControl("<div style=\"border: solid 0px #ff0000;height:80px;width:280px; background-image:url(images/sidepanel.gif); background-repeat:no-repeat; background-position:center; padding: 10px;\">");
            ib.Height = 70;
        }
        show3.Controls.Add(lc);
        lc = new LiteralControl("<table height=\"80\" width=\"100%\"><tr><td align=\"center\" valign=\"middle\">");
        show3.Controls.Add(lc);
        ib.ImageUrl = "MakeThumbnail.aspx?size=300&image=DataFiles/SidePanelImages/" + sImage;
        ib.PostBackUrl = "?p=3";
        lc = new LiteralControl("</td><td align=\"center\"><div style=\"font-size: 20px;\"><b><a style=\"text-decoration:none; color:" + sColor + ";\" href=\"?p=3\">" + sTitle + "</a></b></div></td></tr></table></div>");
        show3.Controls.Add(ib);
        show3.Controls.Add(lc);

        sr = new StreamReader(MapPath("~/DataFiles/Show4.stu"));
        sTitle = sr.ReadLine();
        sImage = sr.ReadLine();
        sColor = sr.ReadLine();
        string sBody4 = sr.ReadToEnd();
        sr.Close();
        ib = new ImageButton();
        if (sP == "4")
        {
            lc = new LiteralControl("<div style=\"border: solid 0px #ff0000;height:80px;width:280px; background-image:url(images/sidepanel2.gif); background-repeat:no-repeat; background-position:center; padding: 10px;\">");
            ib.Height = 70;
        }
        else
        {
            lc = new LiteralControl("<div style=\"border: solid 0px #ff0000;height:80px;width:280px; background-image:url(images/sidepanel.gif); background-repeat:no-repeat; background-position:center; padding: 10px;\">");
            ib.Height = 70;
        }
        show4.Controls.Add(lc);
        lc = new LiteralControl("<table height=\"80\" width=\"100%\"><tr><td align=\"center\" valign=\"middle\">");
        show4.Controls.Add(lc);
        ib.ImageUrl = "MakeThumbnail.aspx?size=300&image=DataFiles/SidePanelImages/" + sImage;
        ib.PostBackUrl = "?p=4";
        lc = new LiteralControl("</td><td align=\"center\"><div style=\"font-size: 20px;\"><b><a style=\"text-decoration:none; color:" + sColor + ";\" href=\"?p=4\">" + sTitle + "</a></b></div></td></tr></table></div>");
        show4.Controls.Add(ib);
        show4.Controls.Add(lc);

        sr.Close();

        string sBody = sBody1;
        if (sP == "1")
        {
            sBody = "";
            if (sBody1.Length < 75)
            {
                sBody += "<br /><br /><br /><br /><br />";
            }
            sBody += "<center><script type=\"text/javascript\">AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0','width','400','height','225','id','FLVPlayer','src','FLVPlayer_Progressive','flashvars','&MM_ComponentVersion=1&skinName=Clear_Skin_1&streamName=ShowtimeUtah60InternetSpot&autoPlay=true&autoRewind=false','quality','high','scale','noscale','name','FLVPlayer','salign','lt','pluginspage','http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash','movie','FLVPlayer_Progressive' ); //end AC code</script><object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0\" width=\"400\" height=\"225\" id=\"FLVPlayer\"><param name=\"movie\" value=\"FLVPlayer_Progressive.swf\" /><param name=\"salign\" value=\"lt\" /><param name=\"quality\" value=\"high\" /><param name=\"scale\" value=\"noscale\" /><param name=\"FlashVars\" value=\"&MM_ComponentVersion=1&skinName=Clear_Skin_1&streamName=ShowtimeUtah60InternetSpot&autoPlay=true&autoRewind=false\" /><embed src=\"FLVPlayer_Progressive.swf\" flashvars=\"&MM_ComponentVersion=1&skinName=Clear_Skin_1&streamName=ShowtimeUtah60InternetSpot&autoPlay=true&autoRewind=false\" quality=\"high\" scale=\"noscale\" width=\"400\" height=\"225\" name=\"FLVPlayer\" salign=\"LT\" type=\"application/x-shockwave-flash\" pluginspage=\"http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash\" /></object></center>";
            sBody += sBody1;
        }
        else if (sP == "2")
            sBody = sBody2;
        else if (sP == "3")
            sBody = sBody3;
        else if (sP == "4")
            sBody = sBody4;

        if (User.Identity.IsAuthenticated)
        {
            lc = new LiteralControl("<center>");
            maincontent.Controls.Add(lc);
            Button btnEdit = new Button();
            btnEdit.Text = "Edit Hot Spot";
            btnEdit.PostBackUrl = "EditHotSpot.aspx?p=" + sP;
            maincontent.Controls.Add(btnEdit);
            lc = new LiteralControl("</center><br />");
            maincontent.Controls.Add(lc);
        }
        lc = new LiteralControl("<div style=\"text-align:left;\">" + sBody + "</div>");
        maincontent.Controls.Add(lc);
        sr.Close();
    }
}
