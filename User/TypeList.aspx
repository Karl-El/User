<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TypeList.aspx.cs" Inherits="User.TypeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="_lstvwTypeList" runat="server" DataSourceID="_dtsrcTypeList" DataKeyNames="USERTYPEID" OnItemDataBound="_lstvwTypeList_ItemDataBound">
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <ItemTemplate>
            <div class="col-sm-4">
                <asp:Panel ID="Panel1" runat="server">
                    <div class="well">
                        <asp:Label ID="USERTYPEIDLabel" runat="server" Text='<%# Eval("USERTYPEID") %>' Visible="false" />
                        <label class="control-label">User Type Name:</label>
                        <asp:Label ID="USERTYPENAMELabel" runat="server" Text='<%# Eval("USERTYPENAME") %>' />
                        <asp:BulletedList ID="_blltlstPermit" runat="server" DataSourceID="_dtsrcPermit" DataTextField="PERMITNAME" DataValueField="PERMITNAME" Height="90" BulletStyle="Square"></asp:BulletedList>
                        <asp:SqlDataSource runat="server" ID="_dtsrcPermit" ConnectionString='<%$ ConnectionStrings:_cnnctstrngUserDB %>' SelectCommand="SELECT PERMIT.PERMITNAME FROM PERMIT INNER JOIN USERPERMIT ON PERMIT.PERMITID = USERPERMIT.PERMITID WHERE (USERPERMIT.USERTYPEID = @UserTypeID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="USERTYPEIDLabel" PropertyName="Text" Name="USERTYPEID"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:HyperLink ID="_hyprlnkEditPermit" runat="server" NavigateUrl='<%#"~/TypeCRUD.aspx?id="+Eval("USERTYPEID") %>' CssClass="btn btn-link">Edit Permission</asp:HyperLink>
                    </div>
                </asp:Panel>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div class="col-sm-4">
                <div class="well" style="height: 202px; text-align: center">
                    <br />
                    <br />
                    <asp:HyperLink ID="_hyprlnkEditPermit" runat="server" NavigateUrl="~/TypeCRUD.aspx" CssClass="btn btn-link"><i class="fa fa-plus-circle fa-4x"></i><br />New User Type</asp:HyperLink>
                </div>
            </div>
            <div style="">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="True" ButtonCssClass="btn btn-info btn-sm" />
                        <asp:NumericPagerField NumericButtonCssClass="label label-success" CurrentPageLabelCssClass="badge" />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="True" ShowPreviousPageButton="False" ButtonCssClass="btn btn-info btn-sm" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource runat="server" ID="_dtsrcTypeList" ConnectionString='<%$ ConnectionStrings:_cnnctstrngUserDB %>' SelectCommand="SELECT [USERTYPEID], [USERTYPENAME] FROM [USERTYPE]"></asp:SqlDataSource>
</asp:Content>
