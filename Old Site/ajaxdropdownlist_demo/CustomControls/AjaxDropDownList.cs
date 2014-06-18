//==============================================================================
// AjaxDropDownList
// 
// A custom dropdownlist that can populate its content by utilizing AJAX and
// participate in a linked dropdownlist by implementing observer pattern
//
// Compatibility:
// Microsoft Internet Explorer 6 and Mozilla Firefox 1.04
//==============================================================================
// Copyright © Enrico Elizar Samuel.  All rights reserved.
//
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY
// OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT
// LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
// FITNESS FOR A PARTICULAR PURPOSE.
//==============================================================================

using System;
using System.Web;
using System.Web.UI.WebControls;
using System.Collections;
using System.ComponentModel;
using System.Text;

namespace CustomControls
{
	/// <summary>
	/// A custom dropdownlist that can populate its content by utilizing AJAX and
	/// participate in a linked dropdownlist
	/// </summary>
	public class AjaxDropDownList : System.Web.UI.WebControls.DropDownList 
	{

		#region Private members
		
		private ArrayList _observers = new ArrayList();
		private string _sourceUrl = string.Empty;
		private string _lookupName = string.Empty;
		private char _delimiter = '|';

		#endregion

		#region Properties

		/// <summary>
		/// Get/set collection of observers for this dropdownlist
		/// </summary>
		[Category("AJAX"),
		Description("Collection of observers that listen to the this control. Populate this property through server code")] 
		public ArrayList Observers
		{
			get { return _observers; }
			set { _observers = value; }
		}

		/// <summary>
		/// Get/set url of source data, eg. http://localhost/getLookupHandler.ashx
		/// </summary>
		[Category("AJAX"),
		Description("URL of source data, eg. http://localhost/getLookupHandler.ashx")]  
		public string SourceUrl
		{
			get { return _sourceUrl; }
			set { _sourceUrl = value; }
		}

		/// <summary>
		/// Get/set Lookup Name, eg. Country, Currency or OrderStatus
		/// </summary>
		[Category("AJAX"),
		Description("Lookup Name, eg. Country, Currency or OrderStatus")] 
		public string LookupName
		{
			get { return _lookupName; }
			set { _lookupName = value; }
		}

		/// <summary>
		/// Get/set delimiter for data persistence in the client side
		/// </summary>
		[Category("AJAX"),
		Description("Delimiter for data persistence in the client side")]
		public char Delimiter
		{
			get { return _delimiter; }
			set { _delimiter = value; }
		}

		#endregion

		#region Overriden methods

		protected override void OnLoad(EventArgs e)
		{
			if (Page.IsPostBack)
			{
				// get selected value from form data
				string selectedValue = null;
				if (HttpContext.Current.Request.Params[this.UniqueID] != null)
				{
					selectedValue = HttpContext.Current.Request.Params[this.UniqueID];
				}

				// get list of items from from data
				if (HttpContext.Current.Request.Params["__" + this.ClientID] != null)
				{
					this.Items.Clear();
					string content = HttpContext.Current.Request.Params["__" + this.ClientID];
					string[] listItems = content.Split(_delimiter);
					for(int i=0; i<listItems.Length-1; i++)
					{
						this.Items.Add(new ListItem(listItems[i], listItems[i+1]));
						i++;
					}

					ListItem selectedListItem = this.Items.FindByValue(selectedValue);
					if (selectedListItem != null)
					{
						selectedListItem.Selected = true;
					}
				}
			}

			base.OnLoad (e);
		}

		protected override void OnPreRender(EventArgs e)
		{
			// inject controller client script if necessary
			if(!Page.IsClientScriptBlockRegistered("controller"))
			{
				Page.RegisterClientScriptBlock("controller", getControllerScript());
			}

			// inject initialization client script
			Page.RegisterStartupScript("init_" + this.ClientID, getStartupScript());

			base.OnPreRender(e);
		}

		#endregion

		#region Private methods

		/// <summary>
		/// Generate client script for initialization
		/// </summary>
		/// <returns></returns>
		private string getStartupScript()
		{
			StringBuilder sb = new StringBuilder();
			sb.Append("<script language=\"javascript\">\n");
			sb.AppendFormat("var {0} = new AjaxDropDownController('{0}','{1}','{2}');\n", this.ClientID, this.LookupName, this.SourceUrl);
			for(int i=0; i<this.Observers.Count; i++)
			{
				AjaxDropDownList ctl = this.Observers[i] as AjaxDropDownList;
				if (ctl != null)
				{
					sb.AppendFormat("{0}.addObserver('{1}');\n", this.ClientID, ctl.ClientID);
				}
			}
			sb.AppendFormat("{0}.init()\n", this.ClientID);
			sb.Append("</script>\n");
			return sb.ToString();

		}

