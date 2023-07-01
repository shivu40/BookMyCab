<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookCabs.aspx.cs" Inherits="Book_My_Cab.BookCabs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="modal fade" tabindex="-1" id="bookingModal"
        data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    &times;</button>
                <h4 class="modal-title">You Cab is booked!</h4>
            </div>
            <div class="modal-body">
                <table style="width: 100%;">
                    <tr>
                        <td><label for="driverName">Driver Name:</label></td>
                        <td><span style="  font-family:'Times New Roman', Times, serif" id="driverName" runat="server"></span></td>
                        
                    </tr>
                    <tr>
                        <td> <label for="contactNo">Contact No:</label></td>
                        <td> <span style=" font-family:'Times New Roman', Times, serif" id="contactNo"></span></td>                        
                    </tr>
                    <tr>
                        <td><label for="inputName">Vehicle Name:</label></td>
                        <td> <span style=" font-family:'Times New Roman', Times, serif" id="vehicleName"></span>  </td>                        
                    </tr>
                    <tr>
                        <td> <label for="inputMobileNo">Vehicle No.:</label></td>
                        <td> <span style=" font-family:'Times New Roman', Times, serif" id="vehicleNo"></span> </td>                        
                    </tr>
                    <tr>
                        <td> <label for="inputMobileNo">Total Fare:</label></td>
                        <td> <span style=" font-family:'Times New Roman', Times, serif" id="totalFare"></span></td>                        
                    </tr>
                </table>               
            </div>
            <div class="modal-footer">
                
                <input id="closebutton" class="btn btn-primary" type="button" value="Close" data-dismiss="modal"/>
                                                                    
            </div>
        </div>
    </div>
