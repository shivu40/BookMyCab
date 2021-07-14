<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DriverPage.aspx.cs" Inherits="Book_My_Cab.WebForm4" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <script>
        var customerData;
        var custEmailId;
        //var status=0;

        //setInterval(function () {
            
        //    if (status == 0)
        //        cabRequest();
        //}, 500);

        setInterval(function () {
            trackLocation();
        },4000)

        function trackLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(getCords);
            } else {
                alert( "Geolocation is not supported by this browser.");
            }
        }

        function getCords(position) {
            setTimeout(function(){
            var sendXhttp;
            sendXhttp = new XMLHttpRequest();
            
            sendXhttp.open("GET", "driveroperations.aspx?type=updateLocation&lat=" + position.coords.latitude + "&long=" + position.coords.longitude, false)
            sendXhttp.send(null);
            },2000);
   
        }

        function hideModal()
        {
            $('#bookingModal').modal('hide');
        }

        //function rideComplete() {
        //    var xhttp;
        //    $('#bookingModal').modal('hide');
        //    xhttp = new XMLHttpRequest();
        //    xhttp.onreadystatechange = function () {
        //        if (xhttp.readyState == 4 && xhttp.status == 200) {
        //            setTimeout(function () {
        //                status=0;          
        //            }, 300);
        //        }
        //    };
        //    xhttp.open("GET", "driverOperations.aspx?type=freeDriver&customerId=" +custEmailId, false);
        //    xhttp.send(null);
        //}
        //function showCabRequests()
        //{
        //    if(status==1)
        //    {
        //        $('#bookingModal').modal('show');
        //    }
        //    else
        //    {
        //        alert("No requests are available this time");
        //    }
        //}
        function showModal()
        {
            $('#bookingModal').modal('show');
        }
            //function cabRequest() {
            
            //    var xhttp;
            
            //    xhttp = new XMLHttpRequest();
            //    xhttp.onreadystatechange = function () {
            //        if (xhttp.readyState == 4 && xhttp.status == 200) {
            //            setTimeout(function () {
            //                var data = xhttp.responseText;
                            
            //                if (data[0] != "{") {
                                
                                
            //                }
            //                else {
            //                    customerData = "";
            //                    status=1;
            //                    for (i = 0; i < data.length; i++) {

            //                        customerData += data[i];
            //                        if (data[i] == "}")
            //                            break;
            //                    }
            //                    customerData = JSON.parse(customerData);
            //                    custEmailId= customerData.emailId;
            //                    document.getElementById('pickupLocation').innerHTML = customerData.pickupLocation;
            //                    document.getElementById('destinationLocation').innerHTML = customerData.destinationLocation;
            //                    document.getElementById('customerName').innerHTML = customerData.name;
            //                    document.getElementById('contactNumber').innerHTML = customerData.mobileNo;
            //                    document.getElementById('totalFare').innerHTML = customerData.totalFare;
            //                    $("#bookingModal").modal('show');
            //                }
            //            }, 300);
            //        }
            //    };
            //    xhttp.open("GET", "driverOperations.aspx?type=custInfo", false);
            //    xhttp.send(null);
            //}
    </script>
    <br />
    <style>
        #showBooking {
            font-family: 'Times New Roman', Times, serif;
            font-size: large;
        }
         #map {
            height: 500px;
        }
    </style>
    <div class="container-fluid">
       
          <div class="modal fade" tabindex="-1" id="bookingModal"
        data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    &times;</button>
                <h4 class="modal-title">You got a New Booking!</h4>
            </div>
            <div class="modal-body">
                <table style="width: 100%;">
                    <tr>
                        <td><label for="inputEmail Id">Pickup Location:</label></td>
                        <td><span id="pickupLocation" runat="server"></span></td>                        
                    </tr>
                    <tr>
                        <td><label for="inputPassword">Destination Location:</label></td>
                        <td><span  id="destinationLocation" runat="server"></span></td>
                    </tr>
                    <tr>
                        <td><label for="inputName">Customer Name:</label></td>
                        <td><span  id="customerName" runat="server"></span></td>                       
                    </tr>
                    <tr>
                        <td><label for="inputMobileNo">Contact Number:</label></td>
                        <td><span  id="contactNumber" runat="server"></span></td>                       
                    </tr>
                    <tr>
                        <td><label for="inputMobileNo">Total Fare:</label></td>
                        <td><span  id="totalFare" runat="server"></span></td>                       
                    </tr>
                </table>                            
            </div>
            <div class="modal-footer">
               <%-- <input id="rideButton" class="btn btn-primary" type="button" value="Ride Complete" onclick="rideComplete()"  />
                <input id="closebutton" class="btn btn-primary" type="button" value="Close" data-dismiss="modal"/>--%>
                <asp:Button ID="acceptButton" class="btn btn-primary" runat="server" Text="Accept" OnClick="acceptButton_Click" />
                <asp:Button ID="rejectButton" class="btn btn-primary" runat="server" Text="Reject"  OnClick="rejectButton_Click" />                                         
            </div>
        </div>
    </div>
