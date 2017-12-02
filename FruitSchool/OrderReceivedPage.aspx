<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderReceivedPage.aspx.cs" Inherits="FruitSchool.OrderReceivedPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <p>You order the following fruit from us:</p>
        <table class="col-lg-12 container table table-bordered table-responsive">
            <thead>
                <tr class=" title row top">
                    <td class="col-lg-2">Quantity</td>
                    <td class="col-lg-2">Name of Fruit</td>
                    <td class="col-lg-2">Cost</td>
                    <td class="col-lg-6">Sample Image of Fruit</td>
                </tr>
            </thead>
            <tbody>
            <%foreach (var item in cartItems)
                {
            %>
            <tr class="row">
                <td class="col-lg-2"><% Response.Write(item.Quantity.ToString()); %></td>
                <td class="col-lg-2"><% Response.Write(item.Fruit.Title.ToString()); %></td>
                <td class="col-lg-2"><% Response.Write(String.Format(item.Fruit.Price.ToString(), "c")); %></td>
                <td class="col-lg-6">
                    <img class="col-lg-6" src="<% Response.Write(item.Fruit.ImageLocation.ToString()); %>" />
                </td>
            </tr>
            <%}; %>
                </tbody>

            <asp:TextBox runat="server" ID="Gratitude"></asp:TextBox>
        </table>
    </div>
</asp:Content>
