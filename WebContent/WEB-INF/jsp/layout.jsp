<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>${param.title}</title>

<%--qimessaging.jsの取得 --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/qimessaging/1.0/qimessaging.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/qimessaging/1.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/control.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/window.js"></script>
<script type="text/javascript">
$(function(){
	connect('<c:out value="${sessionScope.pepperIpAddress}"/>');
});
</script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/style/css/main.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Merienda" rel="stylesheet">
</head>


<body id="mainBody" style="background-color:#e0e0e0; padding-top: 30px" <c:out value="${requestScope.addingInfo }"/>>
	<nav class="navbar navbar-default navbar-fixed-top" style="background-color:#395475;">
      <div class="container-fluid">
        <div class="navbar-header">
        	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbarEexample1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
        	<a class="navbar-brand" style="color: #ffffff;padding-top: inherit;">
	       	<img src="${pageContext.request.contextPath}/img/pepper_ai.png" style="margin-right: 10px;width: inherit;height: inherit;"/>Remort Pepper Controller
        	</a>
        </div>
        <div class="collapse navbar-collapse" id="navbarEexample1">
			<ul class="nav navbar-nav">
				<li <c:out value ="${controllerMode }"/>><a href="${pageContext.servletContext.contextPath}/pepperCtr/controller" style="color: azure;">リモコンモード</a></li>
				<li <c:out value ="${createMode }"/>><a href="${pageContext.servletContext.contextPath}/pepperCtr/createMode" style="color: azure;">クリエイトモード</a></li>
				<li><a href="#" onclick="openWorkSpace('${pageContext.servletContext.contextPath}/pepperCtr/workSpace')" style="color: azure;">ワークスペース</a></li>
				<li><a><span class="connectedText" style="margin-top: 10px;color: white;">現在の状態：未接続</span></a>
			</ul>
		</div>
      </div>
	</nav>
	<%--modal window --%>
	<div class="modal fade" id="sampleModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span>×</span></button>
				<h4 class="modal-title">PepperのIPアドレス</h4>
			</div>
			<form action="controller" method="post">
			<div class="modal-body" style="background-color: e0e0e0;padding-left: 10px;padding-right: 10px;">
				<input type="text" class="form-control" name="pepperIp" placeholder="192.123.456.789" value='<c:out value="${sessionScope.pepperIpAddress }"/>'>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
				<button type="submit" class="btn btn-primary">接続</button>
			</div>
			</form>
		</div>
	</div>
	</div>
	<section>

	${param.content }
	</section>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>