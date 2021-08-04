<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
    <div class="card bg-light mb-3">
        <div id="Brand" class="card-header bg-secondary text-white text-uppercase"><i class="fa fa-list"> <a href="home"></i> MINH SHOP</div>
        <ul class="list-group category_block">
            <c:forEach items="${listCC}" var="o">
                <li class="list-group-item text-white ${tag == o.cid ? "active":""}"><a href="category?cid=${o.cid}">${o.cname}</a></li>
            </c:forEach>

        </ul>
    </div>
    <div class="card bg-light mb-3">
        <div class="card-header bg-danger text-white text-uppercase">Best-seller Product</div>
        <div class="card-body">
            <img class="img-fluid" src="${p.image}" />
            <h5 class="card-title">${p.name}</h5>
            <p class="card-text">${p.title}</p>
            <p class="bloc_left_price">${p.price} $</p>
        </div>
    </div>
        <div class="card bg-light mb-3">
        <div class="card-body">
            <img class="img-fluid" src="${q.image}" />
            <h5 class="card-title">${q.name}</h5>
            <p class="card-text">${q.title}</p>
            <p class="bloc_left_price">${q.price} $</p>
        </div>
    </div>
</div>