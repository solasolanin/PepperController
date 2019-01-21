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
    			</h2>
    		</div>
    	</div>
    	<div class="row">
   		 <%--I/O --%>
    		<div class="col-md-12">
	    		<h2 class="subtitle">I/O</h2>
    			<input type="button" value="Wake up" class="cmdBtn" style="margin-top:10px">
            	<input type="button" value="Rest" class="cmdBtn" style="margin-top:10px;margin-left:20px;">
            	<input type="button" value="autonomous/ON" class="cmdBtn" style="margin-top:10px;margin-left:20px;">
                <input type="button" value="autonomous/OFF" class="cmdBtn" style="margin-top:10px;margin-left:20px;">
    		</div>
    	</div>
		<hr width="1" size="500">
		<%--Speech --%>
		<h2 class="subtitle">発話</h2>
        <div class="row">
        	<div class="col-md-10">
            <input type="text" class="words-box" placeholder="Imput some words">
            <input type="button" value="発話" class ="cmdBtn" style="margin-left: 10px">
        	</div>
        </div>
        <br>
        <div class="row">
        	<div class="col-md-10">
            <input type="text" class="words-box" placeholder="Imput some words">
            <input type="button" value="モーション発話" class ="cmdBtn" style="margin-left: 10px">
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
            <div class="row">
            	<h2 class="subtitle">Behavior</h2>
                	<input type="button" class="cmdBtn" value="command1" name="cmd5" style="margin-top:10px">
                    <input type="button" class="cmdBtn" value="command2" name="cmd6" style="margin-top:10px;margin-left:20px;">
            </div>
        </div>
        </div>

    </div>
	</c:param>
</c:import>