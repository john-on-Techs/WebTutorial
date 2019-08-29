<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/bootstrap.min.css">
<body>
<%
    response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    if(session.getAttribute("user")==null){
        response.sendRedirect("login");
    }
%>
<div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Retail Shop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">

            <li class="nav-item">
                <a class="nav-link" href="list-product">Products</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="list-receivings">Receivings</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="list-sale">Sales</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="list-user">Users</a>
            </li>
                <li class="nav-item">
                    <form action="logout" method="post">
                        <button type="submit">Logout</button>
                    </form>
                </li>

            </ul>


        </div>
    </nav>
    <%--    End of Navbar--%>
</div>

<script src="${pageContext.request.contextPath}/styles/js/jquery-3.2.1.slim.min.js"></script>
<script src="${pageContext.request.contextPath}/styles/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/styles/js/bootstrap.min.js"></script>
</body>
</html>
