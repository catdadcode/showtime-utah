<%@ Page Language="C#" MasterPageFile="~/MyMaster.master" AutoEventWireup="true" Inherits="Show" Title="Untitled Page" Codebehind="Show.aspx.cs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table ID="Table1" >
        <tr>
            <td style="width:100px;"></td>
            <td>
                <div >
      <asp:GridView ID="ShowsGrid" runat="server" AutoGenerateColumns="False"  autogenerateselectbutton="True" 
                           DataKeyNames="ShowID" DataSourceID="ShowsDataSource" 
            onselectedindexchanged="ShowsGrid_SelectedIndexChanged" Width="650">
                            <HeaderStyle BackColor="#6e76e5" />
                           <Columns>
                               <asp:BoundField  DataField="Name" HeaderText="Name" SortExpression="Name" ShowHeader="true"/>
                               <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" 
                                   ShowHeader="true" DataFormatString="{0:d}"/>
                               <asp:BoundField DataField="Music" HeaderText="Music" SortExpression="Music" ShowHeader="true"/>
                           </Columns>
                       
                       </asp:GridView>
                       <asp:ObjectDataSource ID="ShowsDataSource" runat="server" 
                           OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                           TypeName="ShowsTableAdapters.ShowSelectALLTableAdapter">
                       </asp:ObjectDataSource>
    </div>
            </td>
        </tr>
    </table>
    
    </asp:Content>
