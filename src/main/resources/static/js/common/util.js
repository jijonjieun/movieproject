function idCheck(id) {
	const joinid = /^[0-9a-z]{5,15}$/g;
	
	if(joinid.test(id)) {
		return true;
	} else {
		return false;
	}
}
 
function emailCheck(email){
	const joinemail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/g;
	
	if(joinemail.test(email)) {
		return true;
	} else {
		return false;
	}
}

function nameCheck(name) {
	const joinname = /^[A-Za-zㄱ-ㅎㅏ-ㅣ가-힣]{2,30}$/g;
	if (joinname.test(name)) {
		return true;
	} else {
		return false;
	}
}
 
 
 
function nicknameCheck(nickname) {
	const joinNickname = /^[가-힣|a-z|A-Z|0-9|]+$/;
	if (joinNickname.test(nickname)) {
		return true;
	} else {
		return false;
	}
}
 
 
 
function lenthCheck(e, length) {
	if(e.value.length >= length) {
		return false;
	}
	
	$(this).off().focusout(function(){
		if(e.value.length > length) {
			e.value = "";
		}
	})
	
	return true; 
}
