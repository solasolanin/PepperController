<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/layout.jsp" charEncoding="UTF-8">
	<c:param name="title">Pepperコントローラ</c:param>
	<c:param name="content">
	<script>
	function openModal(name,refer,class_name,onclick,param){
		document.getElementById("user_defined_name").value =name;
		document.getElementById("cmd_refer").innerHTML =refer;
		if(param != null){
			document.getElementById("param_title").style.visibility ="visible";
			document.getElementById("cmd_param").style.visibility ="visible";
			document.getElementById("cmd_param").value =param;
		}else{
			document.getElementById("param_title").style.visibility ="hidden";
			document.getElementById("cmd_param").style.visibility ="hidden";

		}
		document.getElementById("cmd_name").value =name;
		document.getElementById("cmd_onclick").value =onclick;
		document.getElementById("cmd_class").value =class_name;
	}
	function getTextToSpeech(id){
		return document.getElementById(id).value;
	}
	</script>
	<div class="modal_wrap">
		<input id="trigger" type="checkbox">
	 	<div class="modal_overlay">
 			<label for="trigger" class="modal_trigger"></label>
   			<div class="modal_content">
           		<label for="trigger" class="close_button">✖️</label>
       			<form action="addWSpace" method="post">
           			<p id="cmd_refer"></p>
           			<div class="input-group">
						<span class="input-group-addon">コマンド名</span>
						<input type="text" class="form-control" id="user_defined_name" name="userDefinedName">
					</div>
           			<div class="input-group">
						<span class="input-group-addon" id="param_title" style="visibility: hidden;">パラメータ</span>
						<input type="text" class="form-control" id="cmd_param" name="cmdParam" style="visibility: hidden;">
					</div>
       				<input type="hidden" id="cmd_name" name="cmdName">
       				<input type="hidden" id="cmd_class" name="cmdClass">
           			<input type="hidden" id="cmd_onclick" name="cmdOnClick">
       				<br>
       				<div class="pull-right">
			            <button type="submit" class="btn btn-primary">追加</button>
       				</div>
           		</form>
   			</div>
    	</div>
	</div>
      <!-- /.container -->
    <br />
    <div class="container-fluid">
    	<div class="row">
    	<%--Connection --%>
    		<div class="col-md-6">
	    		<h2 class="subtitle createFont">Pepperに接続
    			<input type="button" value="接続" class="cmdBtn cmd_connect" data-toggle="modal" data-target="#sampleModal" style="margin-top:10px">
	    		</h2>
    		</div>
		</div>
   		 <%--I/O --%>
    	<div class="row">
    		<div class="col-md-12">
	    		<h2 class="subtitle createFont">I/O</h2>
	    		<label for="trigger" class="cmdBtn createTag cmdIO"
	    			onclick="openModal('wake up','Pepperをwake up状態にします。','cmdBtn cmdIO','sleepSwitch(true)',null)">Wake up</label>
	    		<label for="trigger" class="cmdBtn createTag cmdIO"
	    			onclick="openModal('Rest','PepperをRest状態にします。','cmdBtn cmdIO','sleepSwitch(false)',null)">Rest</label>
	    		<label for="trigger" class="cmdBtn createTag cmdIO"
	    			onclick="openModal('autonomous/ON','Pepperをオートノマスライフモード状態にします。','cmdBtn cmdIO','sleepSwitch(false)',null)">autonomous/ON</label>
                <label for="trigger" class="cmdBtn createTag cmdIO"
	       			onclick="openModal('autonomous/OFF','Pepperのオートノマスライフモード状態をオフにします。','cmdBtn cmdIO','sleepSwitch(false)',null)">autonomous/OFF</label>
    		</div>

    	</div>
		<%--Speech --%>
        <h2 class="subtitle createFont">発話</h2>
        <div class="row">
        	<div class="col-md-12">
            <label for="trigger" class ="cmdBtn createTag cmdSpeech"
            	onclick="openModal('speech','テキスト内の文章を発話します。（パラメータ：文章）','cmdBtn cmdSpeech','say()',getTextToSpeech('speechTxt'))">
	            発話
            	<textarea class="words-box" id="speechTxt" placeholder="Imput some words" rows="3" style="resize: none;font-size: 14px;width: 160px;"></textarea>
            </label>
            <label for="trigger" class ="cmdBtn createTag cmdSpeech"
            	onclick="openModal('motionSpeech','テキスト内の文章をモーション付きで発話します。（パラメータ：文章）','cmdBtn cmdSpeech','animatedSay()',getTextToSpeech('motionSpeechTxt'))">
	            モーション発話
            	<textarea class="words-box" id="motionSpeechTxt" placeholder="Imput some words" rows="3" style="resize: none;font-size: 14px;width: 160px;"></textarea>
            </label>
        	</div>
        </div>
        <br>
		<%--Move--%>
		<div class="row">
           	<div class="col-md-12">
				<h2 class="subtitle createFont">移動</h2>
                	<label for="trigger" class="cmdBtn createTag cmdMove"
	    				onclick="openModal('左に移動','左方向に移動します。','cmdBtn cmdMove','moveDirection(0)',null)">
	    				<img src="${pageContext.request.contextPath}/img/arrow.png" width="115px"/></label>
                    <label for="trigger" class="cmdBtn createTag cmdMove"
	    				onclick="openModal('右に移動','右方向に移動します。','cmdBtn cmdMove','moveDirection(1)',null)">
	    				<img src="${pageContext.request.contextPath}/img/arrow.png" style="transform:rotate(180deg);width: 115px" /></label>
	    			<label for="trigger" class="cmdBtn createTag cmdMove"
	    				onclick="openModal('前進','前方に移動します。','cmdBtn cmdMove','moveDirection(2)',null)">
	    				<img src="${pageContext.request.contextPath}/img/arrow.png" style="transform:rotate(90deg);width: 115px" /></label>
	    			<label for="trigger" class="cmdBtn createTag cmdMove"
	    				onclick="openModal('後退','後方に移動します。','cmdBtn cmdMove','moveDirection(3)',null)">
	    				<img src="${pageContext.request.contextPath}/img/arrow.png" style="transform:rotate(-90deg);width: 115px" /></label>
                    <label for="trigger" class="cmdBtn createTag cmdMove"
	    				onclick="openModal('時計回り','時計回りに回転します。','cmdBtn cmdMove','moveDirection(4)',null)">
	    				<img src="${pageContext.request.contextPath}/img/arrow2.png" style="width: 115px" /></label>
	    			<label for="trigger" class="cmdBtn createTag cmdMove"
		    			onclick="openModal('反時計回り','反時計回りに回転します。','cmdBtn cmdMove','moveDirection(5)',null)">
	    				<img src="${pageContext.request.contextPath}/img/arrow2.png" style="transform:rotateY(180deg);width: 115px"/></label>
	    			<label for="trigger" class="cmdBtn createTag cmdMove"
		    			onclick="openModal('停止','移動を停止します。','cmdBtn cmdMove','stopMove()',null)">
	    				停止</label>
           </div>
        </div>
		<div class="row">
			<div class="col-md-12">
	       	<h2 class="subtitle createFont">モーション</h2>
            	<label for="trigger" class="cmdBtn createTag cmdMotion"
	    			onclick="openModal('拍手','モーション”拍手”を実行します。','cmdBtn cmdMotion','pAction(1)',null)">拍手</label>
                <label for="trigger" class="cmdBtn createTag cmdMotion"
	    			onclick="openModal('拍手','モーション”うなずき”を実行します。','cmdBtn cmdMotion','pAction(4)',null)">うなずき</label>
	    		<label for="trigger" class="cmdBtn createTag cmdMotion"
	    			onclick="openModal('拍手','モーション”ガッツポーズ”を実行します。','cmdBtn cmdMotion','pAction(3)',null)">ガッツポーズ</label>
            </div>
            <div class="col-md-12">
            <label for="trigger" class="cmdBtn createTag cmdMotion"
	    			onclick="openModal('がっかり','モーション”がっかり”を実行します。','cmdBtn cmdMotion','nAction(1)',null)">がっかり</label>
            <label for="trigger" class="cmdBtn createTag cmdMotion"
	    			onclick="openModal('わからない','モーション”わからない”を実行します。','cmdBtn cmdMotion','nAction(4)',null)">わからない</label>
            <label for="trigger" class="cmdBtn createTag cmdMotion"
	    			onclick="openModal('腕組み','モーション”腕組み”を実行します。','cmdBtn cmdMotion','nAction(5)',null)">腕組み</label>
            </div>
        </div>
        <br>
        <br>
    </div>
	</c:param>
</c:import>