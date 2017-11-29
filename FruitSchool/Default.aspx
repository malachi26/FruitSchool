<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FruitSchool.Fruit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="fruitID" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr>
                <td Class="col-sm-2" >
                    <asp:Label ID="titleLabel" runat="server" CssClass="col-sm-4" Text='<%# Eval("title") %>' />
                </td>
                <td Class="col-sm-2" >
                    <asp:Label ID="priceLabel" runat="server" CssClass="col-sm-4" Text='<%# Eval("price", "{0:c}") %>' />
                </td>
                <td Class="col-sm-6" >
                    <asp:Image ID="FruitImage" runat="server" CssClass="col-sm-6"  ImageUrl='<%# Eval("imageLocation") %>'  />
                </td>
                <td Class="col-sm-2" >
                    <asp:Button ID="AddToCart" runat="server" CssClass="col-sm-4" OnCommand="AddFruitToCart" CommandArgument='<%# Eval("fruitID") %>' Text="Add To Cart" OnClientClick="AddFruitToCart" />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr>
                <td Class="col-sm-4" >
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td Class="col-sm-4" >
                    <asp:TextBox ID="titleTextBox" runat="server" CssClass="col-sm-4" Text='<%# Bind("title") %>' />
                </td>
                <td Class="col-sm-4" >
                    <asp:TextBox ID="priceTextBox" runat="server" CssClass="col-sm-4" Text='<%# Bind("price") %>' />
                </td>
                <td Class="col-sm-4" >
                    <asp:TextBox ID="imageLocationTextBox" runat="server" Text='<%# Bind("imageLocation") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                <tr>
                    <td Class="col-sm-4" >No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td Class="col-sm-4" >
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td Class="col-sm-4" >&nbsp;</td>
                <td Class="col-sm-4" >
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                </td>
                <td Class="col-sm-4" >
                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                </td>
                <td Class="col-sm-4" >
                    <asp:TextBox ID="imageLocationTextBox" runat="server" Text='<%# Bind("imageLocation") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr>
                <td Class="col-sm-2" >
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                </td>
                <td Class="col-sm-2" >
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price", "{0:c}") %>' />
                </td>
                <td Class="col-sm-6" >
                    <asp:Image ID="FruitImage" runat="server" CssClass="col-sm-6"  ImageUrl='<%# Eval("imageLocation") %>'  />
                </td>
                <td Class="col-sm-2" >
                    <asp:Button ID="AddToCart" runat="server" OnCommand="AddFruitToCart" CommandArgument='<%# Eval("fruitID") %>' Text="Add To Cart" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" class="table-bordered table-striped table-responsive">
                            <tr runat="server">
                                <th runat="server">Title</th>
                                <th runat="server">Price</th>
                                <th runat="server">Sample Image of Product</th>
                                <th>Add To Cart?</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
               <td Class="col-sm-3" >
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                </td>
                <td Class="col-sm-3" >
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price", "{0:c}") %>' />
                </td>
                <td Class="col-sm-3" >
                    <asp:Image ID="FruitImage" runat="server" CssClass="col-sm-4" ImageUrl='<%# Eval("imageLocation") %>'  />
                </td>
                <td Class="col-sm-3" >
                    <asp:Button ID="AddToCart" runat="server" OnCommand="AddFruitToCart" CommandArgument='<%# Eval("fruitID") %>' Text="Add To Cart" />
                </td>
                
            </tr>
        </SelectedItemTemplate>

    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TutorialDatabaseConnectionString %>" SelectCommand="SELECT [fruitID], [title], [price], [imageLocation] FROM [Fruits]"></asp:SqlDataSource>
    <div class="container">
        <div class="row">
            <div class="col-sm-4"><a href="ShoppingCartPage.aspx" class="btn-info btn-lg">Ready to Check out?</a></div>
        </div>
    </div>
    
</asp:Content>
