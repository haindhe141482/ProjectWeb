<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Minh Shop</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .logo{
                height: 100%;
                width: 70%;
                display: flex;
                margin-bottom: -23px;
            }
            .logo2{
                height:100%;
                width:100%;
                overflow:hidden;
            }
            .breadcrumb{
                margin-top: 65px;    
            }
            .carousel-indicators{
                margin-bottom: -40px;
                margin-left:70px;
            }
            .product{
                margin-top: 30px;
            }
            .abc{
                margin-left:530px;
                margin-bottom: 50px;
            }
            
        </style>
    </head>
    <body>
   <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container product">
                <div class="row">
                <jsp:include page="Left.jsp"></jsp:include>

                    <div class="col-sm-9">
                        <div id="content" class="row">
                        <c:forEach items="${listP}" var="o">
                            <div class="product col-12 col-md-6 col-lg-4">
                                <div class="card">
                                    <img class="card-img-top" src="${o.image}" alt="Card image cap">
                                    <div class="card-body">
                                        <p class="card-title show_txt"><a href="detail?pid=${o.id}" title="View Product">${o.name}</a></p>
                                       
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-primary btn-block">${o.price} $</p>
                                            </div>
                                            <div class="col">
                                                <a href="cart?id=${o.id}" class="btn btn-info btn-block">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
<!--                    <button onclick="loadMore()" class="btn btn-primary">Show more</button>-->
                </div>
               

            </div>
                <div class="clearfix abc">
                        <div class="">Showing <b>4</b> out of <b>25</b> entries</div>
                        <ul class="pagination">
                            <c:if test="${tag>1}">                                                        
                            <li class="page-item "><a href="home?index=${tag-1}" class="page-link">Previous</a></li>
                             </c:if>
                                <c:forEach begin="1" end="${endP}" var="i">
                                 <li class="page-item ${tag== i? "active" :""}"><a href="home?index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>
                                 <c:if test="${tag<endP}">   
                            <li class="page-item"><a href="home?index=${tag+1}" class="page-link">Next</a></li>
                            </c:if>
                        </ul>
                    </div>
        </div>
    <jsp:include page="Footer.jsp"></jsp:include>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--    <script>
                        function loadMore() {
                            var amount = document.getElementsByClassName("product").length;
                            $.ajax({
                                url: "/1/load",
                                type: "get", //send it through get method
                                data: {
                                    exits: amount
                                },
                                success: function (data) {
                                    var row = document.getElementById("content");
                                    row.innerHTML += data;
                                },
                                error: function (xhr) {
                                    //Do Something to handle error
                                }
                            });
                        }


    </script>  -->
<!--<script>
function searchByName(param){
                            var txtSearch = param.value;
                            $.ajax({
                                url: "/ProjectBinhNV/searchAjax",
                                type: "get", //send it through get method
                                data: {
                                    txt: txtSearch
                                },
                                success: function (data) {
                                    var row = document.getElementById("content");
                                    row.innerHTML = data;
                                },
                                error: function (xhr) {
                                    //Do Something to handle error
                                }
                            });
                        }
        </script>  -->
    <!-- Javascript files-->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery-3.0.0.min.js"></script>

    <!-- sidebar -->
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/custom.js"></script>
    <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
    <script type="text/javascript">
                        $(document).ready(function () {
                            $("#sidebar").mCustomScrollbar({
                                theme: "minimal"
                            });

                            $('#dismiss, .overlay').on('click', function () {
                                $('#sidebar').removeClass('active');
                                $('.overlay').removeClass('active');
                            });

                            $('#sidebarCollapse').on('click', function () {
                                $('#sidebar').addClass('active');
                                $('.overlay').addClass('active');
                                $('.collapse.in').toggleClass('in');
                                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
                            });
                        });
    </script>
    <script>
        $(document).ready(function () {
            $(".fancybox").fancybox({
                openEffect: "none",
                closeEffect: "none"
            });

            $(".zoom").hover(function () {

                $(this).addClass('transition');
            }, function () {

                $(this).removeClass('transition');
            });
        });
    </script>
    <script>
        // This example adds a marker to indicate the position of Bondi Beach in Sydney,
        // Australia.
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 11,
                center: {
                    lat: 40.645037,
                    lng: -73.880224
                },
            });

            var image = 'images/maps-and-flags.png';
            var beachMarker = new google.maps.Marker({
                position: {
                    lat: 40.645037,
                    lng: -73.880224
                },
                map: map,
                icon: image
            });
        }
    </script>
    <!-- google map js -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8eaHt9Dh5H57Zh0xVTqxVdBFCvFMqFjQ&callback=initMap"></script>
    <!-- end google map js -->
</body>


</html>