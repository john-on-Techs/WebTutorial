<%--
  Created by IntelliJ IDEA.
  User: oenga
  Date: 8/29/19
  Time: 7:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/bootstrap.min.css" >

</head>
<body>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    if(session.getAttribute("user")==null){
        response.sendRedirect("login");
    }
%>



<div class="container">

    <c:if test="${users!= null}">
    <table class=" table">
        <caption>List of Users</caption>
        <thead>
        <tr>
            <th scope="col">#ID</th>
            <th scope="col">Name</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${users}" var="dbUser" >
            <tr>
                <td>${dbUser.id}</td>
                <td>${dbUser.name}</td>

                <td> <a href="update-user?userId=${dbUser.id}" role="button" class="btn btn-primary">Edit</a></td>
                <td><form action="delete-user" method="post">
                    <input type="hidden" name="userId" value="${dbUser.id}"/>
                    <button class="btn btn-danger" type="submit">Delete</button>
                </form></td>

            </tr>
        </c:forEach>




        </tbody>
    </table>
    </c:if>
    <a href="create-user" class="badge badge-primary">Add New User</a>


    <script src="${pageContext.request.contextPath}/styles/js/jquery-3.2.1.slim.min.js"></script>
    <script src="${pageContext.request.contextPath}/styles/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/styles/js/bootstrap.min.js"></script>
</body>
</html>
