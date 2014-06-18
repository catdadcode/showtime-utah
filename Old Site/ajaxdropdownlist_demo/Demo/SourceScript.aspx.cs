using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Demo
{
	/// <summary>
	/// 
	/// </summary>
	public class SourceScript : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label lblCustomers;
		protected System.Web.UI.WebControls.Label lblOrders;
		protected System.Web.UI.WebControls.Label lblProducts;
		protected System.Web.UI.WebControls.DropDownList ddlOrders;
		protected System.Web.UI.WebControls.DropDownList ddlCustomers;
		protected System.Web.UI.WebControls.DropDownList ddlProducts;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion


	}
}
