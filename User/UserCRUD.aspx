<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserCRUD.aspx.cs" Inherits="User.UserCRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="_lstvwUserCRUD" runat="server" DataSourceID="_dtsrcUserCRUD" DataKeyNames="USERID" InsertItemPosition="LastItem" OnDataBound="_lstvwUserCRUD_DataBound" OnItemDeleted="_lstvwUserCRUD_ItemDeleted" OnItemInserted="_lstvwUserCRUD_ItemInserted" OnItemUpdated="_lstvwUserCRUD_ItemUpdated" OnItemDataBound="_lstvwUserCRUD_ItemDataBound">
        <%--<AlternatingItemTemplate>
            <span style="background-color: #FAFAD2; color: #284775;">USERID:
                <asp:Label Text='<%# Eval("USERID") %>' runat="server" ID="USERIDLabel" /><br />
                USERNAME:
                <asp:Label Text='<%# Eval("USERNAME") %>' runat="server" ID="USERNAMELabel" /><br />
                EMAIL:
                <asp:Label Text='<%# Eval("EMAIL") %>' runat="server" ID="EMAILLabel" /><br />
                USERPASS:
                <asp:Label Text='<%# Eval("USERPASS") %>' runat="server" ID="USERPASSLabel" /><br />
                USERTYPEID:
                <asp:Label Text='<%# Eval("USERTYPEID") %>' runat="server" ID="USERTYPEIDLabel" /><br />
                <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                <br />
                <br />
            </span>
        </AlternatingItemTemplate>--%>
        <EditItemTemplate>
            <div class="col-sm-4"></div>
            <div style="" class="col-sm-4">
                <div class="well">
                    <%--<label class="control-label">ID:</label>
                <asp:Label Text='<%# Eval("USERID") %>' runat="server" ID="USERIDLabel1" /><br />--%>
                    <label class="control-label">Username:</label>
                    <asp:TextBox Text='<%# Bind("USERNAME") %>' runat="server" ID="USERNAMETextBox" CssClass="form-control" /><br />
                    <label class="control-label">Email Address:</label>
                    <asp:TextBox Text='<%# Bind("EMAIL") %>' runat="server" ID="EMAILTextBox" CssClass="form-control" /><br />
                    <label class="control-label">Password: </label>
                    <asp:TextBox Text='<%# Bind("USERPASS") %>' runat="server" ID="USERPASSTextBox" CssClass="form-control" /><br />
                    <label class="control-label">User Type:</label>
                    <asp:DropDownList ID="_ddlstUserType" runat="server" DataSourceID="_dtsrcUserTypeDropDown" SelectedValue='<%# Bind("USERTYPEID") %>' DataTextField="USERTYPENAME" DataValueField="USERTYPEID" CssClass="form-control"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="_dtsrcUserTypeDropDown" ConnectionString='<%$ ConnectionStrings:_cnnctstrngUserDB %>' SelectCommand="SELECT [USERTYPEID], [USERTYPENAME] FROM [USERTYPE]"></asp:SqlDataSource>
                    <hr />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Save" CssClass="btn btn-primary" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" OnClientClick=" window.location = '/UserList.aspx';this.form.reset();return false;" />
                    <br />
                </div>
            </div>
            <div class="col-sm-4"></div>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <div class="col-sm-4"></div>
            <div style="" class="col-sm-4">
                <div class="well">
                    <label class="control-label">Username:</label>
                    <asp:TextBox Text='<%# Bind("USERNAME") %>' runat="server" ID="USERNAMETextBox" CssClass="form-control" /><br />
                    <label class="control-label">Email Address:</label>
                    <asp:TextBox Text='<%# Bind("EMAIL") %>' runat="server" ID="EMAILTextBox" CssClass="form-control" /><br />
                    <label class="control-label">Password: </label>
                    <asp:TextBox Text='<%# Bind("USERPASS") %>' runat="server" ID="USERPASSTextBox" CssClass="form-control" /><br />
                    <label class="control-label">User Type:</label>
                    <asp:DropDownList ID="_ddlstUserType" runat="server" SelectedValue='<%# Bind("USERTYPEID") %>' DataSourceID="_dtsrcUserTypeDropDown" DataTextField="USERTYPENAME" DataValueField="USERTYPEID" CssClass="form-control"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="_dtsrcUserTypeDropDown" ConnectionString='<%$ ConnectionStrings:_cnnctstrngUserDB %>' SelectCommand="SELECT [USERTYPEID], [USERTYPENAME] FROM [USERTYPE]"></asp:SqlDataSource>
                    <hr />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Save" CssClass="btn btn-primary" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger" OnClientClick=" window.location = '/UserList.aspx';this.form.reset();return false;" />
                    <br />
                </div>
            </div>
            <div class="col-sm-4"></div>
        </InsertItemTemplate>
        <ItemTemplate>
            <div class="col-sm-4"></div>
            <div style="" class="col-sm-4">
                <div class="well">
                    <%--USERID:
                <asp:Label Text='<%# Eval("USERID") %>' runat="server" ID="USERIDLabel" /><br />" --%>
                    <label class="control-label">Username:</label>
                    <asp:Label Text='<%# Eval("USERNAME") %>' runat="server" ID="USERNAMELabel" /><br />
                    <label class="control-label">Email Address:</label>
                    <asp:Label Text='<%# Eval("EMAIL") %>' runat="server" ID="EMAILLabel" /><br />
                    <label class="control-label">Password: </label>
                    <%--<asp:Label Text='<%# Eval("USERPASS") %>' runat="server" ID="USERPASSLabel" /><br />--%>
                    <asp:Label Text="**************" runat="server" ID="USERPASSLabel" /><br />
                    <label class="control-label">User Type:</label>
                    <asp:Label Text='<%# Eval("USERTYPENAME") %>' runat="server" ID="USERTYPEIDLabel" /><hr />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-primary" Visible="true" PostBackUrl='<%#Eval("USERID","UserCRUD.aspx?id={0}")%>' />
                    <span onclick="return confirm('Are you sure to delete?')">
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                    </span>
                    <input type="button" value="Back" onclick="window.location = 'UserList.aspx';" class="btn btn-warning" />
                </div>
            </div>
            <div class="col-sm-4"></div>
        </ItemTemplate>
        <LayoutTemplate>
            <div runat="server" id="itemPlaceholderContainer" style="font-family: Verdana, Arial, Helvetica, sans-serif;"><span runat="server" id="itemPlaceholder" /></div>
            <div style="text-align: center; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif; color: #333333;">
                <asp:DataPager runat="server" ID="DataPager1" PageSize="1" Visible="false">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True"></asp:NextPreviousPagerField>
                    </Fields>
                </asp:DataPager>

            </div>
        </LayoutTemplate>
        <%--<SelectedItemTemplate>
            <span style="background-color: #FFCC66; font-weight: bold; color: #000080;">USERID:
                <asp:Label Text='<%# Eval("USERID") %>' runat="server" ID="USERIDLabel" /><br />
                USERNAME:
                <asp:Label Text='<%# Eval("USERNAME") %>' runat="server" ID="USERNAMELabel" /><br />
                EMAIL:
                <asp:Label Text='<%# Eval("EMAIL") %>' runat="server" ID="EMAILLabel" /><br />
                USERPASS:
                <asp:Label Text='<%# Eval("USERPASS") %>' runat="server" ID="USERPASSLabel" /><br />
                USERTYPEID:
                <asp:Label Text='<%# Eval("USERTYPEID") %>' runat="server" ID="USERTYPEIDLabel" /><br />
                <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                <br />
                <br />
            </span>
        </SelectedItemTemplate>--%>
    </asp:ListView>
    <asp:SqlDataSource runat="server" ID="_dtsrcUserCRUD" ConnectionString='<%$ ConnectionStrings:_cnnctstrngUserDB %>' DeleteCommand="DELETE FROM [USERS] WHERE [USERID] = @USERID" InsertCommand="INSERT INTO [USERS] ([USERNAME], [EMAIL], [USERPASS], [USERTYPEID]) VALUES (@USERNAME, @EMAIL, @USERPASS, @USERTYPEID)" SelectCommand="SELECT USERS.USERID, USERS.USERNAME, USERS.EMAIL, USERS.USERPASS, USERS.USERTYPEID, USERTYPE.USERTYPENAME FROM USERS INNER JOIN USERTYPE ON USERS.USERTYPEID = USERTYPE.USERTYPEID WHERE (USERS.USERID = @USERID)" UpdateCommand="UPDATE [USERS] SET [USERNAME] = @USERNAME, [EMAIL] = @EMAIL, [USERPASS] = @USERPASS, [USERTYPEID] = @USERTYPEID WHERE [USERID] = @USERID">
        <DeleteParameters>
            <asp:Parameter Name="USERID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="USERNAME" Type="String"></asp:Parameter>
            <asp:Parameter Name="EMAIL" Type="String"></asp:Parameter>
            <asp:Parameter Name="USERPASS" Type="String"></asp:Parameter>
            <asp:Parameter Name="USERTYPEID" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="USERID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="USERNAME" Type="String"></asp:Parameter>
            <asp:Parameter Name="EMAIL" Type="String"></asp:Parameter>
            <asp:Parameter Name="USERPASS" Type="String"></asp:Parameter>
            <asp:Parameter Name="USERTYPEID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="USERID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <%--<div class="text-center">
        <hr />
        <footer>
            <p>
                <asp:Button ID="_btnLogOut" runat="server" Text="Logout" CssClass="btn btn-primary" OnClick="_btnLogOut_Click" />
            </p>
        </footer>
    </div>--%>
</asp:Content>
