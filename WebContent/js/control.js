var self = this;


function connect(pepperIp){
	// IPアドレスの取得
	var pepperIp = pepperIp;

	// プロキシの作成
    var setupIns_ = function () {

        self.qims.service("MyApplication").done(function (ins) {
            self.alMyApplication = ins;
            self.alMyApplication.WebSocket = 0;
        });



    	self.qims.service("ALTextToSpeech").done(function(ins){
    		self.alTextToSpeech = ins;
        });
        self.qims.service("ALAnimatedSpeech").done(function(ins){
    		self.alAnimatedSpeech = ins;
        });
        self.qims.service("ALMotion").done(function(ins){
        	self.alMotion = ins;
        });
        self.qims.service("ALBehaviorManager").done(function(ins){
        	self.alBehavior = ins;
        });
    	self.qims.service("ALAutonomousLife").done(function(ins){
    		self.alAutonomousLife = ins;
        });
        self.qims.service("ALAudioDevice").done(function(ins){
            self.alAudioDevice = ins;
            self.alAudioDevice.getOutputVolume().done(function(val){
		    self.showAudioVolume(val);
		    });
        });
        self.qims.service("ALMemory").done(function(ins){
            self.alMemory = ins;
            //ALMemoryの監視
    		qimessagingMemorySubscribe();
        });
    }

	// pepperに接続
	self.qims = new QiSession(pepperIp);
	self.qims.socket()
		// 接続成功したら
		.on('connect', function ()
			{
   	 		self.qims.service("ALTextToSpeech")
   	 			.done(function (tts)
   	 			{
   	 	        	tts.say("接続しました");
   	 	       });
   	 	       		// 接続成功したら初期セットアップを行う
     	       		setupIns_();

     	       		// 接続成功表示切り替え
     	       		$(".connectedState > .connected > .connectedText").text("Connected");
     	       		$(".connectedState > .connected > .glyphicon").removeClass("glyphicon-remove");
     	       		$(".connectedState > .connected > .glyphicon").addClass("glyphicon-signal");
     	       		$(".connectedState > .connected").css("color","Blue");
     	       })
     	// 接続失敗したら
        .on('disconnect', function () {
              self.nowState("切断");
        });
}

// AudioVolume
function showAudioVolume(val){
	$("#pepperVolume").val(val);
}
function changeAudioVolume(){
	var volume = $("#pepperVolume").val();
	volume = Number(volume);
	self.alAudioDevice.setOutputVolume(volume);
	self.test();
}


// TestSpeech
function test(){
	this.alTextToSpeech.say("てすてす");
}

// Speech
function say(){
	var value = $("#sayText").val();
	this.alTextToSpeech.say(value);
}
function say(value){
	this.alTextToSpeech.say(value);
}

// AnimatedSay
function animatedSay(){
	var value = $("#animatedSayText").val();
	this.alAnimatedSpeech.say(value);
}
function animatedSay(value){
	this.alAnimatedSpeech.say(value);
}

// Behaviors
function behavior(num) {
    switch(num){
        case 0:
            self.alBehavior.stopAllBehaviors();
            break;
        case 1:
            //面接【優しいver】起動
            self.alBehavior.runBehavior("type1-10aff6/behavior_1");
            break;
        case 2:
            //次へ
            self.alMemory.raiseEvent("MyApplication/WebSocket", "1.0");
            break;
        case 3:
            //面接【圧迫ver】
            self.alBehavior.runBehavior("type2-b7122a/behavior_1");
            break;
        case 4:
            self.alMemory.raiseEvent("MyApplication/WebSocket", "1.0");
            break;

    }
}

//Positive Voice
function pVoice(num) {
    switch (num){
        case 1:
            self.alMemory.raiseEvent("MyApplication/reply","おかけください");
            break;
        case 2:
            self.alMemory.raiseEvent("MyApplication/reply","失礼しました");
            break;
        case 3:
            self.alMemory.raiseEvent("MyApplication/reply", "なるほど、よくわかりました");
            break;
        case 4:
            self.alMemory.raiseEvent("MyApplication/reply", "それはすっごーいですね")
            break;
        case 5:
            self.alMemory.raiseEvent("MyApplication/reply", "わかりました");
            break;
        case 6:
            self.alMemory.raiseEvent("MyApplication/reply", "そうなのですね");
            break;
        case 7:
            self.alMemory.raiseEvent("MyApplication/reply", "それは、良い経験をしましたね");
            break;
        case 8:
            self.alMemory.raiseEvent("MyApplication/reply", "ふむふむ,とても興味深いです");
            break;
        case 9:
            var value = $("#txtbox_p1").val();
            this.alAnimatedSpeech.say("あなたにとって、"+value+"とはどういうことですか？");
            break;
        case 10:
            var value = $("#txtbox_p2").val();
            this.alAnimatedSpeech.say("何故、"+value+"、をやろうと思ったのですか？");
            break;
        case 11:
            var value = $("#txtbox_p3").val();
            this.alAnimatedSpeech.say(value+"をやってどう思いましたか？");
            break;
        case 12:
            var value = $("#txtbox_p4").val();
            this.alAnimatedSpeech.say(value+"、について、もう少し詳しく教えてください。");
            break;
        case 13:
            var value = $("#txtbox_p5").val();
            this.alAnimatedSpeech.say(value+"、について、あなたはどういう役割でしたか？");
            break;
    }
}

