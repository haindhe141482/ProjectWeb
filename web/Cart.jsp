

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
            String total = request.getAttribute("total").toString();
            System.out.println("TOTAL "+total+" "+ getLineNumber());
        %>
        <div id="Brand" style="text-align:center;" class="card-header bg-secondary  text-uppercase"><i class=""> <a href="home"></i> MINH SHOP</div>  </a>   </div>
        <div class="shopping-cart">
            <div class="px-4 px-lg-0">

                <div class="pb-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">
                              
                                <!-- Shopping cart table -->
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="p-2 px-3 text-uppercase">Product</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Unit price</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Quantity</div>
                                                </th>
                                                <th scope="col" class="border-0 bg-light">
                                                    <div class="py-2 text-uppercase">Delete</div>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${list}" var="o">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="p-2">
                                                            <img src="${o.image}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                            <div class="ml-3 d-inline-block align-middle">
                                                                <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block">${o.name}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                            </div>
                                                        </div>
                                                    </th>
                             
                                                    <td class="align-middle"><strong>${o.price}</strong></td>
                                                    <td class="align-middle">
                                                        <a href="sub?id=${o.id}"><button class="btnSub">-</button></a> 
                                                        <strong>${o.amount}</strong>                                                     
                                                        <a href="cart?id=${o.id}"><button class="btnAdd">+</button></a>
                                                    </td>
                                            
                                                    
                                                    <td class=""><a onclick ="return confirm('Are you sure?')" href="remove?id=${o.id}" class="text-dark">
                                                            <button type="button" class="btn btn-danger">Remove</button>
                                                        </a>
                                                    </td>
                                                </tr> 
                                            </c:forEach>
                                                  
                                                   
                                        </tbody>
                                    </table>
                                    <a onclick ="return confirm('Are you sure?')" href="remove2" class="text-dark">
                                                            <button type="button" class="btn btn-danger">Remove All</button>
                                                              </div>
                         
                                <!-- End -->
                            </div>
                        </div>
                        
                         
                        <div class="row py-5 p-4 bg-white rounded shadow-sm">
                            <div class="col-lg-6">
       
       <form action="order" method="POST">        
        <div class="row">
          <div class="col-50">
            <h3>Billing Address</h3>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            <input type="text" id="fname" name="cname" placeholder="John M. Doe" >
            <label for="email"><i class="fa fa-envelope" required=""></i> Phone</label>
            <input type="text" id="email" name="cphone" placeholder="0338622864" >
            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
            <input type="text" id="adr" name="caddress" placeholder="542 W. 15th Street">
            <label for="city"><i class="fa fa-institution"></i> City</label>
            <input type="text" id="city" name="city" placeholder="New York" >
            <div class="row">
              <div class="col-50">
                <label for="state">State</label>
                <input type="text" id="state" name="state" placeholder="NY" >
              </div>                    
            </div>
          </div>                
        </div>
            <input type="hidden" value="<%=total%>" name="total"/>
            <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
            <input  type="submit" value="Check Out"class="btn btn-dark rounded-pill py-2 btn-block" ></input>
               <input type="reset" value="Reset"/></p>
        </form>
                                
                            </div>
                            <div class="col-lg-6">
                                <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thành tiền</div>
                                <div class="p-4">
                                    <ul class="list-unstyled mb-4">
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="alert alert-success">Tổng tiền hàng</strong><strong><%= total %></strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="alert alert-success">Phí vận chuyển</strong><strong>Free ship</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="alert alert-success">VAT</strong><strong>${vat} $</strong></li>
                                        <li class="d-flex justify-content-between py-3 border-bottom"><strong class="alert alert-success">Tổng thanh toán</strong>
                                            <h5 class="font-weight-bold">${sum} $</h5>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                           
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
    <%!
        public static int getLineNumber() {
        return Thread.currentThread().getStackTrace()[2].getLineNumber();
         }
    %>
</html>
</html>
