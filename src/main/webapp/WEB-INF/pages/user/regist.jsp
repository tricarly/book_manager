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
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
<style type="text/css">
	.login_form{
		height:420px;
		margin-top: 25px;
	}
	
</style>
</head>
<body>
		<div id="login_header">
			<img class="logo_img" alt="" src="${pageContext.request.contextPath}/static/img/logo.gif" >
		</div>
		
			<div class="login_banner">
			
				<div id="l_content">
					<span class="login_word">欢迎注册</span>
				</div>
				
				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>注册中公会员</h1>
								<span class="errorMsg" id="errorMsg"></span>
							</div>
							<div class="form">
								<form action="${pageContext.request.contextPath}/user/regist" method="post">
									<label>用户名称：</label>
									<input class="itxt" type="text" placeholder="请输入用户名" autocomplete="off" tabindex="1" name="username" id="username" />
									<br />
									<br />
									<label>用户密码：</label>
									<input class="itxt" type="password" placeholder="请输入密码" autocomplete="off" tabindex="1" name="password" id="password" />
									<br />
									<br />
									<label>确认密码：</label>
									<input class="itxt" type="password" placeholder="确认密码" autocomplete="off" tabindex="1" name="repwd" id="repwd" />
									<br />
									<br />
									<label>电子邮件：</label>
									<input class="itxt" type="text" placeholder="请输入邮箱地址" autocomplete="off" tabindex="1" name="email" id="email" />
									<br />
									<br />
									<label>验证码：</label>
									<input class="itxt" type="text" style="width: 150px;" id="code"/>
									<img alt="" src="${pageContext.request.contextPath}/user/authImage" style="float: right; margin-right: 10px" onclick="this.src=this.src+'?'">
									<br />
									<br />
									<input type="button" value="注册" id="sub_btn" />
									
								</form>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		<div id="bottom">
			<span>
				中公书城.Copyright &copy;2019
			</span>
		</div>
<script type="text/javascript">
	$("#username").blur(function (){
		var username=$("#username").val();
		if ($.trim(username).length==0){
			$("#errorMsg").html("用户名不能为空！");
			$("#username").focus();
			return ;
		}
		$.ajax({
			url:"${pageContext.request.contextPath}/user/checkUserName",
			type:"POST",
			dataType:"JSON",
			data:{
				"username":username
			},
			success:function (map){
				if (map.obj){
					$("#errorMsg").html("该用户名可以使用！").css("color","green");
				}else {
					$("#errorMsg").html("用户名已被注册！").css("color","red");
					return ;
				}
			}
		})
	})

	$("#password").blur(function (){
		var password=$("#password").val();
		if ($.trim(password).length==0){
			$("#errorMsg").html("密码不能为空！").css("color","red");
		}else {
            $("#errorMsg").html("");
            return ;
        }
	})

	$("#repwd").blur(function (){
		var password=$("#password").val();
		var repwd=$("#repwd").val();
		if ($.trim(repwd).length==0){
			$("#errorMsg").html("确认密码不能为空！").css("color","red");
		}
		if (password!=repwd){
			$("#errorMsg").html("两次输入密码不一致！").css("color","red");
			return ;
		}else {
            $("#errorMsg").html("");
            return ;
        }
	})

	$("#email").blur(function(){
		var email=$("#email").val();
		if($.trim(email).length==0){
			$("#errorMsg").html("邮箱不能为空！").css("color","red");
			$("#email").focus();
			return;
		}
		var reg=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		if(!reg.test(email)){
			$("#errorMsg").html("邮箱格式不正确！").css("color","red");
			$("#email").focus();
			return;
		}
		$.ajax({
			url:"${pageContext.request.contextPath }/user/checkEmail",
			type:"POST",
			dataType:"JSON",
			data:{
				"email":email
			},
			success:function(map){
				console.log(map);
				if(map.obj){
					$("#errorMsg").html("邮箱可以使用！").css("color","green");
				}else{
					$("#errorMsg").html("该邮箱已经被注册！").css("color","red");
					$("#email").focus();
					return;
				}
			}
		})
	})

	$("#code").blur(function (){
		var code=$("#code").val();
		if ($.trim(code).length==0){
			$("#errorMsg").html("验证码不能为空！").css("color","red");
			return ;
		}
	})

	$("#sub_btn").click(function (){
		var username=$("#username").val();
		var password=$("#password").val();
		var repwd=$("#repwd").val();
		var email=$("#email").val();
		var code=$("#code").val();
		if ($.trim(username).length==0){
			$("#errorMsg").html("密码不能为空！");
			$("#password").focus();
			return ;
		}
		if ($.trim(password).length==0){
			$("#errorMsg").html("密码不能为空！");
			$("#password").focus();
			return ;
		}
		if ($.trim(repwd).length==0){
			$("#errorMsg").html("确认密码不能为空！");
			$("#repwd").focus();
			return ;
		}
		if (password!=repwd){
			$("#errorMsg").html("两次输入密码不一致！");
			$("#repwd").focus();
			return ;
		}
		if ($.trim(email).length==0){
			$("#errorMsg").html("邮箱不能为空！");
			$("#email").focus();
			return ;
		}
		if ($.trim(code).length==0){
			$("#errorMsg").html("验证码不能为空！");
			$("#code").focus();
			return ;
		}
		$.ajax({
			url:"${pageContext.request.contextPath }/user/checkCode",
			type:"POST",
			dataType:"JSON",
			data:{
				"code":code
			},
			success:function(map){
				console.log(map);
				if(map.obj){
					$("form").submit();
				}else{
					$("#errorMsg").html("验证码输入错误！").css("color","red");
					return;
				}
			}
		})
	})
</script>
</body>
</html>