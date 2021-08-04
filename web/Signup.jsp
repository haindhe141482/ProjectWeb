<%-- 
    Document   : Signup
    Created on : Jun 13, 2021, 12:30:49 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Clean Login Form a Flat Responsive Widget Template :: w3layouts</title>
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
                            <h2>Signup Now</h2>
                            <form action="signup" method="post">
                               <p class="text-danger" style="font-size:20px">${mess}</p>
                                <tr>
                       <div class="form-sub-w3"> Your Name
                                    <input type="text" name="cname" placeholder="" required="" />
                                    <div class="icon-w3">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="form-sub-w3"> Phone Number
                                    <input type="text" name="cphone" placeholder="" required="" />
                                    <div class="icon-w3">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="form-sub-w3"> Address
                                    <input type="text" name="cAddress" placeholder="" required="" />
                                    <div class="icon-w3">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="form-sub-w3"> Username
                                    <input type="text" name="user" placeholder="Username" required="" />
                                    <div class="icon-w3">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="form-sub-w3">Password
                                    <input type="password" name="pass" placeholder="Password" required="" />
                                    <div class="icon-w3">
                                        <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                                    </div>
                                </div>Repeat Password
                                <input name="repass" type="password" id="user-repeatpass" class="form-control" placeholder=" Password" required autofocus="">
                                
                                <div class="clear"></div>
                                <div class="submit-w3l">
                                      <input type="submit" value="Sign up">
                                     <a href="Login.jsp" id="cancel_signup" style="color :white"><i class="fas fa-angle" style="color:white"></i> Back to Login</a>

                                </div>
                            </form>
   
                        </div>
                        <!--//form-ends-here-->
                    </div>				
                </div>
            </div>
        </div>	
</html>