//Negative Voice
function nVoice(num) {
    switch (num) {
        case 1:
            self.alMemory.raiseEvent("MyApplication/reply","おかけください");
            break;
        case 2:
            self.alMemory.raiseEvent("MyApplication/reply","失礼しました");
            break;
        case 3:
            self.alMemory.raiseEvent("MyApplication/reply", "わかりました");
            break;
        case 4:
            self.alMemory.raiseEvent("MyApplication/reply", "なるほど、よくわかりました");
            break;
        case 5:
            self.alMemory.raiseEvent("MyApplication/reply", "うーん");
            break;
        case 6:
            self.alMemory.raiseEvent("MyApplication/reply", "それは何故ですか");
            break;
        case 7:
            self.alMemory.raiseEvent("MyApplication/reply", "それは矛盾していませんか");
            break;
        case 8:
            self.alMemory.raiseEvent("MyApplication/reply", "何故そう思うのですか");
            break;
        case 9:
            self.alMemory.raiseEvent("MyApplication/reply", "少し、イメージしづらいのですが…");
            break;
        case 10:
            self.alMemory.raiseEvent("MyApplication/reply", "それで、全部ですか？");
            break;
        case 11:
            self.alMemory.raiseEvent("MyApplication/reply", "あぁ、そーですか");
            break;
        case 12:
            self.alMemory.raiseEvent("MyApplication/reply", "それは、自分で決めたことですか？");
            break;
        case 13:
            var value = $("#txtbox_n1").val();
            this.alAnimatedSpeech.say("あなたにとって、"+value+"の、定義とは何ですか？");
            break;
        case 14:
            var value = $("#txtbox_n2").val();
            this.alAnimatedSpeech.say("何故、"+value+"、をやろうと思ったのですか？");
            break;
        case 15:
            var value = $("#txtbox_n3").val();
            this.alAnimatedSpeech.say(value+"、について、もう少し具体的に聞かせてください");
            break;
        case 16:
            var value = $("#txtbox_n4").val();
            this.alAnimatedSpeech.say(value+"、について、あなたはどういう役割でしたか？");
            break;
    }
}

//Negative Motion
function nAction(num) {
    switch (num) {
        case 1:
            //Motion【Negative】
            self.alBehavior.runBehavior("animations/Stand/Emotions/Negative/Disappointed_1");
            break;
        case 2:
            self.alBehavior.runBehavior("animations/Stand/Emotions/Negative/Frustrated_1");
            break;
        case 3:
            self.alBehavior.runBehavior("animations/Stand/Emotions/Negative/Late_1");
            break;
        case 4:
            self.alBehavior.runBehavior("animations/Stand/Emotions/Negative/Sorry_1");
            break;
        case 5:
            self.alBehavior.runBehavior("animations/Stand/Emotions/Positive/Proud_3");
            break;
        case 6:
            self.alMemory.raiseEvent("MyApplication/FaceOff", "");
            break;
    }
}

//Positive Motion
function pAction(num) {
    switch (num){
        case 1:
            //Motion【Positive】
            self.alBehavior.runBehavior("animations/Stand/Emotions/Positive/Excited_1");
            break;
        case 2:
            self.alBehavior.runBehavior("animations/Stand/Emotions/Positive/Excited_2");
            break;
        case 3:
            self.alBehavior.runBehavior("animations/Stand/Emotions/Positive/Happy_2");
            break;
        case 4:
            self.alBehavior.runBehavior("animations/Stand/Emotions/Positive/Sure_1");
            break;
        case 5:
            self.alMemory.raiseEvent("MyApplication/FaceOff", "");
            break;
	}
}


function emergency(num){
    switch(num){
        case 1:
            self.alMemory.raiseEvent("MyApplication/Emergency", "2.0");
            break;
        case 2:
            self.alMemory.raiseEvent("MyApplication/Emergency", "3.0");
            break;
        case 3:
            self.alMemory.raiseEvent("MyApplication/Emergency", "4.0");
            break;
        case 4:
            self.alMemory.raiseEvent("MyApplication/Emergency", "5.0");
            break;
        case 5:
            self.alMemory.raiseEvent("MyApplication/Emergency", "6.0");
        case 11:
            self.alMemory.raiseEvent("MyApplication/Emergency", "2.0");
            break;
        case 12:
            self.alMemory.raiseEvent("MyApplication/Emergency", "3.0");
            break;
        case 13:
            self.alMemory.raiseEvent("MyApplication/Emergency", "4.0");
            break;
        case 14:
            self.alMemory.raiseEvent("MyApplication/Emergency", "5.0");
            break;
        case 15:
            self.alMemory.raiseEvent("MyApplication/Emergency", "6.0");
            break;
        case 16:
            self.alMemory.raiseEvent("MyApplication/Emergency", "7.0");
            break;
    }
}

function autonomousSwitch(bl){
	var status;
	if (bl)
	{
		console.log("ON");
		self.alAutonomousLife.getState().done(function(val){console.log(val)});
		self.alAutonomousLife.setState("interactive");

	}else
	{
		console.log("OFF");
		self.alAutonomousLife.getState().done(function(val){console.log(val)});
		self.alAutonomousLife.setState("disabled");
	}
}


function sleepSwitch(bl){
	var status;
	if (bl){
		//on
		self.alMotion.wakeUp();
	}else{
		//off
		self.alMotion.rest();
	}
}


function qimessagingMemorySubscribe(){
	console.log("subscriber!");
	self.alMemory.subscriber("PepperQiMessaging/Reco").done(function(subscriber)
		{
            subscriber.signal.connect(toTabletHandler);
        }
    );
}


