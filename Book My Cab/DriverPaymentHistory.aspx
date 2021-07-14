<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DriverPaymentHistory.aspx.cs" Inherits="Book_My_Cab.DriverPaymentHistory" %>

<!DOCTYPE html>
 <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div>
      <div class="row">
    <div class="col-md-2 col-md-offset-10 " >
        <br />
        
          <a class="btn btn-default " href="DriverPage.aspx">Go Back</a>
    </div>
    </div>
        <div class="row">
            <div class="col-md-6 col-md-offset-4">
                
                 &nbsp;
                 <h3 >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Payment Details</h3>
                <br />
                
                <asp:GridView ID="PaymentHistoryGridView" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="Linker">
                    <Columns>
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                        <asp:BoundField DataField="Fare" HeaderText="Fare" SortExpression="Fare" />
                        <asp:BoundField DataField="DriverPayableAmount" HeaderText="DriverPayableAmount" SortExpression="DriverPayableAmount" />
                        <asp:CheckBoxField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:BoundField DataField="BookingId" HeaderText="BookingId" SortExpression="BookingId" />
                        <asp:BoundField DataField="Distance" HeaderText="Distance" SortExpression="Distance" />
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
                <asp:SqlDataSource ID="Linker" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [Date], [Fare], [DriverPayableAmount], [Status], [BookingId], [Distance] FROM [Payments] WHERE ([DriverId] = @DriverId)">
                    <SelectParameters>
                        <asp:SessionParameter Name="DriverId" SessionField="userEmailId" Type="String" />
                    </SelectParameters>
                 </asp:SqlDataSource>
            </div>
        </div>
    </div>
    </div>
    </form>
</body>
</html>
