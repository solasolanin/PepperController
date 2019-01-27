<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ワークスペース</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/style/css/main.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/style/css/workSpace.css" rel="stylesheet">

<%--qimessaging.jsの取得 --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/qimessaging/1.0/qimessaging.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/qimessaging/1.0/jquery.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/control.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/window.js"></script>
<script>
function startCommand(){
	connect('<c:out value="${sessionScope.pepperIpAddress}"/>');
	<c:forEach items="${sessionScope.cmdList }" var="command">
	setTimeout=(<c:out value="${pageScope.command.cmdOnClick}"/>,1000)
	</c:forEach>
}
</script>

</head>
<body>
	<div class="modal_wrap">
		<input id="trigger_delete" type="checkbox">
   		<div class="modal_overlay">
        	<label for="trigger_delete" class="modal_trigger"></label>
       		<div class="modal_content">
           		<label for="trigger_delete" class="close_button">✖️</label>
       			<form action="deleteCmd" method="post">
           			<h2><span class="glyphicon glyphicon-warning-sign" aria-hidden="true" style="color: red"></span>ワークスペースを空にします</h2>
					<p>一度空にすると元には戻せません。よろしいですか？</p>
           			<div class="pull-right">
            			<button type="submit" class="btn btn-danger">削除</button>
       				</div>
       			</form>
   			</div>
    	</div>
    </div>
	<div class="container">
		<div class="row">
			<div class="col-xs-2 col-xs-offset-4">
				<input type="button" id="square_btn"  name="startBtn" value="スタート" onclick="startCommand()">
			</div>
			<div class="col-xs-offset-2 col-xs-4">
				<label for="trigger_delete" class="btn btn-danger"><span class="glyphicon glyphicon-remove-circle" aria-hidden="true" style="color: white;margin: 3px;"></span>削除</label>
			</div>
		</div>
		<br>
		<br>
		<c:forEach items="${sessionScope.cmdList }" var="command" varStatus="cmdStatus">
			<div class="row">
			<form action="remove" method="post">
					<button type="submit" class="pull-right" style="border:0px;background-color:transparent;cursor:pointer;">
						<span class="glyphicon glyphicon-remove-sign" style="margin-left: 30px"></span>
					</button>
					<input type="button" class="center-block <c:out value="${pageScope.command.cmdClass }"/> " value='<c:out value="${pageScope.command.userDefinedName }"/>' onclick="<c:out value="${pageScope.command.cmdOnClick}"/>">
					<input type="hidden" name="listIndex" value='<c:out value="${pageScope.cmdStatus.index }"/>'>
			</form>
			</div>
			<br>
			<br>
		</c:forEach>
	</div>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>