</div>
    
    
    
    <script>
        var driverData;
        var estimatedFare;
        var driverDistances = [];
        var driverLocations = [];
        var driverDistanceCalculator;
        var estimatedDistance; 
        function bookCab() {
            var xhttp;
            var id = flag;
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState == 4 && xhttp.status == 200) {
                   
            }
        };
            xhttp.open("GET", "ajaxOperations.aspx?id=" + id + "&type=bookCab" +"&pickupLocation="+document.getElementById('<%=pickupLocation.ClientID %>').value+"&destinationLocation="+document.getElementById('<%=destinationLocation.ClientID %>').value+"&estimatedDistance="+estimatedDistance+"&estimatedFare="+estimatedFare, false);
        xhttp.send(null);
        }
      
        
    </script>
    <style>
        h4 {
            font-family: 'Times New Roman', Times, serif;
        }

        .cabSelectionBox {
            border: ridge 2px #f3b0cd;
            border-radius: 25px;
            height: 135px;
        }

        .imagelist {
            width: 11%;
            height: 11%;
            margin: 24px;
            float: left;
        }

        .imagelist-d {
            width: 25%;
            height: 11%;
            margin: 22px;
            float: left;
        }

        .img-icons {
            height: 70px;
            width: 70px;
            border: 2px solid;
            border-radius: 100px;
        }



        .imageButton {
            width: 100%;
            height: 100%;
            background-color: #EAEAEA;
        }

        .estimation {
            height: 40px;
            width: 40px;
            /*border: 2px solid #0094ff;
            border-radius: 100px;*/
        }

        .estimation-text {
            font-family: 'Times New Roman', Times, serifl;
        }

        .imagelist p {
            text-align: center;
            white-space: nowrap;
        }

        #RideEstimation {
        }

        html, body {
            height: 100%;
        }

        #map {
            height: 500px;
        }

        /*#estimation-display {
            display: none;
        }*/
    </style>
    <br />
     
    
    
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 col-md-offset-1 col-xs-12 col-sm-9">
                <h4>Your Pickup Location</h4>
                <asp:TextBox ID="pickupLocation" class="form-control" type="text" placeholder="Enter Pickup Location" runat="server"></asp:TextBox>

                <h4>Your Destination Location</h4>
                <asp:TextBox class="form-control" ID="destinationLocation" placeholder="Enter Destination Location" runat="server"></asp:TextBox>
                <h4>Choose Cab Type</h4>
                <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                         <div class=" cabSelectionBox">

                    <div class=" imagelist">
                        <a href="#">
                            <div class="img-icons">
                                <%--<img id="micro" class="img-circle imageButton" src="Images/ola-micro-active.svg" alt="Lights"  />--%>
                                <asp:ImageButton ID="micro" runat="server" class="img-circle imageButton" src="Images/ola-micro-active.svg" alt="Lights" OnClick="micro_Click" />
                            </div>
                        </a>
                        <p class="desc">&nbsp;&nbsp;&nbsp; Micro</p>



                    </div>
                    <div class=" imagelist">
                        <a href="#">
                            <div class="img-icons">
                                <%--<img id="primeSedan" class="img-circle imageButton " src="Images/ola-prime-sedan-active.svg" alt="Lights" />--%>

                                <asp:ImageButton ID="primeSedan" runat="server" class="img-circle imageButton " src="Images/ola-prime-sedan-active.svg" alt="Lights" OnClick="primeSedan_Click" />
                            </div>
                        </a>

                        <center><p class="desc">Prime Sedan</p></center>

                    </div>
                    <div class=" imagelist">
                        <a href="#">
                            <div class="img-icons">
                                <%--<img id="primePlay" class="img-circle imageButton" src="Images/ola-prime-play-active.svg" alt="Lights" />--%>
                                <asp:ImageButton ID="primePlay" runat="server" class="img-circle imageButton" src="Images/ola-prime-play-active.svg" alt="Lights" OnClick="primePlay_Click" />

                            </div>
                        </a>
                        <center><p class="desc">Prime Play </p></center>

                    </div>
                    <div class="imagelist">
                        <a href="#">
                            <div class="img-icons">
                                <%--<img id="primeSuv" class="img-circle imageButton" src="Images/ola-prime-suv-active.svg" alt="Lights" />--%>
                                <asp:ImageButton ID="primeSuv" runat="server" class="img-circle imageButton" src="Images/ola-prime-suv-active.svg" alt="Lights" OnClick="primeSuv_Click" />

                            </div>
                        </a>
                        <center><p class="desc">Prime Suv</p></center>

                    </div>


                </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
                <br />
               
               
                             
                <asp:UpdatePanel ID="upEstimation" runat="server" >
                    <ContentTemplate>
                        <asp:Button ID="RideEstimation" runat="server" class="btn btn-primary form-control" Text="Get Estimate of Your Ride" OnClick="RideEstimation_Click" OnClientClick="getestimation()"  />

                                                
                    <br />
                <br />
                     <div id="estimation-display">
                    <img class=" img-circle estimation" src="Images/fare.png" />&nbsp;&nbsp;<%--<span id="estimatedFare" class="estimation-text"> </span>--%>

                         <asp:TextBox ID="estimatedFare" runat="server" Enabled="False"></asp:TextBox>
                         <br />
                         <img class=" img-circle  estimation" src="Images/distance4.png" />&nbsp;&nbsp;<%--<span id="estimatedDistance" class="estimation-text" ></span>--%>
                    <asp:TextBox ID="estimatedDistance" runat="server" Enabled="False" AutoPostBack="False"></asp:TextBox>
                    <br />
                    <img class=" img-circle estimation" src="Images/duration.png" />&nbsp;&nbsp;<%--<span id="estimatedDuration" class="estimation-text" > </span>--%>
                    <asp:TextBox ID="estimatedDuration" runat="server" Enabled="False"></asp:TextBox>
                    <br />
                                        
                    <br />
                    
                         </div> 
                         
                    </ContentTemplate>
                    
               </asp:UpdatePanel>
                    
                        
                 <asp:Button ID="BookCab" class="form-control btn btn-success" runat="server" Text="Ride Now" OnClick="BookCab_Click" />
                 
                    

            </div>

            <div id="map" class="col-md-5 col-xs-offset-1 col-xs-10 col-sm-9 col-sm-offset-1 ">
            </div>
        </div>
    </div>

    


  
   


    <script>
        var map;
        var marker;
        var pos;
        var source;
        var destination;
        var dewas = {
            lat: 22.962267, lng: 76.050797
        }
        var calcRoute;
        var getestimation;
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
            var infowindow = new google.maps.InfoWindow({
                content: "You are here"
            });
            marker.addListener('click', function () {
                infowindow.open(map, marker);
            });

            var directionsService = new google.maps.DirectionsService();
            var directionsDisplay = new google.maps.DirectionsRenderer();
            var circle = new google.maps.Circle({
                center: dewas,
                radius: 500
            });
            var options = {
                bounds: circle.getBounds()

            };
            var source = new google.maps.places.SearchBox(document.getElementById('<%=pickupLocation.ClientID %>'), options);
            destination = new google.maps.places.SearchBox(document.getElementById('<%= destinationLocation.ClientID %>'), options);
            var geocoder = new google.maps.Geocoder();

            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition, showError);
            } else {
                alert("Geolocation is not supported by this browser.");
            }
            google.maps.event.addListener(marker, 'dragend', function (event) {

                geocodeLatLng(geocoder, map, marker.getPosition());
            });

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
                infowindow.open(map, marker);
                geocodeLatLng(geocoder, map, marker.getPosition());

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

            source.addListener('places_changed', function () {

                geocodeAddress(geocoder, map);
                
                directionsDisplay.setMap(null);
                
            });
            
            destination.addListener('places_changed', function () {

                

                directionsDisplay.setMap(null);

            });
            function geocodeAddress(geocoder, resultsMap) {
                var address = document.getElementById('<%=pickupLocation.ClientID %>').value;
                geocoder.geocode({ 'address': address }, function (results, status) {
                    if (status === 'OK') {
                        resultsMap.setCenter(results[0].geometry.location);

                        marker.setPosition(results[0].geometry.location);
                    } else {
                        alert('Geocode was not successful for the following reason: ' + status);
                    }
                });
            }
            function geocodeLatLng(geocoder, map, latlng) {

                geocoder.geocode({ 'location': latlng }, function (results, status) {
                    if (status === 'OK') {
                        if (results[0]) {
                            document.getElementById('<%=pickupLocation.ClientID %>').value = results[0].formatted_address;

                        } else {
                            window.alert('No results found');
                        }
                    } else {
                        window.alert('Geocoder failed due to: ' + status);
                    }
                });
            }
           
          
            calcRoute = function (start,end) {
                
                directionsDisplay.setMap(map);
                
                
                var request = {
                    origin: start,
                    destination: end,
                    travelMode: 'DRIVING',
                    drivingOptions: {
                        departureTime: new Date(Date.now()),  
                        trafficModel: 'optimistic'
                                               
                    },
                    unitSystem: google.maps.UnitSystem.METRIC,
                    avoidHighways: false,
                    avoidTolls: false
                };
                
                
               
                directionsService.route(request, function (response, status) {
                    
                    if (status === 'OK') {
                        directionsDisplay.setDirections(response);
                    } else {
                        window.alert('Directions request failed due to ' + status);
                    }
                });
            }
            var service = new google.maps.DistanceMatrixService();
            getestimation = function () {
                
                var start = document.getElementById('<%=pickupLocation.ClientID %>').value;
                var end = document.getElementById('<%=destinationLocation.ClientID %>').value;
                if (end == "") {
                    alert("Please provide the destination address");
                    return;
                }
                if (start == "") {
                    alert("Please provide the destination address");
                    return;
                }
                
                $("#estimation-display").css("display", "block");
                options = {

                    origins: [document.getElementById('<%=pickupLocation.ClientID %>').value],
                    destinations: [document.getElementById('<%=destinationLocation.ClientID %>').value],
                    travelMode: 'DRIVING',
                    unitSystem: google.maps.UnitSystem.METRIC,
                    avoidHighways: false,
                    avoidTolls: false
                };

                
                service.getDistanceMatrix(options, callback);
                calcRoute(start, end);
                
                
            }
            driverDistanceCalculator = function () {
                options = {

                    origins: [document.getElementById('<%=pickupLocation.ClientID %>').value],
                    destinations: [document.getElementById('<%=destinationLocation.ClientID %>').value],
                    travelMode: 'DRIVING',
                    unitSystem: google.maps.UnitSystem.METRIC,
                    avoidHighways: false,
                    avoidTolls: false
                };


                service.getDistanceMatrix(options, callback);
            }
            addNewMarker = function (marker,pos,icon,map,title,draggable) {
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

        GetFare = function () {

            var xhttp;
            var id = flag;
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (xhttp.readyState == 4 && xhttp.status == 200) {
                    setTimeout(function () {
                        estimatedFare = parseFloat(xhttp.responseText) * estimatedDistance;
                        document.getElementById('<%=estimatedFare.ClientID %>').value = estimatedFare;
                    }, 1500);
                    
                }
            };
            xhttp.open("GET", "ajaxOperations.aspx?id=" + id +"&type=getFare", false);
            xhttp.send(null);
        }




        function callback(response, status) {
            if (status == 'OK') {
                var origins = response.originAddresses;
                var destinations = response.destinationAddresses;

                for (var i = 0; i < origins.length; i++) {
                    var results = response.rows[i].elements;
                    for (var j = 0; j < results.length; j++) {
                        var element = results[j];
                        estimatedDistance = element.distance.value/1000;
                        document.getElementById('<%=estimatedDistance.ClientID %>').value = (element.distance.value/1000) ;
                        document.getElementById('<%=estimatedDuration.ClientID %>').value = Math.round((element.duration.value / 60)) + " Mins";
                        var from = origins[i];
                        var to = destinations[j];
                    }
                }
                
            }
            else {
                alert("error");
            }

        }

    </script>

    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY&callback=initMap&libraries=places"
        async defer></script>
</asp:Content>
