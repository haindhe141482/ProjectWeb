<%-- 
    Document   : admin_index
    Created on : Jul 9, 2021, 10:24:16 PM
    Author     : PC
--%>

<%@page import="entity.Customer"%>
<%@page import="entity.Bill"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Admin Index</title>
        <link href="css2/bootstrap.min.css" rel="stylesheet">
        <link href="css2/font-awesome.min.css" rel="stylesheet">
        <link href="css2/prettyPhoto.css" rel="stylesheet">
        <link href="css2/price-range.css" rel="stylesheet">
        <link href="css2/animate.css" rel="stylesheet">
        <link href="css2/main.css" rel="stylesheet">
        <link href="css2/responsive.css" rel="stylesheet">
    </head>
    <body>

        <%
            ResultSet rs1 = (ResultSet) request.getAttribute("ketQua1");
            ResultSet rs2 = (ResultSet) request.getAttribute("ketQua2");
        %>


        <section>
            <div class="container">
                <div class="row">


                    <div class="col-sm-12 ">

                        <h2 class="title text-center"><a href="home">MinhShop</a></h2>

                        <div class="" id="cart_items">                                            


                            
                            <p></p>
                            
                            
                            <p></p>
                            <div class="table-responsive cart_info">
                                <table border = "1" class="table table-condensed">          
                                    <h2>Bill Detail</h2>
                                    <tbody>
                                        <%while (rs1.next()) {%>
                                        <tr >
                                            <td><h5>Order</h5></td>
                                            <td>
                                                <p>Order ID:   <%=rs1.getString(1)%></p>
                                                <p>Date Create:<%=rs1.getString(2)%></p>
                                                <%
                                                    if (rs1.getString(3).equals("0")) {
                                                %>
                                                <p>Status: Waiting </p>
                                                <%
                                                } else if (rs1.getString(3).equals("1")) {
                                                %>
                                                <p>Status: Delivering </p>
                                                <%
                                                } else if (rs1.getString(3).equals("2")) {
                                                %>
                                                <p>Status: Delivered </p>
                                                <%
                                                } else if (rs1.getString(3).equals("3")) {
                                                %>
                                                <p>Status: Canceled </p>                      
                                                <%
                                                    }
                                                %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><h5>Product</h5></td>
                                            <td>
                                                <table border="1">
                                                    <thead>
                                                        <tr class="cart_menu">
                                                            <th>Product ID</th>
                                                            <th>Product Name</th>
                                                            <th>Price</th>
                                                            <th>Category</th>
                                                            <th>Quantity</th>
                                                            <th>Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%  double totalbill = 0;
                                                            while (rs2.next()) {
                                                                double total = 0;
                                                                total = Double.parseDouble(rs2.getString(14)) * Integer.parseInt(rs2.getString(15));
                                                                totalbill += total;
                                                        %>
                                                        <tr>
                                                            <td><%=rs2.getString(12)%></td>
                                                            <td><%=rs2.getString(13)%></td>
                                                            <td><%=rs2.getString(14)%></td>
                                                            <td><%=rs2.getString(17)%></td>
                                                            <td><%=rs2.getString(15)%></td>
                                                            <td><%=total%></td>
                                                        </tr>
                                                        <%}%>
                                                        <tr>
                                                            <td>Total</td>
                                                            <td><%=totalbill%></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr class="cart_menu">
                                            <td><h5>Customer</h5></td>
                                            <td>
                                                <h2>Buyer</h2>
                                                <p>Customer ID:     <%=rs1.getString(4)%></p>
                                                <p>Customer Name:   <%=rs1.getString(5)%></p>
                                                <p>Customer Phone:  <%=rs1.getString(6)%></p>
                                                <p>Customer Address:<%=rs1.getString(7)%></p>
                                                <p>Username:        <%=rs1.getString(8)%></p>
                                                <h2>Receiver</h2>
                                                <p> Name:   <%=rs1.getString(9)%></p>
                                                <p> Phone:  <%=rs1.getString(10)%></p>
                                                <p> Address:<%=rs1.getString(11)%></p>
                                            </td>
                                        </tr>
                                        <%break;
                    }%>
                                    </tbody>
                                </table>
                                    <input class="btn btn-default check_out" type="button" onclick="history.back()" value="Back to prevous page" style="margin:0;">
                            </div>


                        </div>

                    </div>
                </div>
            </div>
        </section>





        <script src="js2/jquery.js"></script>
        <script src="js2/bootstrap.min.js"></script>
        <script src="js2/jquery.scrollUp.min.js"></script>
        <script src="js2/price-range.js"></script>
        <script src="js2/jquery.prettyPhoto.js"></script>
        <script src="js2/main.js"></script>

    </body>
</html>
