<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bill.aspx.cs" Inherits="Book_My_Cab.bill" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        table{
            margin-left:500px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div>
        <br />
        <br />
        <center>
       
           <h1>Bill</h1>
            
        </center>
        <br />
         <br />
         <br />
                
                <center>
        <table style="width: 100%; height: 189px;">
            <tr>
                <td class="auto-style1">Booking Request Id</td>
                <td>
                    <asp:Label ID="BookingRequest" runat="server" Width="300px" Text="shivu"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Customer Name</td>
                <td>
                    <asp:Label ID="CustomerName" runat="server" Width="300px" Text="shivu"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Pickup Location</td>
                <td>
                    <asp:Label ID="PickupLocation" runat="server" Width="300px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Destination Location</td>
                <td>
                    <asp:Label ID="DestinationLocation" runat="server" Width="300px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Total Fare</td>
                <td>
                    <asp:Label ID="TotalFare" runat="server" Width="300px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Distance</td>
                <td>
                    <asp:Label ID="Distance" runat="server" Width="300px"></asp:Label>
                </td>
            </tr>
        </table>
    </center>
            
         
    </div>
        <center>
            <br />
            <br />
            <br />
             <asp:Button ID="Done" CssClass="btn btn-success" runat="server" Text="Done" OnClick="Done_Click"></asp:Button>
        </center>
    </div>
    </form>
</body>
</html>
