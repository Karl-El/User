<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TypeCRUD.aspx.cs" Inherits="User.TypeCRUD" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="_lstvwTypeCRUD" runat="server" DataSourceID="_dtsrcTypeCRUD" DataKeyNames="USERTYPEID" InsertItemPosition="LastItem" OnDataBound="_lstvwTypeCRUD_DataBound" OnItemInserting="_lstvwTypeCRUD_ItemInserting" OnItemUpdating="_lstvwTypeCRUD_ItemUpdating" OnItemInserted="_lstvwTypeCRUD_ItemInserted" OnItemUpdated="_lstvwTypeCRUD_ItemUpdated" OnItemDataBound="_lstvwTypeCRUD_ItemDataBound" OnItemDeleted="_lstvwTypeCRUD_ItemDeleted">
        <%--<AlternatingItemTemplate>
            <span style="">USERTYPEID:
                <asp:Label Text='<%# Eval("USERTYPEID") %>' runat="server" ID="USERTYPEIDLabel" /><br />
                USERTYPENAME:
                <asp:Label Text='<%# Eval("USERTYPENAME") %>' runat="server" ID="USERTYPENAMELabel" /><br />
                <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                <br />
                <br />
            </span>
        </AlternatingItemTemplate>--%>
        <EditItemTemplate>
            <div class="col-sm-4 "></div>
            <div style="" class="col-sm-4 well">
                <asp:Label Text='<%# Eval("USERTYPEID") %>' runat="server" ID="USERTYPEIDLabel" Visible="false" /><br />
                <label class="control-label">User Type Name:</label>
                <asp:TextBox Text='<%# Bind("USERTYPENAME") %>' runat="server" ID="USERTYPENAMETextBox" CssClass="form-control" />
                <asp:CheckBoxList ID="_chkbxlstPermit" runat="server" DataSourceID="_dtsrcPermit" DataTextField="PERMITNAME" DataValueField="PERMITID" CssClass="checkbox checkbox-info"></asp:CheckBoxList>
                <asp:SqlDataSource runat="server" ID="_dtsrcPermit" ConnectionString='<%$ ConnectionStrings:_cnnctstrngUserDB %>' SelectCommand="SELECT [PERMITID], [PERMITNAME] FROM [PERMIT] WHERE PERMITID!=1"></asp:SqlDataSource>
                <hr />
                <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" CssClass="btn btn-primary" />
                <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" CssClass="btn btn-danger" OnClientClick="window.location = '/TypeList.aspx'; this.form.reset();return false;" /><br />
                <br />
            </div>
            <div class="col-sm-4"></div>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <div class="col-sm-4"></div>
            <div style="" class="col-sm-4 well">
                <label class="control-label">User Type Name:</label>
                <asp:TextBox Text='<%# Bind("USERTYPENAME") %>' runat="server" ID="USERTYPENAMETextBox" CssClass="form-control" />
                <asp:CheckBoxList ID="_chkbxlstPermit" runat="server" DataSourceID="_dtsrcPermit" DataTextField="PERMITNAME" DataValueField="PERMITID" CssClass="checkbox checkbox-info"></asp:CheckBoxList>
                <asp:SqlDataSource runat="server" ID="_dtsrcPermit" ConnectionString='<%$ ConnectionStrings:_cnnctstrngUserDB %>' SelectCommand="SELECT [PERMITID], [PERMITNAME] FROM [PERMIT] WHERE PERMITID!=1"></asp:SqlDataSource>
                <hr />
                <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" CssClass="btn btn-primary"/>
                <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" CssClass="btn btn-danger" OnClientClick="window.location = '/TypeList.aspx'; this.form.reset();return false;" /><br />
                <br />
            </div>
            <div class="col-sm-4"></div>
        </InsertItemTemplate>
        <ItemTemplate>
            <div class="col-sm-4"></div>
            <div style="" class="col-sm-4 well">
                <asp:Label Text='<%# Eval("USERTYPEID") %>' runat="server" ID="USERTYPEIDLabel" Visible="false" /><br />
                <label class="control-label">User Type Name:</label>
                <asp:Label Text='<%# Eval("USERTYPENAME") %>' runat="server" ID="USERTYPENAMELabel" />
                <asp:BulletedList ID="_blltlstUserPermit" runat="server" DataSourceID="_dtsrcUserPermit" DataTextField="PERMITNAME" DataValueField="PERMITID"></asp:BulletedList>
                <asp:SqlDataSource runat="server" ID="_dtsrcUserPermit" ConnectionString='<%$ ConnectionStrings:_cnnctstrngUserDB %>' SelectCommand="SELECT PERMIT.PERMITNAME, USERPERMIT.USERTYPEID, USERPERMIT.PERMITID FROM PERMIT INNER JOIN USERPERMIT ON PERMIT.PERMITID = USERPERMIT.PERMITID WHERE (USERPERMIT.USERTYPEID = @UserTypeID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="USERTYPEIDLabel" PropertyName="Text" Name="UserTypeID"></asp:ControlParameter>
                    </SelectParameters>
                </asp:SqlDataSource>
                <hr />
                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CssClass="btn btn-primary " />
                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                <input type="button" value="Back" onclick="window.location = 'TypeList.aspx';" class="btn btn-warning" />
                <br />
                <br />
            </div>
            <div class="col-sm-4"></div>
        </ItemTemplate>
        <LayoutTemplate>
            <div runat="server" id="itemPlaceholderContainer" style=""><span runat="server" id="itemPlaceholder" /></div>
            <div style="">
                <asp:DataPager runat="server" ID="DataPager1" PageSize="1" Visible="false">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                        <asp:NumericPagerField></asp:NumericPagerField>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                    </Fields>
                </asp:DataPager>

            </div>
        </LayoutTemplate>
        <%--<SelectedItemTemplate>
            <span style="">USERTYPEID:
                <asp:Label Text='<%# Eval("USERTYPEID") %>' runat="server" ID="USERTYPEIDLabel" /><br />
                USERTYPENAME:
                <asp:Label Text='<%# Eval("USERTYPENAME") %>' runat="server" ID="USERTYPENAMELabel" /><br />
                <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                <br />
                <br />
            </span>
        </SelectedItemTemplate>--%>
    </asp:ListView>
    <asp:SqlDataSource runat="server" ID="_dtsrcTypeCRUD" ConnectionString='<%$ ConnectionStrings:_cnnctstrngUserDB %>' SelectCommand="SELECT [USERTYPEID], [USERTYPENAME] FROM [USERTYPE] WHERE ([USERTYPEID] = @USERTYPEID)" DeleteCommand=" DELETE FROM USERPERMIT WHERE [USERTYPEID] = @USERTYPEID; DELETE FROM [USERTYPE] WHERE [USERTYPEID] = @USERTYPEID" InsertCommand="INSERT INTO [USERTYPE] ([USERTYPENAME]) VALUES (@USERTYPENAME)" UpdateCommand="UPDATE [USERTYPE] SET [USERTYPENAME] = @USERTYPENAME WHERE [USERTYPEID] = @USERTYPEID">
        <DeleteParameters>
            <asp:Parameter Name="USERTYPEID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="USERTYPENAME" Type="String"></asp:Parameter>
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="id" Name="USERTYPEID" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="USERTYPENAME" Type="String"></asp:Parameter>
            <asp:Parameter Name="USERTYPEID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
