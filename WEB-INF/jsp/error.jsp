<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: cnhhdn
  Date: 2017/5/24
  Time: 8:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>error</title>
</head>
<body>
<c:if test="${!empty requestScope.exMsg}">
    ${requestScope.exMsg}
</c:if>
</body>
</html>
