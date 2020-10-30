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
				<span class="wel_word"></span>
		</div>
		
		<div id="main">
		
			<h1>注册成功! 请先<a href="${pageContext.request.contextPath}/UI/loginUI">登录</a></h1>
	
		</div>
		
		<div id="bottom">
			<span>
				中公书城.Copyright &copy;2019
			</span>
		</div>
</body>
</html>