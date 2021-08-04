<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- loader  -->


<div class="wrapper">

    <!-- end loader -->
    <div class="sidebar">
        <!-- Sidebar  -->
        <nav style="background:#A9A9A9" id="sidebar">
                
            <div id="dismiss">
                <i class="fa fa-arrow-left"></i>
            </div>

            <ul class="list-unstyled components">
                <li class="">
                    <a href="index.html"><img src="https://yt3.ggpht.com/ytc/AAUvwnifK3IaFnMG4cBC9w9xoDuHUgP08_9uO6cCmOl0=s900-c-k-c0x00ffffff-no-rj" alt="#"></a>
                </li>

                <li class="active" >
                    <a href="#Home">Home</a>
                </li>
                <li>
                    <a href="#Brand">Brands</a>
                </li>
                <li>
                    <a href="#Contact">Contact with me</a>
                </li>
            </ul>

        </nav>
    </div>

    <div id="Home">
        <!-- header -->
        <header>
            <!-- header inner -->
            <!--                <div class="head_top">-->
            <div class="header">

                <div class="container-fluid">

                    <div class="row">
                        <div class="col-lg-3 logo_section">
                            <div class="full">
                                <div class="center-desk">
                                    <div class="logo">
                                        <a href="index.html"><img src="https://yt3.ggpht.com/ytc/AAUvwnifK3IaFnMG4cBC9w9xoDuHUgP08_9uO6cCmOl0=s900-c-k-c0x00ffffff-no-rj" alt="#"></a>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <div class="right_header_info" style="margin-top: 10px">
                                <ul>
                                    <c:if test="${sessionScope.acc != null}">
                                        <li class="nav-item">
                                            <a class="nav-link "style="text-align: center" href="#">Welcome ${sessionScope.acc.user}</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link "style="float:right" href="logout">Log out</a>
                                        </li> 
                                    </c:if>
                                        <c:if test="${sessionScope.acc1 != null}">
                                        <li class="nav-item">
                                            <a class="nav-link "style="text-align: center" href="#">Welcome ${sessionScope.acc1.username}</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link "style="float:right" href="logout">Log out</a>
                                        </li> 
                                    </c:if>
                                    <li class="menu_iconb">
                                        <a href="#"><img style="margin-right: 15px;" src="icon/1.png" alt="#" />0338622864</a>
                                    </li>
                                    <c:if test="${sessionScope.acc.isAdmin == 1}">
                                        <li class="menu_iconb">
                                            <a href="ManageAccount">Manager Account<img style="margin-left: 15px;" src="icon/6.png" alt="#" /></a>
                                        </li>
                                    </c:if>
                                        <c:if test="${sessionScope.acc.isAdmin == 1 || sessionScope.acc.isSell == 1}">
                                        <li class="menu_iconb">
                                            <a href="BillController">Manager Bill<img style="margin-left: 15px;" src="icon/6.png" alt="#" /></a>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.acc.isSell == 1}">
                                        <li class="menu_iconb">
                                            <a href="manager">Manager Product<img style="margin-left: 15px;" src="icon/6.png" alt="#" /></a>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.acc == null && sessionScope.acc1 == null}">
                                        <li class="menu_iconb">
                                            <a href="Login.jsp">Log in <img style="margin-right: 15px;" src="icon/5.png" alt="#" /> </a>
                                        </li>
                                    </c:if>
                                        <c:if test="${sessionScope.acc1 !=null}">
                                        <li class="menu_iconb">
                                            <a href="BillUser">Your Bill <img style="margin-right: 15px;" src="icon/6.png" alt="#" /> </a>
                                        </li>
                                    </c:if>
                                        


                                    <li class="tytyu">
                                        <a href="print"> <img style="margin-right: 15px;" src="icon/2.png" alt="#" /></a>
                                    </li>
                                    <form  action="Searching" method="post" class="form-inline my-2 my-lg-0">
                                        <div class="input-group input-group-sm">
                                            <input value="${txtS}"  name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                                            <div class="input-group-append">
                                                <button type="submit" class="btn btn-secondary btn-number">
                                                    <i class="fa fa-search"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <li>
                                            <button type="button"  id="sidebarCollapse">
                                                <img src="images/menu_icon.png" alt="#" />
                                            </button>
                                        </li>



                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- end header inner -->

            <!-- end header -->
            <section class="slider_section">
                <div class="banner_main">
                    <div class="container-fluid padding3">
                        <div class="row">
                            <div id="myCarousel" class="carousel slide banner_Client" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                    <li data-target="#myCarousel" data-slide-to="1"></li>
                                    <li data-target="#myCarousel" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <div class="container">
                                            <div class="carousel-caption text">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="img_bg">
                                                            <figure><img style="width:40%;height:20%;margin-left: 500px;" src="images/anh3.jpg" /></figure>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="container">
                                            <div class="carousel-caption text">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="img_bg">
                                                            <figure><img style="width:40%;height:20%;margin-left: 500px;" src="images/anh1.jpg" /></figure>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="carousel-item">
                                        <div class="container">
                                            <div class="carousel-caption text">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="img_bg">
                                                            <figure><img style="width:40%;height:20%;margin-left: 500px;" src="images/anh2.jpg" /></figure>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </section>

    </div>