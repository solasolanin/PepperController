<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/layout.jsp" charEncoding="UTF-8">
	<c:param name="title">Pepperコントローラ</c:param>
	<c:param name="content">
      <!-- /.container -->
    <br />
    <div class="container-fluid" style="background-color: #e0e0e0">
    	<div class="row">
    	<%--Connection --%>
    		<div class="col-md-6">
	    		<h2 class="subtitle">Pepperに接続
    			<input type="button" value="接続" class="cmdBtn cmd_connect" data-toggle="modal" data-target="#sampleModal" style="margin-top:10px">
    			<a onclick="connect('<c:out value="${sessionScope.pepperIpAddress}"/>')">接続</a>
    			<input type="hidden" id="pepperIP" value="192.168.100.122"/>
    			</h2>
    		</div>
    	</div>
    	<div class="row">
   		 <%--I/O --%>
    		<div class="col-md-12">
	    		<h2 class="subtitle">I/O</h2>
    			<input type="button" value="Wake up" class="cmdBtn" onclick="sleepSwitch(true)" style="margin-top:10px">
            	<input type="button" value="Rest" class="cmdBtn" onclick="sleepSwitch(false)" style="margin-top:10px;margin-left:20px;">
            	<input type="button" value="autonomous/ON" class="cmdBtn" onclick="autonomousSwitch(true)" style="margin-top:10px;margin-left:20px;">
                <input type="button" value="autonomous/OFF" class="cmdBtn" onclick="autonomousSwitch(false)" style="margin-top:10px;margin-left:20px;">
    		</div>
    	</div>
		<hr width="1" size="500">
		<%--Speech --%>
		<h2 class="subtitle">発話</h2>
        <div class="row">
        	<div class="col-md-10">
            <input type="text" class="words-box" id="sayText" placeholder="Imput some words">
            <input type="button" value="発話" class ="cmdBtn" style="margin-left: 10px" onclick="say()">
        	</div>
        </div>
        <br>
        <div class="row">
        	<div class="col-md-10">
            <input type="text" class="words-box" id="animatedSayText" placeholder="Imput some words">
            <input type="button" value="モーション発話" class ="cmdBtn" style="margin-left: 10px" onclick="animatedSay()">
        	</div>
        </div>
		<%--Move--%>
		<div class="row">
            <div class="col-md-6">
                <h2 class="subtitle">移動</h2>
                    <img src="${pageContext.request.contextPath}/img/arrow.png" id="advance" /><br />
                    <img src="${pageContext.request.contextPath}/img/arrow.png" id="left" />
                    <img src="${pageContext.request.contextPath}/img/arrow.png" id="right" /><br />
                    <img src="${pageContext.request.contextPath}/img/arrow2.png" id="turnL" />
                    <img src="${pageContext.request.contextPath}/img/arrow.png" id="retreat" />
                    <img src="${pageContext.request.contextPath}/img/arrow2.png" id="turnR" />
            </div>
			<div class="col-md-6">
            	<h2 class="subtitle">Motion</h2>
	            <div class="row">
                	<input type="button" class="cmdBtn" value="拍手" name="cmd5" onclick="pAction(1)" style="margin-top:10px">
                    <input type="button" class="cmdBtn" value="うなずき" name="cmd6" onclick="pAction(4)" style="margin-top:10px;margin-left:20px;">
                    <input type="button" class="cmdBtn" value="ガッツポーズ" name="cmd6" onclick="pAction(3)" style="margin-top:10px;margin-left:20px;">
    	        </div>
    	        <div class="row">
    	        	<input type="button" class="cmdBtn" value="がっかり" name="cmd6" onclick="nAction(1)" style="margin-top:10px">
					<input type="button" class="cmdBtn" value="よくわからない" name="cmd6" onclick="nAction(4)" style="margin-top:10px;margin-left:20px;">
					<input type="button" class="cmdBtn" value="腕組み" name="cmd6" onclick="nAction(5)" style="margin-top:10px;margin-left:20px;">
    	        </div>
			</div>
        </div>

    </div>
	</c:param>
</c:import>