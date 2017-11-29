<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderReceivedPage.aspx.cs" Inherits="FruitSchool.OrderReceivedPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div class="col-lg-12">

            <%foreach (var item in cartItems)
              {%>
            <div class="row">
                <div class="col-lg-2"><% item.Quantity.ToString(); %></div>
                <div class="col-lg-2"><% item.Fruit.Title.ToString(); %></div>
                <div class="col-lg-2"><% String.Format(item.Fruit.Price.ToString(), "c"); %></div>
                <div class="col-lg-6"><img runat="server" src="<% item.Fruit.ImageLocation.ToString() %>" /></div>

                <%} %>
                

                <asp:TextBox runat="server" ID="Gratitude"></asp:TextBox>
            </div>
        </div>
    </div>
</asp:Content>
