<%-- _lcid="1033" _version="14.0.4536" _dal="1" --%>
<%-- _LocalBinding --%>
<%@ Page language="C#" MasterPageFile="~masterurl/default.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=14.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:webpartpageexpansion="full" meta:progid="SharePoint.WebPartPage.Document"  %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
	<SharePoint:ListProperty Property="Title" runat="server"/> - 
	<SharePoint:ListItemProperty Property="BaseName" maxlength="40" runat="server"/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageTitleInTitleArea" runat="server">
	<WebPartPages:WebPartZone runat="server" title="loc:TitleBar" id="TitleBar" AllowLayoutChange="false" AllowPersonalization="false"><ZoneTemplate>
	<WebPartPages:TitleBarWebPart runat="server" AllowEdit="True" AllowConnect="True" ConnectionID="00000000-0000-0000-0000-000000000000" Title="Web Part Page Title Bar" IsIncluded="True" Dir="Default" IsVisible="True" AllowMinimize="False" ExportControlledProperties="True" ZoneID="TitleBar" ID="g_44017a2a_1a67_4a96_9482_34f7e387dc0a" HeaderTitle="Untitled_1" AllowClose="False" FrameState="Normal" ExportMode="All" AllowRemove="False" AllowHide="True" SuppressWebPartChrome="False" DetailLink="" ChromeType="None" HelpLink="" MissingAssembly="Cannot import this Web Part." PartImageSmall="" HelpMode="Modeless" FrameType="None" AllowZoneChange="True" PartOrder="2" Description="" PartImageLarge="" IsIncludedFilter="" __MarkupType="vsattributemarkup" __WebPartId="{44017A2A-1A67-4A96-9482-34F7E387DC0A}" WebPart="true" Height="" Width=""></WebPartPages:TitleBarWebPart>

</ZoneTemplate></WebPartPages:WebPartZone>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderTitleAreaClass" runat="server">
	<style type="text/css">
	Div.ms-titleareaframe {
	height: 100%;
	}
	.ms-pagetitleareaframe table {
	background: none;
	}
  </style>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderAdditionalPageHead" runat="server">
	<meta name="GENERATOR" content="Microsoft SharePoint" />
	<meta name="ProgId" content="SharePoint.WebPartPage.Document" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="CollaborationServer" content="SharePoint Team Web Site" />
	<script type="text/javascript">
// <![CDATA[
	var navBarHelpOverrideKey = "WSSEndUser";
// ]]>
	</script>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderSearchArea" runat="server">
	<SharePoint:DelegateControl runat="server"
		ControlId="SmallSearchInputBox"/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderLeftActions" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageDescription" runat="server">
	<SharePoint:ProjectProperty Property="Description" runat="server"/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderBodyRightMargin" runat="server">
	<div height="100%" class="ms-pagemargin"><img src="/_layouts/images/blank.gif" width="10" height="1" alt="" /></div>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageImage" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderNavSpacer" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">
	<script type="text/javascript">
		function load()
		{
			var request = new Sys.Net.WebRequest();
			request.set_httpVerb("GET");
			request.set_url("http://sp2010/_vti_bin/ListData.svc/Songs?$filter=Artist/Title eq 'George Michael'");
			request.get_headers()['Accept'] = 'application/json';
			request.add_completed(handleRequestComplete);
			request.invoke();
		}
		
		function handleRequestComplete(response, userContext)
		{
			var songs = response.get_object().d;
				
			var outputHtml = "" ;	
			for (var i = 0; i < songs.results.length ; i++)
			{
				outputHtml = outputHtml + "<br/>" + songs.results[i].Title ;
			}
			
			$get("results").innerHTML = outputHtml;
		}
		
		Sys.Application.add_load(load);
		
		function AddNewArtist()
		{
			var request = new Sys.Net.WebRequest();
			request.set_httpVerb("POST");
			request.set_url("/_vti_bin/listdata.svc/Artists");
			request.get_headers()['Accept'] = 'application/json';
			request.get_headers()['Content-Type'] = 'application/json';
			request.set_body("{Title: \"Aerosmith\"}")
			request.add_completed(handleInsertCompleted);
			request.invoke();
		}
		
		function handleInsertCompleted(response, userContext)
		{
			alert('New artist created') ;
		}
		
		function DeleteArtist()
		{
			var request = new Sys.Net.WebRequest();
			request.set_httpVerb("GET");
			request.set_url("http://sp2010/_vti_bin/ListData.svc/Artists?$filter=Title eq 'Aerosmith'");
			request.get_headers()['Accept'] = 'application/json';
			request.add_completed(handleDeleteQueryCompleted);
			request.invoke();
		}
		
		function handleDeleteQueryCompleted(response, userContext)
		{
			var artists = response.get_object().d;
				
			var aerosmithID = "" ;	
			for (var i = 0; i < artists.results.length ; i++)
			{
				aerosmithID = artists.results[i].ID ;
			}
			
			var request = new Sys.Net.WebRequest();
			request.set_httpVerb("DELETE");
			request.set_url("/_vti_bin/listdata.svc/Artists(" + aerosmithID + ")");
			request.get_headers()['Accept'] = 'application/json';
			request.get_headers()['Content-Type'] = 'application/json';
			request.add_completed(handleDeleteCompleted);
			request.invoke();
		}
		
		function handleDeleteCompleted(response, userContext)
		{
			alert('Artist Deleted') ;
		}
	</script>
	
	<input type="Button" onclick="AddNewArtist()" value="Click to add an artist"/>
	<br/>	
	<input type="Button" onclick="DeleteArtist()" value="Click to delete artist"/>
	<br/>

	<h1>Fetched Artists:</h1>
	<div id="results"/>
</asp:Content>
