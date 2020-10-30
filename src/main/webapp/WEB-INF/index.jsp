<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>中公书城首页</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" >
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="${pageContext.request.contextPath}/static/img/logo.gif" >
			<span class="wel_word">网上书城</span>
			<div>
                <c:if test="${username==null }">
                    <a href="${pageContext.request.contextPath}/UI/loginUI">登录</a> |
                    <a href="${pageContext.request.contextPath}/UI/registUI">注册</a> &nbsp;&nbsp;
                </c:if>
                <c:if test="${username!=null }">
                    欢迎&nbsp;
                    <span style="color:red;">
                            ${username }
                    </span>&nbsp;登录商城首页
                    <a href="${pageContext.request.contextPath}/UI/managerUI">后台管理</a>&nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath }/user/logout">注销</a>
                </c:if>
			</div>
	</div>

	<div id="main">
        <div class="book_cond">
            图书名称：<input type="text" id="bookname" name="bookname" value="${bookname}">&nbsp;&nbsp;&nbsp;
            价格：<input type="text" name="min" id="min" value="${min}"> 元 - <input type="text" name="max" id="max" value="${max}"> 元 <button id="search">查询</button>
        </div>
        <div style="text-align: center">
            <span>您的购物车中有3件商品</span>
            <div>
                您刚刚将<span style="color: red">时间简史</span>加入到了购物车中
            </div>
        </div>
        <c:forEach items="${pageInfo.list}" var="book">
            <div class="b_list">
                <div class="img_div">
                    <img class="book_img" alt="" src="/upload/${book.picture}" />
                </div>
                <div class="book_info">
                    <div class="book_name">
                        <span class="sp1">书名:</span>
                        <span class="sp2">${book.bookname}</span>
                    </div>
                    <div class="book_author">
                        <span class="sp1">作者:</span>
                        <span class="sp2">${book.author}</span>
                    </div>
                    <div class="book_price">
                        <span class="sp1">价格:</span>
                        <span class="sp2">￥${book.price}</span>
                    </div>
                    <div class="book_sales">
                        <span class="sp1">销量:</span>
                        <span class="sp2">${book.sale}</span>
                    </div>
                    <div class="book_amount">
                        <span class="sp1">库存:</span>
                        <span class="sp2">${book.stock}</span>
                    </div>
                    <div class="book_add">
                        <button>加入购物车</button>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

        <div id="page_nav">
		<a href="${pageContext.request.contextPath}/book/index?page=1&size=${pageInfo.pageSize}&bookname=${bookname}&min=${min}&max=${max}">首页</a>
		<a href="${pageContext.request.contextPath}/book/index?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}&bookname=${bookname}&min=${min}&max=${max}">上一页</a>
        <!-- 显示页码 -->
        <c:forEach begin="1" end="${pageInfo.pages }" var="num">
        <a href="${pageContext.request.contextPath}/book/index?page=${num}&size=${pageInfo.pageSize}&bookname=${bookname}&min=${min}&max=${max}">${num}</a>
        </c:forEach>
		<a href="${pageContext.request.contextPath}/book/index?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}&bookname=${bookname}&min=${min}&max=${max}">下一页</a>
		<a href="${pageContext.request.contextPath}/book/index?page=${pageInfo.pages}&size=${pageInfo.pageSize}&bookname=${bookname}&min=${min}&max=${max}">末页</a>
		共${pageInfo.pages}页，${pageInfo.total}条记录 到第<input name="pn" id="pn_input"/>页
		<input type="button" value="确定" id="btn">
		</div>
	
	<div id="bottom">
		<span>
			中公书城.Copyright &copy;2019
		</span>
	</div>
    <script type="text/javascript">

        $("#search").click(function(){
            var bookname=$("#bookname").val();
            var min=$("#min").val();
            var max=$("#max").val();
            window.location="${pageContext.request.contextPath }/book/index?bookname="+bookname+"&min="+min+"&max="+max
        })

        $("#btn").click(function(){
            var value=$("#pn_input").val();
            if(isNaN(value)){
                alert("请输入一个整数！");
                return;
            }
            var max="${pageInfo.pages}";
            if(value<1){
                alert("输入的数字不能小于1！");
                return;
            }
            if(value>max){
                alert("输入的数字不能大于最大页码值！");
                return;
            }
            window.location="${pageContext.request.contextPath }/book/index?page="+value+"&bookname=${bookname}&min=${min}&max=${max}";
        })

    </script>

</body>
</html>