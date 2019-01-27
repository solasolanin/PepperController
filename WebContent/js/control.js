var self = this;


function connect(ip){
	// IPアドレスの取得
	var pepperIp = ip;
//	var pepperIp =$("#pepperIP").val()
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
		.on('connect', function ()
				// 接続成功したら
			{
   	 		self.qims.service("ALTextToSpeech")
   	 			.done(function (tts)
   	 			{
   	 	        	tts.say("はろー");
   	 	       });
   	 	       		// 接続成功したら初期セットアップを行う
     	       		setupIns_();

     	       		// 接続成功表示切り替え
     	       		$(".navbar-collapse > .navbar-nav > .connectedText").text("接続済");
     	       		$(".connectedState > .connected > .glyphicon").removeClass("glyphicon-remove");
     	       		$(".connectedState > .connected > .glyphicon").addClass("glyphicon-signal");
     	       		$(".connectedState > .connected").css("color","Blue");
     	       })
     	// 接続失敗したら
        .on('disconnect', function () {
              self.nowState("切断");
              alert('接続できません');
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

//Move
function moveDirection(i){
	switch (i) {
	case 0://左に移動
		self.alMotion.moveTo(0, 0.3, 0).fail(function(err){console.log(err);});
		break;
	case 1://右に移動
		self.alMotion.moveTo(0, -0.3, 0).fail(function(err){console.log(err);});
		break;
	case 2://前進
		self.alMotion.moveTo(0.3, 0, 0).fail(function(err){console.log(err);});
		break;
	case 3://後退
		self.alMotion.moveTo(-0.3, 0, 0).fail(function(err){console.log(err);});
		break;
	case 4://時計回り
		self.alMotion.moveTo(0, 0, 1).fail(function(err){console.log(err);});
		break;
	case 5://反時計回り
		self.alMotion.moveTo(0, 0, -1).fail(function(err){console.log(err);});
		break;
	default:
		break;
	}
}
//Stop Moving
function stopMove(){
	self.alMotion.stopMove();
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
        case 1://拍手
            self.alBehavior.runBehavior("animations/Stand/Emotions/Positive/Excited_1");
            break;
        case 2:
            self.alBehavior.runBehavior("animations/Stand/Emotions/Positive/Excited_2");
            break;
        case 3://ガッツポーズ
            self.alBehavior.runBehavior("animations/Stand/Emotions/Positive/Happy_2");
            break;
        case 4://うなずき
            self.alBehavior.runBehavior("animations/Stand/Emotions/Positive/Sure_1");
            break;
        case 5:
            self.alMemory.raiseEvent("MyApplication/FaceOff", "");
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


