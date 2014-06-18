<%@ Page language="c#" Codebehind="SourceScript.aspx.cs" AutoEventWireup="false" Inherits="Demo.SourceScript" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
	<HEAD>
		<title>Source Script</title>
		<meta name="GENERATOR" Content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" Content="C#">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
		<script type="text/javascript">
		// get XMLHTTP object
		function getXMLHTTP()
		{
			var A = null;
			try{
				A = new ActiveXObject("Msxml2.XMLHTTP");
			}
			catch(e){
				try{
					A = new ActiveXObject("Microsoft.XMLHTTP");
				} catch(oc){
					A = null;
				}
			}
			if(!A && typeof XMLHttpRequest != "undefined") {
				A = new XMLHttpRequest();
			}
			return A;
		}
		
		// controller for AjaxDropDownList
		function AjaxDropDownController(controlClientId, lookupName, baseUrl)
		{
			var self = this;
			
			// public members
			this.controlClientId = controlClientId;
			this.hiddenId = "__" + self.controlClientId;
			this.lookupName = lookupName;
			this.baseUrl = baseUrl;
			this.delimiter = '|';

			// XMLHTTP object
			var xmlHttp;

			// array to store observer list
			var observers = [];			

			// public methods
			this.getSource = getSource;
			this.addObserver = addObserver;
			this.notify = notify;
			this.load = load;
			this.init = init;
			this.persist = persist;

			// call XMLHTTP to get source data
			function getSource(filter)
			{
				var requestUrl = baseUrl + "?id=" + self.lookupName;
				if (filter != undefined && filter != "")
				{
					requestUrl += "&filter=" + filter;
				}
				xmlHttp = getXMLHTTP();
				if (xmlHttp)
				{
					alert(requestUrl);
					xmlHttp.onreadystatechange = doReadyStateChange;
					xmlHttp.open("GET", requestUrl, true);
					xmlHttp.send(null);
				}			
			}
			
			// process the response from XMLHTTP
			function doReadyStateChange()
			{
				if (xmlHttp.readyState == 4)
				{
					if (xmlHttp.status == 200)
					{
						eval("var d=" + xmlHttp.responseText);
						if (d != null)
						{
							populateList(d);
						}
					}
					else
					{
						alert("There was a problem retrieving the data:\n" + xmlHttp.statusText);
					}
				}			
			}
			
			// populate dropdownlist
			function populateList(namevalue)
			{
				if (oSelect = document.getElementById(self.controlClientId))
				{
					var content = "";
					
					// clear dropdownlist
					for(var i=oSelect.length-1; i>=0; i--)
					{
						oSelect.options[i] = null;
					}

					// populate dropdownlist from name-value object
					for(var i=0; i<namevalue.length; i++)
					{
						if (namevalue[i].value == undefined)
						{
							oSelect.options[oSelect.length] = new Option(namevalue[i].name);
							content += namevalue[i].name + self.delimiter + namevalue[i].name + self.delimiter;
						}
						else
						{
							opt = new Option(namevalue[i].name, namevalue[i].value);
							oSelect.options[oSelect.length] = opt;
							content += namevalue[i].name + self.delimiter + namevalue[i].value + self.delimiter;
						}
					}

					// persist the content of dropdownlist as
					// value-delimited string in hidden field
					if (content.substr(content.length-1,1) == self.delimiter)
					{
						content = content.substr(0, content.length-1);
					}
					
					if (oHidden = document.getElementById(self.hiddenId))
					{
						oHidden.value = content;
					}
					
					if (oSelect.selectedIndex > -1){
						if (oSelect.fireEvent)
						{
							oSelect.fireEvent("onchange");
						}
						else if(oSelect.dispatchEvent)
						{
							var oEvent = document.createEvent("HTMLEvents"); 
							oEvent.initEvent("change", true, true);
							oSelect.dispatchEvent(oEvent);
						}
					}
				}
			}
			
			// add observer
			function addObserver(obj)
			{
				var length = observers.length;
				var found = false;
				for (var i=0; i<length; i++)
				{
					if (observers[i] == obj)
					{
						found = true;
						break;
					}
				}
				if (!found)
				{
					observers[observers.length] = obj;
				}			
			}
			
			// notify all observers
			function notify()
			{
				var filter = "";
				var oSelect = document.getElementById(self.controlClientId);
				if (oSelect != null && oSelect.selectedIndex != -1)
				{
					filter = self.lookupName + "," + oSelect.options[oSelect.selectedIndex].value;
				}				
				for(i=0; i<observers.length; i++)
				{
					eval(observers[i] + '.load(filter);');
				}
			}
			
			// load the source data for corresponding dropdownlist
			function load(filter)
			{
				this.getSource(filter);
			}
			
			// initialize corresponding dropdownlist
			function init()
			{
				if ((oSelect = document.getElementById(self.controlClientId)))
				{
					// create hidden field to store dropdownlist content
					if (!(hidden = document.getElementById(self.hiddenId)))
					{
						hidden = document.createElement("input");
						hidden.id = self.hiddenId;
						hidden.name = self.hiddenId;
						hidden.type = "hidden";
						oSelect.form.appendChild(hidden);
					}				

					// load source data if dropdownlist is empty,
					// otherwise persist existing content
					if (oSelect.options.length == 0)
					{
						this.load();
					}
					else
					{
						this.persist(oSelect);
					}
					
					// attach notify event handler to onchange event
					if (oSelect.attachEvent)
					{
						oSelect.attachEvent("onchange", notify);
					}
					else if (oSelect.addEventListener)
					{
						oSelect.addEventListener("change", notify, false);
					}
					else
					{
						oSelect.onchange = notify;
					}
				}
			}
			
			// persist existing content of dropdownlist to hidden field
			function persist(oSelect)
			{
				var content = "";
				for(var i=0; i<oSelect.options.length; i++)
				{
					content += oSelect.options[i].text + self.delimiter + oSelect.options[i].value + self.delimiter;
				}
				
				if (content.substr(content.length-1,1) == self.delimiter)
				{
					content = content.substr(0, content.length-1);
				}
				
				if ((hidden = document.getElementById(self.hiddenId)))
				{
					hidden.value = content;
				}
			}
		}

		var ddlCustomers;
		var ddlOrders;
		var ddlProducts;

		function Initialize()
		{
			var url = "http://localhost/Demo/getLookupData.aspx";

			ddlCustomers = new AjaxDropDownController('ddlCustomers', 'Customer', url);
			ddlOrders = new AjaxDropDownController('ddlOrders', 'Order', url);
			ddlProducts = new AjaxDropDownController('ddlProducts', 'Product', url);

			ddlCustomers.addObserver('ddlOrders');
			ddlOrders.addObserver('ddlProducts');
			
			ddlCustomers.init();
			ddlOrders.init();
			ddlProducts.init();

		}
		</script>
	</HEAD>
	<body MS_POSITIONING="GridLayout">
		<form id="Form1" method="post" runat="server">
			<asp:Label id="lblCustomers" style="Z-INDEX: 101; LEFT: 24px; POSITION: absolute; TOP: 24px"
				runat="server" Width="88px">Customers</asp:Label>
			<asp:Label id="lblOrders" style="Z-INDEX: 102; LEFT: 24px; POSITION: absolute; TOP: 56px" runat="server"
				Width="96px">Order</asp:Label>
			<asp:Label id="lblProducts" style="Z-INDEX: 103; LEFT: 24px; POSITION: absolute; TOP: 88px"
				runat="server" Width="96px">Products</asp:Label>
			<asp:DropDownList id="ddlCustomers" style="Z-INDEX: 104; LEFT: 136px; POSITION: absolute; TOP: 24px"
				runat="server" Width="184px" DataTextField="TEXT" DataValueField="VALUE"></asp:DropDownList>
			<asp:DropDownList id="ddlOrders" style="Z-INDEX: 105; LEFT: 136px; POSITION: absolute; TOP: 56px"
				runat="server" Width="184px" DataTextField="TEXT" DataValueField="VALUE"></asp:DropDownList>
			<asp:DropDownList id="ddlProducts" style="Z-INDEX: 106; LEFT: 136px; POSITION: absolute; TOP: 88px"
				runat="server" Width="184px"></asp:DropDownList><INPUT style="Z-INDEX: 107; LEFT: 24px; POSITION: absolute; TOP: 128px" type="button" onclick="Initialize();"
				value="Initialize">
		</form>
	
<!-- Begin OrangeSoda Tracking Code --> 
<script language="javascript" type="text/javascript"> 
	var cid = 101600; 	// client identifier: must match cid provided by Orange Soda
	var amt = 0.00; 	// amount: optional value of conversion
	var qty = 0;		// quantity: optional quantity of items purchased/requested
	var t = 'h';		// type: 'h' for tracking; 'c' for conversion
	var tid = '';		// transaction id: optional id used by customer to identify the transaction
</script> 
<script type="text/javascript">
	var strProtocol = (document.location.protocol == "https:") ? "https://" : "http://";
	document.write(unescape("%3Cscript src='" + strProtocol + "otracking.com/js/Tracking.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<!-- End OrangeSoda Tracking Code -->

</body>
</HTML>
