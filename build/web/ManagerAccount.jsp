

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>List Users</h2>
		<a href="AddUser.jsp" class="btn btn-primary">Add
			Users</a>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Photo</th>
                                        <th>ID</th>
					<th>UserName</th>
					<th>Password</th>									
					<th>isAdmin</th>
					<th>isSell</th>
				</tr>
			</thead>
			<tbody>	
                        <c:forEach items="${listDD}" var="o">
				<tr>
					<td align="center"><img src="https://cdn1.iconfinder.com/data/icons/avatar-3/512/Manager-512.png" width="40" height="40"/></td>
					<td>${o.id}</td>
					<td>${o.user}</td>
					<td>${o.pass}</td>
					<td>${o.isAdmin}</td>
                                        <td>${o.isSell}</td>
					 </c:forEach>
<!--					<td><a class="btn btn-primary btn-sm" href="">Edit</a>
						| <a class="btn btn-danger btn-sm" href="">Del</a></td>-->
				</tr>
                               
			</tbody>
		</table>
                <div class="clearfix">
                        <div class="hint-text">Showing <b>4</b> out of <b>25</b> entries</div>
                        <ul class="pagination">
                            <c:if test="${tag>1}">                                                        
                            <li class="page-item disabled"><a href="home?index=${tag-1}">Previous</a></li>
                             </c:if>
                                <c:forEach begin="1" end="${endP}" var="i">
                                 <li class="page-item ${tag== i? "active" :""}"><a href="ManageAccount?index=${i}" class="page-link">${i}</a></li>
                                </c:forEach>
                                 <c:if test="${tag<endP}">   
                            <li class="page-item"><a href="ManageAccount?index=${tag+1}" class="page-link">Next</a></li>
                            </c:if>
                        </ul>
                    </div>
	</div>
</body>
</html>

