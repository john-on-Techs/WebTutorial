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
    <%@include file="../layout/css.jsp"%>
</head>
<body>
<%@include file="../accounts/check_login.jsp"%>
<%@include file="../layout/header.jsp"%>
<div class="container login-container mt-5">
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
                        <input type="text" name="username"  value="${dbUser.name}" class="form-control"
                               id="username" required
                               placeholder="Username">
                    </div>

                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
        </div>

    </div>
</div>
<%@include file="../layout/js.jsp"%>
<c:if test="${message!=null}">
    <c:if test="${type!=null}">
        <script>
            $(document).ready(function () {
                swal.fire(
                    'Message',
                    '${message}',
                    '${type}'
                );
            });
        </script>
    </c:if>
</c:if>
</body>
</html>
