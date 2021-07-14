<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrentBooking.aspx.cs" Inherits="Book_My_Cab.CurrentBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 445px;
        }
        #DriverData{
            margin-left:400px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <center>
       <h4>Note:- If no bookings are shown wait for sometime until the driver accept your request.</h4>
           <h1>Your Current Booking</h1>
            
        </center>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <asp:Timer ID="BookingSensor" runat="server" OnTick="BookingSensor_Tick" Interval="2000"></asp:Timer> 
        <asp:UpdatePanel ID="DriverData" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
               
                <center>
             <p style="margin-right:400px;">
                <asp:Label ID="BookingStatus" runat="server" Font-Size="Medium"></asp:Label>
            </p>
        <table style="width: 100%; height: 189px;">
           <tr>
                <td class="auto-style1">Booking Request Id</td>
                <td>
                    <asp:Label ID="BookingRequestId" runat="server" Width="300px"></asp:Label>
                </td>
            </tr>
             <tr>
                <td class="auto-style1">Driver Name</td>
                <td>
                    <asp:Label ID="DriverName" runat="server" Width="300px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Contact No.</td>
                <td>
                    <asp:Label ID="ContactNo" runat="server" Width="300px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Vehicle No.</td>
                <td>
                    <asp:Label ID="VehicleNo" runat="server" Width="300px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Vehicle Name</td>
                <td>
                    <asp:Label ID="VehicleName" runat="server" Width="300px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Total Fare</td>
                <td>
                    <asp:Label ID="TotalFare" runat="server" Width="300px"></asp:Label>
                </td>
            </tr>
        </table>
    </center>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BookingSensor" EventName="Tick" />
            </Triggers>
        </asp:UpdatePanel>
         
    </div>
        <center>
            <br />
            <br />
            <br />
             <asp:Button ID="HomePage" runat="server" Text="Go to Homepage" OnClick="HomePage_Click"></asp:Button>
        </center>

    </form>
</body>
</html>
