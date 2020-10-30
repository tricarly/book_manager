<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>中公会员注册页面</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" >
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
	
	h1 a {
		color:red;
	}
</style>
</head>
<body>
		<div id="header">
				<img class="logo_img" alt="" src="${pageContext.request.contextPath}/static/img/logo.gif" >
				<div>
					<span>欢迎<span class="um_span">${username}</span>光临中公书城</span>
					<a href="${pageContext.request.contextPath}/user/logout">注销</a>&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/UI/indexUI">主页</a>
				</div>
		</div>
		
		<div id="main">
		
			<h1>欢迎回来 <a href="${pageContext.request.contextPath}/UI/indexUI">转到主页</a></h1>
	
		</div>
		
		<div id="bottom">
			<span>
				中公书城.Copyright &copy;2019
			</span>
		</div>
</body>
</html>