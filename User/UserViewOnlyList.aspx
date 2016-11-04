<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserViewOnlyList.aspx.cs" Inherits="User.UserViewOnlyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="_lstvwUserViewOnly" runat="server" DataSourceID="_dtsrcUserViewOnly">
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr runat="server">
                <td></td>
                <%--<td>
                    <asp:Label ID="USERIDLabel" runat="server" Text='<%# Eval("USERID") %>' />
                </td>--%>
                <td>
                    <asp:Label ID="USERNAMELabel" runat="server" Text='<%# Eval("USERNAME") %>' />
                </td>
                <td>
                    <asp:Label ID="EMAILLabel" runat="server" Text='<%# Eval("EMAIL") %>' />
                </td>
                <td>
                    <%--<asp:Label ID="USERPASSLabel" runat="server" Text='<%# Eval("USERPASS") %>' />--%>
                    <asp:Label ID="USERPASSLabel" runat="server" Text='*****************' />
                </td>
                <td>
                    <asp:Label ID="USERTYPENAMELabel" runat="server" Text='<%# Eval("USERTYPENAME") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="Div1" runat="server" class="well table-responsive">
                <div id="Div2" runat="server">
                    <div id="Div3" runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="" class="table table-condensed table-hover">
                            <tr id="Tr1" runat="server" style="" class="info">
                                <th id="Th1" runat="server"></th>
                                <%--<th runat="server">USERID</th>--%>
                                <th id="Th2" runat="server">Username</th>
                                <th id="Th3" runat="server">Email Address</th>
                                <th id="Th4" runat="server">Password</th>
                                <th id="Th5" runat="server">User Type</th>
                                <th id="Th6" runat="server"></th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder">
                            </tr>
                        </table>
                    </div>
                </div>
                <tr id="Tr3" runat="server">
                    <td id="Td1" runat="server" style="">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="True" ButtonCssClass="btn btn-info btn-sm" />
                                <asp:NumericPagerField NumericButtonCssClass="label label-success" CurrentPageLabelCssClass="badge" />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="True" ShowPreviousPageButton="False" ButtonCssClass="btn btn-info btn-sm" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource runat="server" ID="_dtsrcUserViewOnly" ConnectionString='<%$ ConnectionStrings:_cnnstrngUserDBOne %>' SelectCommand="SELECT USERS.USERNAME, USERS.EMAIL, USERS.USERPASS, USERTYPE.USERTYPENAME FROM USERS INNER JOIN USERTYPE ON USERS.USERTYPEID = USERTYPE.USERTYPEID"></asp:SqlDataSource><asp:SqlDataSource runat="server" ID="_dtsrcUserList" ConnectionString='<%$ ConnectionStrings:_cnnstrngUserDBOne %>' DeleteCommand="DELETE FROM [USERS] WHERE [USERID] = @USERID" InsertCommand="INSERT INTO [USERS] ([USERNAME], [EMAIL], [USERPASS], [USERTYPEID]) VALUES (@USERNAME, @EMAIL, @USERPASS, @USERTYPEID)" SelectCommand="SELECT USERS.USERID, USERS.USERNAME, USERS.EMAIL, USERS.USERPASS, USERTYPE.USERTYPENAME FROM USERS INNER JOIN USERTYPE ON USERS.USERTYPEID = USERTYPE.USERTYPEID" UpdateCommand="UPDATE [USERS] SET [USERNAME] = @USERNAME, [EMAIL] = @EMAIL, [USERPASS] = @USERPASS, [USERTYPEID] = @USERTYPEID WHERE [USERID] = @USERID">
        <DeleteParameters>
            <asp:Parameter Name="USERID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="USERNAME" Type="String"></asp:Parameter>
            <asp:Parameter Name="EMAIL" Type="String"></asp:Parameter>
            <asp:Parameter Name="USERPASS" Type="String"></asp:Parameter>
            <asp:Parameter Name="USERTYPEID" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="USERNAME" Type="String"></asp:Parameter>
            <asp:Parameter Name="EMAIL" Type="String"></asp:Parameter>
            <asp:Parameter Name="USERPASS" Type="String"></asp:Parameter>
            <asp:Parameter Name="USERTYPEID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="USERID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <div class="text-center">
        <hr />
        <footer>
            <p>
                <asp:Button ID="_btnLogOut" runat="server" Text="Logout" CssClass="btn btn-info" OnClick="_btnLogOut_Click"/>
            </p>
        </footer>
    </div>
</asp:Content>
