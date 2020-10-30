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
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
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
			<form action="${pageContext.request.contextPath}/book/add" method="post" enctype="multipart/form-data">
				<span id="errorMsg" ></span>
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
						<td><input name="bookname" type="text" id="bookname"/></td>
						<td><input name="price" type="text" id="price"/></td>
						<td><input name="author" type="text" id="author"/></td>
						<td><input name="sale" type="text" id="sale"/></td>
						<td><input name="stock" type="text" id="stock"/></td>
						<td><input name="file" type="file"id="file"/></td>
						<td><input type="button" value="提交" id="btn"/></td>
					</tr>		
				</table>
			</form>
			
	
		</div>
		
		<div id="bottom">
			<span>
				中公书城.Copyright &copy;2019
			</span>
		</div>

		<script type="text/javascript">
			$("#bookname").blur(function(){
				var bookname=$("#bookname").val();
				$.ajax({
					url:"${pageContext.request.contextPath}/book/checkBookName",
					type:"POST",
					dataType:"JSON",
					data:{
						"bookname":bookname
					},
					success:function (map){
						console.log(map);
						if(map.obj){
							$("#errorMsg").html("名称可以使用！").css("color","green");
						}else{
							$("#errorMsg").html("库中已有此书！").css("color","red");
							return;
						}
					}
				})
			})

			$("#btn").click(function (){
				var bookname=$("#bookname").val();
				var price=$("#price").val();
				var author=$("#author").val();
				var sale=$("#sale").val();
                var stock=$("#stock").val();
                var file=$("#file").val();
				if ($.trim(bookname).length==0){
					$("#errorMsg").html("书名不能为空！").css("color","red");
					$("#password").focus();
					return ;
				}
                if ($.trim(price).length==0){
                    $("#errorMsg").html("价格不能为空！").css("color","red");
                    $("#price").focus();
                    return ;
                }
                if ($.trim(author).length==0){
                    $("#errorMsg").html("作者不能为空！").css("color","red");
                    $("#author").focus();
                    return ;
                }
                if ($.trim(sale).length==0){
                    $("#errorMsg").html("销量不能为空！").css("color","red");
                    $("#sale").focus();
                    return ;
                }
                if ($.trim(stock).length==0){
                    $("#errorMsg").html("库存不能为空！").css("color","red");
                    $("#stock").focus();
                    return ;
                }
                if ($.trim(file).length==0){
                    $("#errorMsg").html("封面不能为空！").css("color","red");
                    $("#file").focus();
                    return ;
                }
				$("form").submit();
			})

		</script>
</body>
</html>