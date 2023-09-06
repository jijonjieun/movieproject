$(".login_btn").css("background", "#ddd");

const isSubmit = (function(){
    let idCheck = false;
    let passwordCheck = false;
    let emailCheck = false;
    let nameCheck = false;
    let nicknameCheck = false;


    const setidCheck = function(set){
        idCheck = set ? true : false;
        isSubmit();
    }
    const setpasswordCheck = function(set){
        passwordCheck = set ? true : false;
        isSubmit();
    }
    const setemailCheck = function(set){
        emailCheck = set ? true : false;
        isSubmit();
    }

    const setnameCheck = function(set){
        nameCheck = set ? true : false;
        isSubmit();
    }

    const setnicknameCheck = function(set){
        nicknameCheck = set ? true : false;
        isSubmit();
    }

    const isSubmit = function(){
        if(idCheck && passwordCheck && emailCheck && nameCheck && nicknameCheck) {
            $(".login_btn").css("background", "#1C0065");
            return true;
        } else {
            $(".login_btn").css("background", "#ddd");
            return false;
        }
    }

    return {
        setidCheck : setidCheck,
        setpasswordCheck : setpasswordCheck,
        setemailCheck : setemailCheck,
        setnameCheck : setnameCheck,
        setnicknameCheck : setnicknameCheck,
        isSubmit : isSubmit
    }
})();

function pwdCheck() {
    const password1 = $(".pw").val().replaceAll(" ", "");
    const password2 = $(".pw2").val().replaceAll(" ", "");
    const msgBox = $(".pw2").siblings(".msg_box"); 
    
    if(password1 && password2) {
        if(password1.includes(" ")  || password2.includes(" ")) {
            msgBox.text("비밀번호를 확인해 주세요");
            isSubmit.setpasswordCheck(false);
            return;
        }
        
        if(password1 != password2) {
            msgBox.text("비밀번호를 확인해 주세요");
            isSubmit.setpasswordCheck(false);
        } else {
            msgBox.text("비밀번호가 일치합니다");
            isSubmit.setpasswordCheck(true);
        }
    }
}

$(".id").focusout(function(){
    const id = $(".id").val().replaceAll(" ", "");
    const msgBox = $(this).siblings(".msg_box"); 
    
    if(!id) {
        msgBox.text("아이디를 입력해주세요");
        isSubmit.setidCheck(false);
        return;
    }
    
    if(!idCheck(id)) {
        msgBox.text("사용할수 없는 아이디입니다");
        isSubmit.setidCheck(false);
        return;
    }
    
    const data = {
        value : id,
        valueType : "m_id"
    };
    
    if(overlapCheck(data)) {
        msgBox.text("사용 가능합니다");
        isSubmit.setidCheck(true);
    } else {
        msgBox.text("이미 사용중인 아이디입니다");
        isSubmit.setidCheck(false);
    }
});


function overlapCheck(data) {

	let isUseable = false;
	$.ajax({
		url: "/overlapCheck",
		type: "get",
		data: data,
		async: false
	})
	.done(function(result){
		if(result == 0 ) {
			isUseable = true;
		} 
	})
	.fail(function(){
		alert("에러");
	});
	
	return isUseable;

}


$(".pw").focusout(function() {
    pwdCheck();
});

$(".pw2").focusout(function() {
    pwdCheck();
});

$(".email").focusout(function() {
    const email = $(".email").val();
    const msgBox = $(this).siblings(".msg_box"); 

    if (!email) {
        msgBox.text("이메일을 입력해 주세요");
        isSubmit.setemailCheck(false);
        return;
    }

    if(!emailCheck(email)) {
        msgBox.text("사용 불가능합니다");
        isSubmit.setemailCheck(false);
    } else {
        msgBox.text("이메일은 아이디/비밀번호 찾기에 이용됩니다.");
        isSubmit.setemailCheck(true);
    }
});

$(".name").focusout(function() {
    const name = $(".name").val();
    const msgBox = $(this).siblings(".msg_box"); 

    if (!name) {
        msgBox.text("이름을 입력해 주세요");
        isSubmit.setnameCheck(false);
        return;
    }

    if(!nameCheck(name)) {
        msgBox.text("사용 불가능합니다");
        isSubmit.setnameCheck(false);
    } else {
        msgBox.text("");
        isSubmit.setnameCheck(true);
    }
}); 

 

$(".nickName").focusout(function() {
    const nickname = $(".nickName").val();
    const msgBox = $(this).siblings(".msg_box"); 

    if (!nickname) {
        msgBox.text("닉네임을 입력 해주세요");
        isSubmit.setnicknameCheck(false);
        return;
    }

    if (!nicknameCheck(nickname)) {
        msgBox.text("닉네임은 한글, 영어, 숫자만 4 ~ 10자리로 입력 가능합니다.");
        isSubmit.setnicknameCheck(false);
        return;
    }

    let data = {
        value: nickname,
        valueType : "m_nickname" 
    };
    
    if(!overlapCheck(data)){
        msgBox.text("이미 사용중인 닉네임입니다");
        isSubmit.setnicknameCheck(false);
    } else {
        msgBox.text("사용 가능합니다");
        isSubmit.setnicknameCheck(true);
    }
});