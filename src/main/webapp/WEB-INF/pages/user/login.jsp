<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>中公会员登录页面</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" >
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
</head>
<body>
		<div id="login_header">
			<img class="logo_img" alt="" src="${pageContext.request.contextPath}/static/img/logo.gif" >
		</div>
		
			<div class="login_banner">
			
				<div id="l_content">
					<span class="login_word">欢迎登录</span>
				</div>
				
				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>中公会员</h1>
								<a href="${pageContext.request.contextPath}/UI/registUI">立即注册</a>
							</div>
							<div class="msg_cont">
								<b></b>
								<span class="errorMsg" id="errorMsg">请输入用户名和密码！</span>
							</div>
							<div class="form">
								<form action="${pageContext.request.contextPath}/user/login">
									<label>用户名称：</label>
									<input class="itxt" type="text" placeholder="请输入用户名" autocomplete="off" tabindex="1" name="username" id="username" />
									<br />
									<br />
									<label>用户密码：</label>
									<input class="itxt" type="password" placeholder="请输入密码" autocomplete="off" tabindex="1" name="password" id="password"/>
									<br />
									<br />
									<label>验证码：</label>
									<input class="itxt" type="text" style="width: 150px;" id="code"/>
									<img alt="" src="${pageContext.request.contextPath}/user/authImage" style="float: right; margin-right: 10px" onclick="this.src=this.src+'?'">
									<br />
									<br />
									<input type= "checkbox" name= "flag" value= "123" />&nbsp; &nbsp; &nbsp;自动登录
									<input type="button" value="登录" id="sub_btn" />
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
			$("#errorMsg").html("用户名不能为空！").css("color","red");
			return ;
		}
	})

	$("#password").blur(function (){
		var password=$("#password").val();
		if ($.trim(password).length==0){
			$("#errorMsg").html("密码不能为空！").css("color","red");
			return ;
		}
	})

    $("#code").blur(function (){
        var code=$("#code").val();
        if ($.trim(code).length==0){
            $("#errorMsg").html("验证码不能为空！").css("color","red");
            return ;
        }
    })

    $("#sub_btn").click(function(){
        $("#errorMsg").html("");
        var username=$("#username").val();
        var password=$("#password").val();
        var code=$("#code").val();
        if($.trim(username).length==0){
            $("#errorMsg").html("用户名称不能为空！").css("color","red");
            $("#username").focus();
            return;
        }
        if($.trim(password).length==0){
            $("#errorMsg").html("密码不能为空！").css("color","red");
            $("#password").focus();
            return;
        }
        if($.trim(code).length==0){
            $("#errorMsg").html("验证码不能为空！").css("color","red");
            $("#code").focus();
            return;
        }
        $.ajax({
            url:"${pageContext.request.contextPath }/user/checkCode",
            type:"POST",
            dataType:"JSON",
            data:{
                "code":code
            },
            success:function(map){
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