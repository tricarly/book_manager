<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书管理</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" >
	<style type="text/css">
		#main {
			height: 460px;
			width: 1200px;
			border: 1px black solid;
			overflow: auto;
		}
	</style>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="${pageContext.request.contextPath}/static/img/logo.gif" >
			<span class="wel_word">图书管理系统</span>
			<div>
				<a href="${pageContext.request.contextPath}/UI/indexUI">返回商城</a>
			</div>
	</div>
	
	<div id="main">
		<table>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><a href="${pageContext.request.contextPath}/UI/book_addUI">添加图书</a></td>
			</tr>
			<tr>
				<td>名称</td>
				<td>价格</td>
				<td>作者</td>
				<td>销量</td>
				<td>库存</td>
				<td colspan="2">操作</td>
			</tr>
			<c:forEach items="${book}" var="book">
				<tr>
					<td>${book.bookname}</td>
					<td>${book.price}</td>
					<td>${book.author}</td>
					<td>${book.sale}</td>
					<td>${book.stock}</td>
					<td><a href="${pageContext.request.contextPath}/UI/book_updateUI?bid=${book.bid}">修改</a></td>
					<td><input id="${book.bid}" type="button" class="btn del" value="删除"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div id="bottom">
		<span>
			中公书城.Copyright &copy;2019
		</span>
	</div>
	<script type="text/javascript">
		$(".del").click(function(){
			var id = this.id;
			console.log(id);
			if(confirm("是否删除?")){
				window.location.href="${pageContext.request.contextPath}/book/delete?bid="+id;
			}
		});
	</script>
</body>
</html>