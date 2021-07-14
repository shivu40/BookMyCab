<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddDriver.aspx.cs" Inherits="Book_My_Cab.AddDriver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
                <br />
                <br />
                <asp:Button ID="GoBack" CssClass="btn btn-default"  runat="server" Text="Go Back" OnClick="GoBack_Click" />
            </div>
            <div class="col-md-4">
                <h4>Driver Details</h4>
                <hr />
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="driverName" placeholder="Name" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="driverEmailId" placeholder="Email Address" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="driverAddress" placeholder=" Address" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:TextBox class="form-control" ID="driverMobileNo" placeholder="Mobile Number" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="driverLicenseNo" placeholder="License No." runat="server"></asp:TextBox>
                </div>
                <br />
                <h4>Cab Details</h4>
                <hr />
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="cabRegistrationNo" placeholder="Registration NO" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox class="form-control" ID="cabModelName" placeholder="Model Name" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:DropDownList ID="TypeId" class="form-control"  placeholder=" Type" runat="server" DataSourceID="CabTypeLinker" DataTextField="Name" DataValueField="Id"></asp:DropDownList> 
                    <asp:SqlDataSource ID="CabTypeLinker" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [Name], [Id] FROM [Available Cabs]"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnSubmit"  CssClass="btn btn-success  " runat="server" Text="Submit Details" Width="120px" OnClick="btnSubmit_Click" />
                </div>
            </div>
            <div class="col-md-6">
                <br /><br /><br />
                <asp:GridView ID="DriverDetails" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="DriverDetailsLinker">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="EmailId" HeaderText="EmailId" SortExpression="EmailId" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" SortExpression="MobileNo" />
                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                        <asp:BoundField DataField="LicenseNo" HeaderText="LicenseNo" SortExpression="LicenseNo" />
                        <asp:BoundField DataField="RegistrationNo" HeaderText="RegistrationNo" SortExpression="RegistrationNo" />
                        <asp:BoundField DataField="ModelName" HeaderText="ModelName" SortExpression="ModelName" />
                        <asp:BoundField DataField="CabType" HeaderText="CabType" SortExpression="CabType" />
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
                <asp:SqlDataSource ID="DriverDetailsLinker" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" DeleteCommand="DELETE FROM [Driver] WHERE [EmailId] = @EmailId" InsertCommand="INSERT INTO [Driver] ([EmailId], [Name], [MobileNo], [Address], [LicenseNo], [Status], [CabId]) VALUES (@EmailId, @Name, @MobileNo, @Address, @LicenseNo, @Status, @CabId)" SelectCommand="SELECT Driver.EmailId, Driver.Name, Driver.MobileNo, Driver.Address, Driver.LicenseNo, Cab.RegistrationNo, Cab.ModelName, [Available Cabs].Name AS CabType FROM Driver INNER JOIN Cab ON Driver.CabId = Cab.RegistrationNo INNER JOIN [Available Cabs] ON Cab.TypeId = [Available Cabs].Id" UpdateCommand="UPDATE [Driver] SET [Name] = @Name, [MobileNo] = @MobileNo, [Address] = @Address, [LicenseNo] = @LicenseNo, [Status] = @Status, [CabId] = @CabId WHERE [EmailId] = @EmailId">
                    <DeleteParameters>
                        <asp:Parameter Name="EmailId" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="EmailId" Type="String" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="MobileNo" Type="Int64" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="LicenseNo" Type="String" />
                        <asp:Parameter Name="Status" Type="Boolean" />
                        <asp:Parameter Name="CabId" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="MobileNo" Type="Int64" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="LicenseNo" Type="String" />
                        <asp:Parameter Name="Status" Type="Boolean" />
                        <asp:Parameter Name="CabId" Type="String" />
                        <asp:Parameter Name="EmailId" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
