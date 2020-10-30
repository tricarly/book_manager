<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>编辑图书</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" >
<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
	
	h1 a {
		color:red;
	}
	
	input {
		text-align: center;
	}
</style>
</head>
<body>
		<div id="header">
			<img class="logo_img" alt="" src="${pageContext.request.contextPath}/static/img/logo.gif" >
			<span class="wel_word">编辑图书</span>
			<div>
				<a href="${pageContext.request.contextPath}/UI/book_managerUI">图书管理</a>
				<a href="${pageContext.request.contextPath}/UI/indexUI">返回商城</a>
			</div>
		</div>
		
		<div id="main">
			<form action="${pageContext.request.contextPath}/book/update" method="post">
				<input type="hidden" name="bid" value="${book.bid}">
				<table>
					<tr>
						<td>名称</td>
						<td>价格</td>
						<td>作者</td>
						<td>销量</td>
						<td>库存</td>
						<td>封面</td>
						<td colspan="2">操作</td>
					</tr>		
					<tr>
						<td><input name="bookname" type="text" value="${book.bookname}"/></td>
						<td><input name="price" type="text" value="${book.price}"/></td>
						<td><input name="author" type="text" value="${book.author}"/></td>
						<td><input name="sale" type="text" value="${book.sale}"/></td>
						<td><input name="stock" type="text" value="${book.stock}"/></td>
						<td><img  src="/upload/${book.picture}"
								  width="50px" height="70px"/><input name="file" type="file"></td>
						<td><input type="submit" value="提交"/></td>
					</tr>		
				</table>
			</form>
			
	
		</div>
		
		<div id="bottom">
			<span>
				中公书城.Copyright &copy;2019
			</span>
		</div>
</body>
</html>