<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCartPage.aspx.cs" Inherits="FruitSchool.ShoppingCartPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                </td>
                <td>
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                </td>
                <td>
                    <asp:Image ID="FruitImage" runat="server" ImageUrl='<%# Eval("imageLocation") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                </td>
                <td>
                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                </td>
                <td>
                    <asp:Image ID="FruitImage" runat="server" ImageUrl='<%# Eval("imageLocation") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                </td>
                <td>
                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                </td>
                <td>
                    <asp:Image ID="FruitImage" runat="server" ImageUrl='<%# Eval("imageLocation") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                </td>
                <td>
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                </td>
                <td>
                    <asp:Image ID="FruitImage" runat="server" ImageUrl='<%# Eval("imageLocation") %>' />
                    
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">title</th>
                                <th runat="server">price</th>
                                <th runat="server">imageLocation</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                </td>
                <td>
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                </td>
                <td>
                    <asp:Image ID="FruitImage" runat="server" ImageUrl='<%# Eval("imageLocation") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TutorialDatabaseConnectionString %>">
    </asp:SqlDataSource>
</asp:Content>
