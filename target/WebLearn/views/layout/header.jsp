        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                --%>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>


                <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
                <a class="navbar-brand" href="#">RetailShop</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav mr-auto nav-fill w-100">
                <c:if test="${user != null}">
                <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}">Home </a>
                </li>
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

                <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Welcome,${user.name}
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="">###</a>

                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="logout" onclick="event.preventDefault();
                document.getElementById('frm-logout').submit();">Logout</a>
                <form id="frm-logout" action="logout" method="POST" style="display: none;">

                </form>
                </div>
                </li>
                </c:if>
                </ul>

                </div>
                </nav>

