<%-- 
    Document   : Login
    Created on : Jun 7, 2021, 12:38:49 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login</title>
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
                    <h1 style="color:#778899">MINH SHOP</h1>
                    <div class="main-agileits">
                        <!--form-stars-here-->
                        <div class="form-w3-agile">                          
                            <h2>Login Now</h2>
                            <form action="login" method="post">
                                <p class="text-danger" style="font-size:20px">${mess}</p>
                                <p class="text-danger" style="font-size:20px;color:orange">${mess1}</p>      
                                <div class="form-sub-w3">
                                    <input type="text" name="user" value="${username}" placeholder="Username " required="" />
                                    <div class="icon-w3">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="form-sub-w3">
                                    <input type="password" name="pass" value="${password}" placeholder="Password" required="" />
                                    <div class="icon-w3">
                                        <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="form-group form-check">
                    <input name="remember" value="1" type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Remember me</label>
                </div>
                                <p class="p-bottom-w3ls">Change Password?<a class href="ChangePassword.jsp">Click here</a></p>
                                <p style="margin-left:10px;" class="p-bottom-w3ls">New User?<a class href="Signup.jsp">Register here</a></p>
                                
                                <div class="clear"></div>
                                <div class="submit-w3l">
                                    <input type="submit" value="Login">

                                </div>
                            </form>
                            <div class="social w3layouts">
                                <div class="heading">
                                    <h5>Or Login with</h5>
                                    <div class="clear"></div>
                                </div>
                                <div class="icons">
                                    <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-pinterest-p" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                                    <div class="clear"></div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <!--//form-ends-here-->
                    </div>				
                </div>
            </div>
        </div>	

    </body>
</html>