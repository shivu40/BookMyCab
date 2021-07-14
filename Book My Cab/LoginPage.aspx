<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Book_My_Cab.WebForm3" %>
<asp:Content runat="server" ContentPlaceHolderID ="ContentPlaceHolder1"> 
 <style>
        .BackImage {
            background-image: url('/Images/cab mono4.JPG');
            height: 350px;
            background-size: 100% 100%;
            width: 100%;
            background-repeat: no-repeat;
        }
         .BN-btn {
            margin-left: 47%;
            margin-top: 300px;
            width:105px;

            white-space:normal;
            background-color: #ffffff;
            color: #ff0000;
            font-size: 17px;
            font-family: 'Times New Roman', Times, serif;
        }

        

        body {
            background-color: #f7ebaa;
        }



        img.cont {
            width: 200px;
            height: 140px;
        }

        p.cont {
            margin-left: 220px;
            font-size: 16px;
        }

        h3.cont {
            margin-left: 220px;
            margin-top: -4px;
            color: red;
        }

</style>     
    
    
    
    
    
    
    <div class="BackImage">
            <div class="row" >
                    <div class="col-xs-3 col-xs-offset-3 col-md-3 col-md-offset-4 col-sm-3 col-sm-offset-4 ">
                        
                        <asp:Button id="btnBook" CssClass="btn btn-primary btn-responsive  BN-btn" runat="server" Text="Book Now" OnClick="btnBook_Click" />
                    </div>
                            
            </div> 
        </div>
                
           
        
         <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h2>Why ride with Book My Cab?</h2> 
                </div>
                <br /><br /><br /><br />
            </div>
            <div class="row">
                <div class="col-sm-6 col-xs-12">
                    <img class="img-rounded pull-left cont" src="Images/cheap.jpg" />
                    <h3 class="cont">Cabs for Every Pocket</h3>
                    <p class="cont">
                        From Sedans and SUVs to Luxury cars for special occasions, we have cabs to suit every pocket

                    </p>
                </div>
                <div class="col-sm-6 col-xs-12">
                    <img class="img-rounded pull-left cont " src="Images/secure.jpg" />
                    <h3 class="cont">Secure and Safer Rides</h3>
                    <p class="cont">
                        Verified drivers, an emergency alert button, and live ride tracking are some of the features 
                        that we have in place to ensure you a safe travel experience.
                    </p>
                </div>
            </div>
             <br /><br /><br /><br />
             <div class="row">
                <div class="col-sm-6 col-xs-12">
                    <img class="img-rounded pull-left cont" src="Images/24-7-service.png" style="height:180px; margin-top:-25px" />
                    <h3 class="cont">24/7 Customer Support</h3>
                    <p class="cont">
                        
                       A dedicated 24x7 customer support team always at your service to help solve any problem

                    </p>
                </div>
                <div class="col-sm-6 col-xs-12">
                    <img class="img-rounded pull-left cont " src="Images/entertainment.jpg" "/>
                    <h3 class="cont">In Cab Entertainment</h3>
                    <p class="cont">
                        
                        Play music, watch videos and a lot more! Also stay connected even 
                        if you are travelling through poor network areas with our free wifi facility.


                    </p>
                </div>
            </div>
        </div>
        <div class="modal fade" tabindex="-1" id="loginModal"
        data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    &times;
                </button>
                <h4 class="modal-title">Login</h4>
            </div>
            <div class="modal-body">
                
                    <div class="form-group">
                        <label for="inputUserName">Email Id</label>
                        
                        <asp:TextBox CssClass ="form-control" id="loginId" placeholder="Login Id" runat="server" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword">Password</label>
                        
                        <asp:TextBox CssClass ="form-control" id="loginPassword" placeholder="Login Password" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                
            </div>
            <div class="modal-footer">
                <asp:Button ID="loginButton" CssClass ="btn btn-primary" runat="server" Text="Login" OnClick="loginButton_Click" />
                <asp:Button ID="closeButton" runat="server" CssClass="btn btn-primary" Text="Close" data-dismiss="modal" />                                                       
            </div>
        </div>
    </div>
</div>



          <div class="modal fade" tabindex="-1" id="registrationModal"
        data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    &times;</button>
                <h4 class="modal-title">Registration form</h4>
            </div>
            <div class="modal-body">
                
                    <div class="form-group">
                        <label for="inputEmail Id">Email Id</label>
                        
                        <asp:TextBox CssClass="form-control" id="regEmailId" placeholder="Email Id" runat="server" TextMode="Email"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword">Password</label>
                        
                        <asp:TextBox CssClass="form-control" id="regPassword" placeholder=" Password" runat="server"></asp:TextBox>
                    </div>
                     <div class="form-group">
                        <label for="inputName">Name</label>
                        
                         <asp:TextBox CssClass="form-control" id="regName" placeholder="Name" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="inputMobileNo">Mobile Number</label>
                       
                        <asp:TextBox CssClass="form-control" id="regMobileNo" placeholder="Mobile Number" runat="server"></asp:TextBox>
                    </div>
                
            </div>
            <div class="modal-footer">
                <asp:Button ID="registerButton" CssClass ="btn btn-primary" runat="server" Text="Register" OnClick="registerButton_Click" />
                <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Text="Close" data-dismiss="modal" />                                                       
            </div>
        </div>
    </div>
</div>

        <br /><br /><br /><br />
</asp:Content>