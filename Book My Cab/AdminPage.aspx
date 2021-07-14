<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Book_My_Cab.AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <style>
    
    </style>

    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    
        <div>
        <br />
    <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Book My Cab</a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="AdminPage.aspx">Home</a></li>
      <li><a href="PaymentsPage.aspx">Payments</a></li>
      <li><a href="AddDriver.aspx">Add/Update Drivers</a></li>
        <li><a href="CustomerDetails.aspx">View Customers</a></li>
        <li><a href="PaymentDetails.aspx">View Payment Details</a></li>
    </ul>
       
    <ul class="nav navbar-nav navbar-right">
     <%-- <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>--%>
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Welcome Admin</a></li>
        <li><a href="LoginPage.aspx"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    </ul>
     
  </div>
</nav>
    </div>
        <div class="row">
        <div class="col-md-8 col-md-offset-3">
             <div id="data">
             <br /><br /><br /><br /><br /><br />
             
                 
                     <br />
             <br />
             
             <br />
                 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                 <asp:Timer ID="Updater" runat="server" OnTick="Updater_Tick" Interval="2000"></asp:Timer>
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                     <ContentTemplate>
                          <table style="width: 100%; height: 189px;" >
            
          
            <tr>
                <td class="auto-style1">No. of Drivers Online</td>
                <td>
                    <asp:Label ID="DriverOnline" CssClass="form-control" runat="server" Width="300px" ></asp:Label>
                </td>
            </tr>
            
            <tr>
                <td class="auto-style1">Number of Customers Online</td>
                <td>
                    <asp:Label ID="CustomersOnline" CssClass="form-control" runat="server" Width="300px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Total Users Online</td>
                <td>
                    <asp:Label ID="TotalUsersOnline" runat="server" CssClass="form-control" Width="300px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Number of Busy Drivers</td>
                <td>
                    <asp:Label ID="BusyDrivers" runat="server" Width="300px" CssClass="form-control"></asp:Label>
                </td>
            </tr>
           <tr>
                <td class="auto-style1">Number of Free Drivers</td>
                <td>
                    <asp:Label ID="FreeDrivers" runat="server" Width="300px" CssClass="form-control"></asp:Label>
                </td>
            </tr>
             
        </table>
                     </ContentTemplate>
                     <Triggers>
                         <asp:AsyncPostBackTrigger ControlID="Updater" EventName="Tick" />
                     </Triggers>
                 </asp:UpdatePanel>
       
    
             <br />
             <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
    
    </div>
        </div>
        <div class="col-md-1 ">
             <br /><br /><br /><br />    <br /><br />
        </div>
    </div>    
        
    </form>
</body>
</html>
