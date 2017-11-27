<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FruitPage.aspx.cs" Inherits="FruitSchool.Fruit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ListView ID="ListView1" runat="server" DataKeyNames="fruitID" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <td>
                    <asp:Label ID="fruitIDLabel" runat="server" Text='<%# Eval("fruitID") %>' />
                </td>
                <td>
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                </td>
                <td>
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                </td>
                <td>
                    <asp:Label ID="imageLocationLabel" runat="server" Text='<%# Eval("imageLocation") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #999999;">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="fruitIDLabel1" runat="server" Text='<%# Eval("fruitID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                </td>
                <td>
                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                </td>
                <td>
                    <asp:TextBox ID="imageLocationTextBox" runat="server" Text='<%# Bind("imageLocation") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
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
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                </td>
                <td>
                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                </td>
                <td>
                    <asp:TextBox ID="imageLocationTextBox" runat="server" Text='<%# Bind("imageLocation") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;">
                <td>
                    <asp:Label ID="fruitIDLabel" runat="server" Text='<%# Eval("fruitID") %>' />
                </td>
                <td>
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                </td>
                <td>
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                </td>
                <td>
                    <asp:Label ID="imageLocationLabel" runat="server" Text='<%# Eval("imageLocation") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                <th runat="server">fruitID</th>
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
                    <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                <td>
                    <asp:Label ID="fruitIDLabel" runat="server" Text='<%# Eval("fruitID") %>' />
                </td>
                <td>
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                </td>
                <td>
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                </td>
                <td>
                    <asp:Image ID="FruitImage" runat="server" ImageUrl='<%# Eval("imageLocation") %>' />
                </td>
                <td>
                    <asp:Button ID="AddToCart" runat="server" CommandName="AddFruitToCart" CommandArgument='<%# Eval("fruitID") %>' Text="Add To Cart" />
                </td>
                
            </tr>
        </SelectedItemTemplate>

    </asp:ListView>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" ItemType="FruitSchool.Models.Fruit" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="fruitID" >
        <Columns>
            <asp:BoundField DataField="fruitID" HeaderText="fruitID" SortExpression="fruitID" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="imageLocation" HeaderText="imageLocation" SortExpression="imageLocation" />
        </Columns>
        
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TutorialDatabaseConnectionString %>" SelectCommand="SELECT [fruitID], [title], [price], [imageLocation] FROM [Fruits]"></asp:SqlDataSource>
</asp:Content>
