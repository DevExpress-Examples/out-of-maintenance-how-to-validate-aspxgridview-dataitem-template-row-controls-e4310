<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to validate controls in ASPxGridView row on a custom command button click</title>
    <script type="text/javascript">
        function gv_OnCustomButtonClick(s, e) {
            ASPxClientEdit.ValidateGroup('Group' + e.visibleIndex);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/Northwind.mdb"
            SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [HomePhone], [Address] FROM [Employees]">
        </asp:AccessDataSource>
        <dx:ASPxGridView ID="gv" runat="server" AutoGenerateColumns="False" DataSourceID="ads"
            KeyFieldName="EmployeeID">
            <ClientSideEvents CustomButtonClick="gv_OnCustomButtonClick" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="upd" Text="Update" />
                    </CustomButtons>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Address" VisibleIndex="3">
                    <DataItemTemplate>
                        <dx:ASPxTextBox ID="addressTb" runat="server" ClientInstanceName="addressTb" Text='<%#Bind("Address")%>'
                            Width="200" UseSubmitBehavior="false" OnInit="editor_Init">
                            <ValidationSettings SetFocusOnError="True" CausesValidation="false" ValidateOnLeave="false">
                                <RequiredField IsRequired="True" ErrorText="Address is required" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="HomePhone" VisibleIndex="4">
                    <DataItemTemplate>
                        <dx:ASPxTextBox ID="homePhoneTb" runat="server" ClientInstanceName="homePhoneTb"
                            Text='<%#Bind("HomePhone")%>' Width="125" UseSubmitBehavior="false" OnInit="editor_Init">
                            <ValidationSettings SetFocusOnError="True" CausesValidation="false" ValidateOnLeave="false">
                                <RegularExpression ValidationExpression="\(\d{2,3}\)\s\d{3}-\d{4}" ErrorText="Invalid value" />
                                <RequiredField IsRequired="true" ErrorText="HomePhone is required" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </form>
</body>
</html>
