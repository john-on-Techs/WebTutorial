<%--
  Created by IntelliJ IDEA.
  User: oenga
  Date: 8/29/19
  Time: 7:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
<div class="container login-container">
    <div class="row">
        <div class="col-md-6 login-form-1">
            <h2>
                <c:if test="${dbUser != null}">
                    Edit User
                </c:if>
                <c:if test="${dbUser == null}">
                    Add New User
                </c:if>
            </h2>
            <c:if test="${dbUser != null}">
            <form action="update-user" method="post"></c:if>
                <c:if test="${dbUser == null}">
                <form action="create-user" method="post"></c:if>

                    <c:if test="${dbUser != null}">
                        <input type="hidden" name="userId" value="${dbUser.id}"/>
                    </c:if>
                    <div class="form-group">
                        <label for="userId">User ID</label>
                        <input type="number" class="form-control" id="userId"
                               name="userId" placeholder="Enter User ID" value="${dbUser.id}" <c:if test="${dbUser !=null}">readonly</c:if> required>
                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" name="username" value="${dbUser.name}" class="form-control"
                               id="username" required
                               placeholder="Username">
                    </div>

                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
        </div>

    </div>
</div>


<script src="${pageContext.request.contextPath}/styles/js/jquery-3.2.1.slim.min.js"></script>
<script src="${pageContext.request.contextPath}/styles/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/styles/js/bootstrap.min.js"></script>
</body>
</html>
