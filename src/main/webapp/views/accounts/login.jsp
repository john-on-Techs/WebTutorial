<%--
  Created by IntelliJ IDEA.
  User: oenga
  Date: 8/26/19
  Time: 4:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="/error.jsp" %>

<html>

<head>
    <title>Title</title>
    <%@include file="/views/layout/css.jsp"%>
</head>
<body >

<%@include file="/views/layout/header.jsp"%>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    if(session.getAttribute("user")!=null){
        response.sendRedirect(pageContext.toString());
    }
%>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-4 "></div>
        <div class="col-md-6">
            <form action="login" method="post" class>

                <div class="form-group">
                    <label for="user-id">User ID</label>
                    <input type="number" required class="form-control" id="user-id" name="user-id" placeholder="Enter user ID">
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" required class="form-control" id="username" name="username" placeholder="Enter username">
                </div>
               <%-- <div class="form-group">
                    <label for="user-password">Password</label>
                    <input type="password"  class="form-control" id="user-password" name="user-password" placeholder="Password">
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="keep-me-signed" name="keep-me-signed">
                    <label class="form-check-label" for="keep-me-signed">Check me out</label>
                </div>--%>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>

        </div>
    </div>
</div>


<%@include file="/views/layout/js.jsp"%>
</body>
</html>