		/// <summary>
		/// Generate client script for controlling dropdownlist
		/// </summary>
		/// <returns></returns>
		private string getControllerScript()
		{
			StringBuilder sb = new StringBuilder();
			sb.Append("<script type=\"text/javascript\">\n");

			sb.Append(@"function getXMLHTTP()
{var A=null;try{A=new ActiveXObject('Msxml2.XMLHTTP');}
catch(e){try{A=new ActiveXObject('Microsoft.XMLHTTP');}catch(oc){A=null;}}
if(!A&&typeof XMLHttpRequest!='undefined'){A=new XMLHttpRequest();}
return A;}
function AjaxDropDownController(controlClientId,lookupName,baseUrl)");

			sb.AppendFormat("{{var self=this;this.controlClientId=controlClientId;this.hiddenId='__'+self.controlClientId;this.lookupName=lookupName;this.baseUrl=baseUrl;this.delimiter='{0}';var xmlHttp;var observers=[];this.getSource=getSource;this.addObserver=addObserver;this.notify=notify;this.load=load;this.init=init;this.persist=persist;function getSource(filter)\n", _delimiter);

			sb.Append(@"{var requestUrl=baseUrl+'?id='+self.lookupName;if(filter!=undefined&&filter!='')
{requestUrl+='&filter='+filter;}
xmlHttp=getXMLHTTP();if(xmlHttp)
{xmlHttp.onreadystatechange=doReadyStateChange;xmlHttp.open('GET',requestUrl,true);xmlHttp.send(null);}}
function doReadyStateChange()
{if(xmlHttp.readyState==4)
{if(xmlHttp.status==200)
{eval('var d='+xmlHttp.responseText);if(d!=null)
{populateList(d);}}
else
{alert('There was a problem retrieving the data:\n'+xmlHttp.statusText);}}}
function populateList(namevalue)
{if(oSelect=document.getElementById(self.controlClientId))
{var content='';for(var i=oSelect.length-1;i>=0;i--)
{oSelect.options[i]=null;}
for(var i=0;i<namevalue.length;i++)
{if(namevalue[i].value==undefined)
{oSelect.options[oSelect.length]=new Option(namevalue[i].name);content+=namevalue[i].name+self.delimiter+namevalue[i].name+self.delimiter;}
else
{opt=new Option(namevalue[i].name,namevalue[i].value);oSelect.options[oSelect.length]=opt;content+=namevalue[i].name+self.delimiter+namevalue[i].value+self.delimiter;}}
if(content.substr(content.length-1,1)==self.delimiter)
{content=content.substr(0,content.length-1);}
if(oHidden=document.getElementById(self.hiddenId))
{oHidden.value=content;}
if(oSelect.selectedIndex>-1){if(oSelect.fireEvent)
{oSelect.fireEvent('onchange');}
else if(oSelect.dispatchEvent)
{var oEvent=document.createEvent('HTMLEvents');oEvent.initEvent('change',true,true);oSelect.dispatchEvent(oEvent);}}}}
function addObserver(obj)
{var length=observers.length;var found=false;for(var i=0;i<length;i++)
{if(observers[i]==obj)
{found=true;break;}}
if(!found)
{observers[observers.length]=obj;}}
function notify()
{var filter='';var oSelect=document.getElementById(self.controlClientId);if(oSelect!=null&&oSelect.selectedIndex!=-1)
{filter=self.lookupName+','+oSelect.options[oSelect.selectedIndex].value;}
for(i=0;i<observers.length;i++)
{eval(observers[i]+'.load(filter);');}}
function load(filter)
{this.getSource(filter);}
function init()
{if((oSelect=document.getElementById(self.controlClientId)))
{if(!(hidden=document.getElementById(self.hiddenId)))
{hidden=document.createElement('input');hidden.id=self.hiddenId;hidden.name=self.hiddenId;hidden.type='hidden';oSelect.form.appendChild(hidden);}
if(oSelect.options.length==0)
{this.load();}
else
{this.persist(oSelect);}
if(oSelect.attachEvent)
{oSelect.attachEvent('onchange',notify);}
else if(oSelect.addEventListener)
{oSelect.addEventListener('change',notify,false);}
else
{oSelect.onchange=notify;}}}
function persist(oSelect)
{var content='';for(var i=0;i<oSelect.options.length;i++)
{content+=oSelect.options[i].text+self.delimiter+oSelect.options[i].value+self.delimiter;}
if(content.substr(content.length-1,1)==self.delimiter)
{content=content.substr(0,content.length-1);}
if((hidden=document.getElementById(self.hiddenId)))
{hidden.value=content;}}}");

			sb.Append("</script>\n");
			return sb.ToString();
		}

		#endregion

	}
}
