<%-- 
    Document   : ChangePassword
    Created on : Jun 22, 2021, 8:19:13 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Change PassWord</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Clean Login Form Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />

        <!-- css files -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!-- /css files -->

        <!-- online fonts -->
        <link href="//fonts.googleapis.com/css?family=Sirin+Stencil" rel="stylesheet">
        <!-- online fonts -->

    <body>
        <div class="container demo-1">
            <div class="content">
                <div id="large-header" class="large-header">
                    <h1>    Minh Shop</h1>
                    <div class="main-agileits">
                        <!--form-stars-here-->
                        <div class="form-w3-agile">
                            <h2>Change PassWord</h2>
                            <form action="changed" method="post">
                                <p class="text-danger" style="font-size:20px">${mess}</p>
                                <p class="text-danger" style="font-size:20px;color:orange">${mess1}</p>   
                                <div class="form-sub-w3">
                                    <input type="text" name="user" placeholder="Username " required="" />
                                    <div class="icon-w3">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="form-sub-w3">
                                    <input type="password" name="oldpass" placeholder="Password" required="" />
                                    <div class="icon-w3">
                                        <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="form-sub-w3">
                                    <input type="password" name="newpass" placeholder="NewPassword" required="" />
                                    <div class="icon-w3">
                                        <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                                    </div>
                                </div>
                                
                                <div class="clear"></div>
                                <div class="submit-w3l">
                                    <p><input type="submit" value="Change Password" name="submit"/>
                                </div>
                            </form>
                                
                            <div class="social w3layouts">
                                <div class="heading">

                                    <div class="clear"></div>
                                </div>
                                <div class="clear"></div>
                                <a href="Login.jsp" id="cancel_signup" style="color :white"><i class="fas fa-angle" style="color:white"></i> Back to Login</a>

                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>	

    </body>
</html>
