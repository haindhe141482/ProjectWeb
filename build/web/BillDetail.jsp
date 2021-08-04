<%@page import="java.sql.ResultSet"%>
<%@page import="entity.Category"%>
<%@page import="entity.Product"%>
<%@page import="entity.Customer"%>
<%@page import="entity.Bill"%>
<%@page import="entity.BillDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Detail</title>
        <style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #04AA6D;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>

    </head>
    <body>
        
        <%
            ResultSet rs1 = (ResultSet) request.getAttribute("ketQua1");
            ResultSet rs2 = (ResultSet) request.getAttribute("ketQua2");
        %>
        <table border="1">
            <caption><h1>Bill Detail</h1></caption>
            <tbody>
                <%while (rs1.next()) {%>
                <tr>
                    <td><h3>Order</h3></td>
                    <td>
                        <p>Order ID:   <%=rs1.getString(1) %></p>
                        <p>Date Create:<%=rs1.getString(2)%></p>
                         <%
                            if(rs1.getString(3).equals("0")) {
                        %>
                        <p>Status: Waiting </p>
                        <%
                           } else if (rs1.getString(3).equals("1")) {
                        %>
                        <p>Status: Processing </p>
                        <%
                           } else if (rs1.getString(3).equals("2")) {
                        %>
                        <p>Status: Done </p>
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
                    <td><h3>Product</h3></td>
                    <td>
                        <table border="1">
                            <thead>
                                <tr>
                                    <th>Product ID</th>
                                    <th>Product Name</th>
                                    <th>Price</th>
                                    <th>Category</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%  double totalbill =0;
                                    while (rs2.next()) {
                                    double total =0;
                                    total= Double.parseDouble(rs2.getString(14))*Integer.parseInt(rs2.getString(15));
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
                <tr>
                    <td><h3>Customer</h3></td>
                    <td>
                        <h2>Buyer</h2>
                        <p>Customer ID:     <%=rs1.getString(4) %></p>
                        <p>Customer Name:   <%=rs1.getString(5) %></p>
                        <p>Customer Phone:  <%=rs1.getString(6) %></p>
                        <p>Customer Address:<%=rs1.getString(7) %></p>
                        <p>Username:        <%=rs1.getString(8) %></p>
                        <h2>Receiver</h2>
                        <p> Name:   <%=rs1.getString(9) %></p>
                        <p> Phone:  <%=rs1.getString(10) %></p>
                        <p> Address:<%=rs1.getString(11) %></p>
                    </td>
                </tr>
                <%break;}%>
            </tbody>
        </table>
        <input type="submit" onclick=window.location.href="BillUser" value="Back to bill list" />
    </body>
</html>
