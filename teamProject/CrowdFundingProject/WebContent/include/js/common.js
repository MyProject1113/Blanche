/* chkSubmit(유효성 체크 대상, 메시지 내용) */
function chkSubmit(v_item, v_name) {
	if (v_item.val().replace(/\s/g, "") == "") {
		alert(v_name + " 입력해 주세요.");
		v_item.val("");
		v_item.focus();
		return false;
	} else {
		return true;
	}
}

/* checkSubmit(유효성 대상, 바이트 길이, 메시지 내용) */
function checkSubmit(item, length, name) {
	item.val(item.val().trim());
	if (item.val().replace(/\s/g, "") == "") {
		alert(name + "을(를) 입력해 주세요.");
		item.val("");
		item.focus();
		return false;
	} else if (length > 0 && stringByteLength(item.val()) > length){
		alert(name + "은(는) " + length + "바이트를 넘을 수 없습니다.");
		item.focus();
		return false;
	} else {
		return true;
	}
}

/* stringByteLength(문자열) */
function stringByteLength(string) {
	return string.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
}

/* checkEmail(유효성 대상) */
function checkEmail(item) {
	// regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	regExp = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
	if (!regExp.test(item.val())) {
		alert("이메일 형식이 맞지 않습니다.\nemail@domain.com 형식으로 입력해야 합니다..");
		item.focus();
		return false;
	} else {
		return true;
	}
}

/* checkPassword(유효성 대상) */
function checkPassword(item) {
	regExp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
	if (!regExp.test(item.val())) {
		alert("패스워드 형식이 맞지 않습니다.\n6자리~20자리의 영문 대소문자로 구성되어야 하며\n최소 1개의 숫자 혹은 특수 문자를 포함해야 합니다.");
		item.focus();
		return false;
	} else {
		return true;
	}
}

/* checkPhone(유효성 대상) */
function checkPhone(item) {
	regExp = /(\d{3}).*(\d{3}).*(\d{4})/;
	if (!regExp.test(item.val())) {
		alert("전화번호 형식이 맞지 않습니다.\n000-0000-0000 형식으로 입력해야 합니다.");
		item.focus();
		return false;
	} else {
		return true;
	}
}

/* getNow() */
function getNow() {
	var nowDate = new Date();
	var year = leadingZero(nowDate.getFullYear(), 4);
	var month = leadingZero((nowDate.getMonth() + 1), 2);
	var date = leadingZero(nowDate.getDate(), 2);
	var hour = leadingZero(nowDate.getHours(), 2);
	var minute = leadingZero(nowDate.getMinutes(), 2);
	var second = leadingZero(nowDate.getSeconds(), 2);
	var now = year + "/" + month + "/" + date + " " + hour + ":" + minute + ":" + second;
	return now;
}

/* leadingZeros(숫자, 자릿수) */
function leadingZero(num, digits) {
	var zero = "";
	num = num.toString();
	if (num.length < digits) {
		for (i = 0; i < digits - num.length; i++) {
			zero += "0";
		}
	}
	return zero + num;
}