</div>




        <div class="row">
            <div class=" col-md-8 col-md-offset-2 ">
                <%--<input class="btn btn-primary form-control" id="showBooking"  onclick="showCabRequests()" type="button" value="Show Current Booking" />--%>
                <asp:Button ID="showBooking" class="btn btn-primary form-control" runat="server" Text="Show Current Booking" OnClick="showBooking_Click" />    
            </div>
            <br /><br /><br /><br />
        </div>
        <div class="row">
            <div class="col-md-2">
               
                
                        <span>Rs.</span> <asp:Label ID="Earning" runat="server" Text=""></asp:Label> 

                       
                   
 
            </div>
            <div id="map" class=" col-md-8  ">
                
            </div>
            <div class="col-md-2">
                <asp:Button class="btn btn-success form-control" ID="FinishRide" runat="server" Text="Finish Ride"  Visible="False" OnClick="FinishRide_Click" />
            </div>
       </div>
    </div>
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   <asp:Timer ID="SensingRequestTimer" runat="server" Interval="5000" OnTick="SensingRequestTimer_Tick" ></asp:Timer>
    
    
    
    <script>
        
        var map;
        var marker;
        var pos;
        var dewas = {
            lat: 22.962267, lng: 76.050797
        }
        var calcRoute;
        
        var addNewMarker;
  
        var GetFare;
        var BookCab;
        var image = 'Images/icons8-street-view-26.png';
        function initMap() {
            var mapOptions = {
                zoom: 18,
                center: { lat: 22.962267, lng: 76.050797 },
                mapTypeId: 'roadmap'
            };

            map = new google.maps.Map(
            document.getElementById('map'), mapOptions);
            marker = new google.maps.Marker(
                    {
                        position: dewas,
                        icon: image,
                        map: map,
                        title: 'you are here',
                        draggable: true
                    });
            var circle = new google.maps.Circle({
                center: dewas,
                radius: 500
            });
            var options = {
                bounds: circle.getBounds()

            };
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition, showError);
            } else {
                alert("Geolocation is not supported by this browser.");
            }
            
           
            function showPosition(position) {

                pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };

                if (marker == null) {
                    marker = new google.maps.Marker(
                         {
                             position: pos,
                             icon: image,
                             map: map,
                             title: 'you are here',
                             draggable: true
                         });
                    map.setCenter(pos);
                }
                else {
                    marker.setPosition(pos);
                    map.setCenter(pos);
                }
            }
            function showError(error) {
                switch (error.code) {
                    case error.PERMISSION_DENIED:
                        alert(" Geolocation is blocked.");
                        break;
                    case error.POSITION_UNAVAILABLE:
                        alert("Location information is unavailable.");
                        break;
                    case error.TIMEOUT:
                        alert("The request to get user location timed out.");
                        break;
                    case error.UNKNOWN_ERROR:
                        alert("An unknown error occurred.");
                        break;
                }
            }
           
         addNewMarker = function (marker, pos, icon, map, title, draggable) {
                if (marker == null) {
                    marker = new google.maps.Marker(
                         {
                             position: pos,
                             icon: image,
                             map: map,
                             title: 'you are here',
                             draggable: true
                         });

                }
                else {
                    marker.setPosition(pos);

                }
            }     
        }
        
    </script>
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCpmTq3yv16-u33jSY7OizescUBVRWCfyE&callback=initMap&libraries=places"
        async defer></script>
</asp:Content>
