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
	/// Demo page for AjaxDropDownList
	/// </summary>
	public class DefaultPage : System.Web.UI.Page
	{
		protected CustomControls.AjaxDropDownList ddlCustomers;
		protected System.Web.UI.WebControls.Label lblProducts;
		protected System.Web.UI.WebControls.Label lblOrders;
		protected System.Web.UI.WebControls.Label lblCustomers;
		protected CustomControls.AjaxDropDownList ddlOrders;
		protected System.Web.UI.WebControls.Label lblCustomersResult;
		protected System.Web.UI.WebControls.Label lblOrdersResult;
		protected System.Web.UI.WebControls.Label lblProductsResult;
		protected System.Web.UI.WebControls.Button btnSubmit;
		protected CustomControls.AjaxDropDownList  ddlProducts;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitView();
			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.btnSubmit.Click += new EventHandler(btnSubmit_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void InitView()
		{

			// assign SourceUrl
			string url = "http://localhost/Demo/getLookupData.aspx";
			ddlCustomers.SourceUrl = url;
			ddlOrders.SourceUrl = url;
			ddlProducts.SourceUrl = url;

			// add dependencies between AjaxDropDownList
			// eg. Orders depends on Customers
			//     Products depends on Orders
			ddlCustomers.Observers.Add(ddlOrders);
			ddlOrders.Observers.Add(ddlProducts);
		}

		private void btnSubmit_Click(object sender, System.EventArgs e)
		{
			// access AjaxDropDownList just like a normal DropDownList
			lblCustomersResult.Text = ddlCustomers.SelectedItem.Text;
			lblOrdersResult.Text = ddlOrders.SelectedItem.Text;
			lblProductsResult.Text = ddlProducts.SelectedItem.Text;
		}

	}
}
