<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="User.LogIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label><asp:TextBox ID="_txtbxUserName" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label><asp:TextBox ID="_txtbxUserPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <hr />
            <asp:Button ID="_btnLogIn" runat="server" Text="Log In" CssClass="btn btn-primary center-block" OnClick="_btnLogIn_Click" />
            <%--<asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="btn btn-danger" />--%>
        </div>
        <div class="col-sm-4"></div>
</asp:Content>
