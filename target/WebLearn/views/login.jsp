<%--
  Created by IntelliJ IDEA.
  User: oenga
  Date: 8/26/19
  Time: 4:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>Title</title>
    <link rel="stylesheet" href="../styles/css/bootstrap.min.css">
</head>
<body>


<div class="container login-container">
    <div class="row">
        <div class="col-md-6 login-form-1">
            <form>
                <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                           placeholder="Enter email">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone
                        else.</small>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>

        </div>

    </div>
</div>


<script src="../styles/js/jquery-3.2.1.slim.min.js"></script>
<script src="../styles/js/popper.min.js"></script>
<script src="../styles/js/bootstrap.min.js"></script>
</body>
</html>
