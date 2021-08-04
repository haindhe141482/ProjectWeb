<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Bill</title>
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
        <script>
function disable() {
  document.getElementById("trangThai").disabled=true;
}
function enable() {
  document.getElementById("trangThai").disabled=false;
}
</script>
    </head>

    <body>      

        <div id="Brand" style="text-align:center;" class="card-header bg-secondary  text-uppercase"><i class="fa fa-list"> <a href="home"></i> MINH SHOP</div>
    </a>              
    <form method="post" style="margin-left:15px;margin-top:20px;" action="BillController?service=searchByStatus" class="form-inline" id="searchForm" name="searchObject">

        <select class="form-control" id="trangThai" name="status">
            <option  value="4">All</option>
            <option ${checkStatus == 0?"selected":""} value="0">Waiting</option>
            <option ${checkStatus == 1?"selected":""} value="1">Delivering</option>
            <option ${checkStatus == 2?"selected":""} value="2">Delivered</option>     
            <option ${checkStatus == 3?"selected":""} value="3">Canceled</option> 
        </select>
        <br><br>



        &nbsp;&nbsp; &nbsp;&nbsp;
        <br>
        <button  type="submit" class="bg-secondary" id="btnDuyetDonHang">Searching</button>

    </form>
        <input type="button" onclick="disable()" value="Disable list">
<input type="button" onclick="enable()" value="Enable list">

        <div><class style="text-align:center"> <h2>Manage Bill </h2></class></div>
<div class="shopping-cart">
    <div class="px-4 px-lg-0">

        <div class="pb-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-24 p-10 bg-white rounded shadow-sm mb-5">

                        <!-- Shopping cart table -->
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="p-2 px-3 text-uppercase">Order ID	</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">Date Create</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase"> Name	</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase"> Phone	</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase"> Address       </div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">Total</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">Status</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">Update</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">Update</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">Update</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">CID</div>
                                        </th>
                                        <th scope="col" class="border-0 bg-light">
                                            <div class="py-2 text-uppercase">Bill Detail</div>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listB}" var="o">
                                        <tr>
                                            <td>${o.oID}</td>
                                            <td>${o.dateCreate}</td>
                                            <td>${o.cname}</td>
                                            <td>${o.cphone}</td>
                                            <td>${o.cAddress}</td>
                                            <td>${o.total}</td>         
                                           
                                            <c:if test="${o.status==0}">   
                                                <td>
                                                    Waiting </td>           
                                                <td><a href="BillController?service=update&oid=${o.oID}">Processing</a></td>
                                                <td></td>
                                                <td><a href="BillController?service=update2&oid=${o.oID}">Canceling</a></td>

                                            </c:if>
                                            <c:if test="${o.status==1}">
                                                <td> 
                                                    Delivering </td>
                                                <td></td>
                                                <td><a href="BillController?service=update1&oid=${o.oID}">Delivered</a></td>
                                                <td></td>
                                            </c:if>
                                                
                                            <c:if test="${o.status==2}">
                                                <td> 
                                                    Delivered </td>       
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </c:if>
                                            <c:if test="${o.status==3}">
                                                <td> 
                                                    Canceled </td>       
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </c:if>
                                             <td>${o.cid}</td>




                                            <td><a href="BillDetailController?oid=${o.oID}">Detail</a></td>

                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <!-- End -->
                    </div>
                </div>
                <div class="row py-5 p-4 bg-white rounded shadow-sm">
                    <div class="col-lg-6">                                                             
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

</html>
</html>
