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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/bootstrap.min.css">
</head>
<body>


<div class="container login-container">
    <div class="row">
        <div class="col-md-6 login-form-1">
            <form action="login" method="post">

                   <div class="form-group">
                       <label for="user-id">User ID</label>
                       <input type="text" class="form-control" id="user-id" name="user-id" placeholder="Enter user ID">
                   </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter username">
                </div>
                <div class="form-group">
                    <label for="user-password">Password</label>
                    <input type="password" class="form-control" id="user-password" name="user-password" placeholder="Password">
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="keep-me-signed" name="keep-me-signed">
                    <label class="form-check-label" for="keep-me-signed">Check me out</label>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
            </form>

        </div>

    </div>
</div>
${pageContext.request.contextPath}

<script src="${pageContext.request.contextPath}/styles/js/jquery-3.2.1.slim.min.js"></script>
<script src="${pageContext.request.contextPath}/styles/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/styles/js/bootstrap.min.js"></script>
</body>
</html>
