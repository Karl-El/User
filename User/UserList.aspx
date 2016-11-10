<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="User.UserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="_btnAddUser" runat="server" CssClass="btn btn-success center-block" Text="New User" OnClick="_btnAddUser_Click"></asp:Button><br />
    <asp:ListView ID="_lstvwUserList" runat="server" DataSourceID="_dtsrcUserList" DataKeyNames="USERID">
        <%--<AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </td>
                <td>
                    <asp:Label ID="USERIDLabel" runat="server" Text='<%# Eval("USERID") %>' />
                </td>
                <td>
                    <asp:Label ID="USERNAMELabel" runat="server" Text='<%# Eval("USERNAME") %>' />
                </td>
                <td>
                    <asp:Label ID="EMAILLabel" runat="server" Text='<%# Eval("EMAIL") %>' />
                </td>
                <td>
                    <asp:Label ID="USERPASSLabel" runat="server" Text='<%# Eval("USERPASS") %>' />
                </td>
                <td>
                    <asp:Label ID="USERTYPENAMELabel" runat="server" Text='<%# Eval("USERTYPENAME") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>--%>
        <%--<EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="USERIDLabel1" runat="server" Text='<%# Eval("USERID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' />
                </td>
                <td>
                    <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                </td>
                <td>
                    <asp:TextBox ID="USERPASSTextBox" runat="server" Text='<%# Bind("USERPASS") %>' />
                </td>
                <td>
                    <asp:TextBox ID="USERTYPENAMETextBox" runat="server" Text='<%# Bind("USERTYPENAME") %>' />
                </td>
            </tr>
        </EditItemTemplate>--%>
        <%--<InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox ID="USERNAMETextBox" runat="server" Text='<%# Bind("USERNAME") %>' />
                </td>
                <td>
                    <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                </td>
                <td>
                    <asp:TextBox ID="USERPASSTextBox" runat="server" Text='<%# Bind("USERPASS") %>' />
                </td>
                <td>
                    <asp:TextBox ID="USERTYPENAMETextBox" runat="server" Text='<%# Bind("USERTYPENAME") %>' />
                </td>
            </tr>
        </InsertItemTemplate>--%>
        <%--<SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                </td>
                <td>
                    <asp:Label ID="USERIDLabel" runat="server" Text='<%# Eval("USERID") %>' />
                </td>
                <td>
                    <asp:Label ID="USERNAMELabel" runat="server" Text='<%# Eval("USERNAME") %>' />
                </td>
                <td>
                    <asp:Label ID="EMAILLabel" runat="server" Text='<%# Eval("EMAIL") %>' />
                </td>
                <td>
                    <asp:Label ID="USERPASSLabel" runat="server" Text='<%# Eval("USERPASS") %>' />
                </td>
                <td>
                    <asp:Label ID="USERTYPENAMELabel" runat="server" Text='<%# Eval("USERTYPENAME") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>--%>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr onclick="window.location.href='<%# System.Web.VirtualPathUtility.ToAbsolute("~/UserCrud.aspx?id=" + Eval("USERID"))%>';">
                <%--<td onclick="return confirm('Are you sure to delete?')">
                    <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                </td>--%>
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
                                <%--<th runat="server"></th>--%>
                                <%--<th runat="server">USERID</th>--%>
                                <th runat="server">Username</th>
                                <th runat="server">Email Address</th>
                                <th runat="server">Password</th>
                                <th runat="server">User Type</th>
                                <%--<th runat="server"></th>--%>
                            </tr>
                            <tr runat="server" id="itemPlaceholder">
                            </tr>
                            <%--<tr runat="server" style="" align="right">
                                <td colspan="5">
                                    <asp:LinkButton runat="server" ID="_btnAdd" CssClass="btn btn-info " OnClick="_btnAdd_Click"><span class="glyphicon glyphicon-plus"></span> Add New User</asp:LinkButton>
                                    <input type="button" value="Back" onclick="window.location = 'UserCRUD.aspx';" class="btn btn-warning" />
                                </td>
                            </tr>--%>
                        </table>
                    </div>
                </div>
                <tr runat="server">
                    <td runat="server" style="">
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
    <asp:SqlDataSource runat="server" ID="_dtsrcUserList" ConnectionString='<%$ ConnectionStrings:_cnnctstrngUserDB %>' DeleteCommand="DELETE FROM [USERS] WHERE [USERID] = @USERID" InsertCommand="INSERT INTO [USERS] ([USERNAME], [EMAIL], [USERPASS], [USERTYPEID]) VALUES (@USERNAME, @EMAIL, @USERPASS, @USERTYPEID)" SelectCommand="SELECT USERS.USERID, USERS.USERNAME, USERS.EMAIL, USERS.USERPASS, USERTYPE.USERTYPENAME FROM USERS INNER JOIN USERTYPE ON USERS.USERTYPEID = USERTYPE.USERTYPEID" UpdateCommand="UPDATE [USERS] SET [USERNAME] = @USERNAME, [EMAIL] = @EMAIL, [USERPASS] = @USERPASS, [USERTYPEID] = @USERTYPEID WHERE [USERID] = @USERID">
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
        <%--<footer>
            <p>
                <asp:Button ID="_btnLogOut" runat="server" Text="Logout" CssClass="btn btn-info" OnClick="_btnLogOut_Click" />
            </p>
        </footer>--%>
    </div>
</asp:Content>
