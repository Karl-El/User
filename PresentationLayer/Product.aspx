<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="PresentationLayer.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-sm-3">
        <div class="well">
            <h3>Brands</h3>
            <div class="row">
                <asp:RadioButtonList ID="_rdbtnlstBrand" runat="server" CssClass="checkbox checkbox-circle checkbox-info"></asp:RadioButtonList>
                <%--<asp:SqlDataSource runat="server" ID="_dtsrcProdBrand" ConnectionString='<%$ ConnectionStrings:CnnctSrngUserDB %>' SelectCommand="SELECT DISTINCT BRAND FROM PRODUCT"></asp:SqlDataSource>--%>
            </div>
        </div>
    </div>
    <div class="col-sm-9">
        <div class="well">
            <div class="row">
                <asp:GridView ID="_grdvwProd" runat="server" CssClass="table table-responsive table-condensed table-hover" HeaderStyle-CssClass="info" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="_grdvwProd_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="PRODID" HeaderText="ID" />
                        <asp:BoundField DataField="BRAND" HeaderText="Brand" />
                        <asp:BoundField DataField="MODEL" HeaderText="Model" />
                        <asp:BoundField DataField="PRICE" HeaderText="Price" />
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" Position="Bottom" PageButtonCount="10"/>
                    <PagerStyle BackColor="LightBlue" Height="30px" VerticalAlign="Bottom" HorizontalAlign="Center" />
                </asp:GridView>
            </div>
        </div>
        <div class="well">
            <div class="row">
                <div class="col-sm-3">
                    <label class="control-label">ID:</label>
                    <asp:TextBox runat="server" ID="_txtbxProdID" CssClass="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Brand:</label>
                    <asp:TextBox runat="server" ID="_txtbxBrand" CssClass="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Model:</label>
                    <asp:TextBox runat="server" ID="_txtbxModel" CssClass="form-control" />
                </div>
                <div class="col-sm-3">
                    <label class="control-label">Price:</label>
                    <asp:TextBox runat="server" ID="_txtbxPrice" CssClass="form-control" />
                </div>
            </div>
            <hr />
            <asp:Button ID="_btnInsert" runat="server" Text="Insert" CssClass="btn btn-success" OnClick="_btnInsert_Click" />
            <asp:Button ID="_btnUpdate" runat="server" Text="Update" CssClass="btn btn-info" OnClick="_btnUpdate_Click" />
            <asp:Button ID="_btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="_btnDelete_Click" />
        </div>
    </div>
</asp:Content>
