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