
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="/error.jsp" %>
<html>
<head>
    <title></title>
   <%@include file="views/layout/css.jsp"%>
</head>
<body>
<%
    try {
        out.println(5 / 0);
    }catch (Exception e){
        throw new ArithmeticException("Trying to divide by zero");
    }
%>
<%@include file="views/accounts/check_login.jsp"%>
<%@include file="views/layout/header.jsp"%>
<%@include file="views/layout/js.jsp"%>
</body>
</html>
