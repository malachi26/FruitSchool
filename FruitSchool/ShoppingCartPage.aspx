<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCartPage.aspx.cs" Inherits="FruitSchool.ShoppingCartPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" Class="">
        <AlternatingItemTemplate>
            <tr>
                <td class="col-sm-4">
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                </td>
                <td class="col-sm-4">
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                </td>
                <td class="col-sm-4">
                    <asp:Image ID="FruitImage" runat="server" CssClass="col-sm-6" ImageUrl='<%# Eval("imageLocation") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr class="row">
                <td class="col-sm-4">
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td class="col-sm-4">
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                </td>
                <td class="col-sm-4">
                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                </td>
                <td class="col-sm-4">
                    <asp:Image ID="FruitImage" runat="server" ImageUrl='<%# Eval("imageLocation") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td class="col-sm-4">No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr class="row">
                <td class="col-sm-4">
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td class="col-sm-4">
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                </td>
                <td class="col-sm-4">
                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                </td>
                <td class="col-sm-4">
                    <asp:TextBox ID="imageLocationTextBox" runat="server" Text='<%# Bind("imageLocation") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr >
                <td class="col-sm-4">
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                </td>
                <td class="col-sm-4">
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price", "{0:c}") %>' />
                </td>
                <td class="col-sm-4">
                    <asp:Image ID="FruitImage" runat="server" CssClass="col-sm-6" ImageUrl='<%# Eval("imageLocation") %>' />

                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" class="table-bordered table-striped table-responsive">
                            <tr runat="server">
                                <th runat="server">Name of Product</th>
                                <th runat="server">Price</th>
                                <th runat="server">Sample Image</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server" class="row">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF"></td>
                </tr>
              

            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr class="row">
                <td class="col-sm-4">
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                </td>
                <td class="col-sm-4">
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price", "{0:c}") %>' />
                </td>
                <td class="col-sm-4">
                    <asp:Image CssClass="col-sm-4 cartItems" ID="FruitImage" runat="server" ImageUrl='<%# Eval("imageLocation") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TutorialDatabaseConnectionString %>">
    </asp:SqlDataSource>

    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <label>Enter your name to submit order</label>
                <input runat="server" type="text" id="NameOnOrder"/>
                <asp:Button runat="server" ID="SubmitOrder" CommandName="SubmitOrder" UseSubmitBehavior="true" OnClick="SubmitOrder_Click" Text="Submit your order" />
               

            </div>
        </div>
    </div>
<%--    <script type="text/javascript">
        {
            $('#submitOrder').click();
        }
    </script>--%>
</asp:Content>
