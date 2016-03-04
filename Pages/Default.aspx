<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <SharePoint:ScriptLink name="sp.js" runat="server" OnDemand="true" LoadAfterUI="true" Localizable="false" />
    <meta name="WebPartPageExpansion" content="full" />

    <!-- Add your CSS styles to the following file -->
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />

    <!-- Add your JavaScript to the following file -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular-route.min.js"></script>
    <script type="text/javascript" src="../Scripts/AngularSP.js"></script>
    <script type="text/javascript" src="../Scripts/App.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    SPFest Denver 2016 Angular Demo
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <div ng-app="SPFestDenver16AngularDemo" ng-controller="DemoController">
		<div style="float:left">
			<input type="text" ng-model="VM.Title" /><input type="button" value="Click Me" ng-click="VM.Clicked()" /><br />
			<ul>
				<li ng-repeat="band in VM.Bands" ng-click="VM.SelectedBand = band">
					{{band.Title}} - {{band.Category1}}
				</li>
			</ul>
			<input type="text" placeholder="Band Name" ng-model="VM.newBand.Title" /><br />
			<input type="text" placeholder="Image URL" ng-model="VM.newBand.ImageUrl" /><br />
			<select ng-model="VM.newBand.Category1">
				<option>Rock</option>
				<option>Country</option>
				<option>Techno</option>
			</select>
			<textarea rows="2" cols="10" ng-model="VM.newBand.Description1"></textarea>
			<input type="button" value="Add" ng-click="VM.Save()" />
		</div>
		<div style="float:left" ng-if="VM.SelectedBand != null">
			<img ng-src="VM.SelectedBand.ImageUrl" /><br />
			{{VM.SelectedBand.Description1}}
		</div>
    </div>

</asp:Content>
