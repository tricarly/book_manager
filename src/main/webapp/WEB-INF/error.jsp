<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
</head>
<body>
<script type="text/javascript">
    alert("您还没有登录，请登录后再查看这些！");
    window.location.href="${pageContext.request.contextPath}/UI/loginUI";
</script>
</body>
</html>
