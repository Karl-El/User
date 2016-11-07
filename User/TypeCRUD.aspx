<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TypeCRUD.aspx.cs" Inherits="User.TypeCRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-sm-4">
    </div>
    <div class="col-sm-4">
        <div class="well">
            <div class="row">
                <label class="control-label">User Type Name:</label>
                <asp:TextBox ID="_txtbxUserType" runat="server" CssClass="form-control"></asp:TextBox>
                <label class="control-label">Permission:</label>
                <asp:CheckBoxList ID="_chkbxlstAccess" runat="server" DataSourceID="_dtsrcType" DataTextField="PERMITNAME" DataValueField="PERMITID" CssClass="checkbox checkbox-danger" RepeatDirection="VERTICAL" TextAlign="Right"></asp:CheckBoxList>
                <asp:SqlDataSource runat="server" ID="_dtsrcType" ConnectionString='<%$ ConnectionStrings:_cnnstrngUserDBOne %>' SelectCommand="SELECT [PERMITID], [PERMITNAME] FROM [PERMIT]"></asp:SqlDataSource>
            </div>
            <hr />
            <div class="row">
                <asp:Button ID="SaveButton" runat="server" Text="Save" CssClass="btn btn-primary"  OnClick="SaveButton_Click"/>
                <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClientClick=" window.location = '/TypeList.aspx';this.form.reset();return false;" />
            </div>
        </div>
    </div>
    <div class="col-sm-4">
    </div>
</asp:Content>
