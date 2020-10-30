<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>后台管理</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" >
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
</style>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="${pageContext.request.contextPath}/static/img/logo.gif" >
			<span class="wel_word">后台管理系统</span>
			<div>
				<a href="${pageContext.request.contextPath}/UI/book_managerUI">图书管理</a>
				<a href="${pageContext.request.contextPath}/UI/indexUI">返回商城</a>
			</div>
	</div>
	
	<div id="main">
		<h1>欢迎<span style="color:red;">${username }</span>进入后台管理系统</h1>
	</div>
	
	<div id="bottom">
		<span>
			中公书城.Copyright &copy;2019
		</span>
	</div>
</body>
</html>