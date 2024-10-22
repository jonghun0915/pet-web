function joinCheck(){
	if (document.p_frm.pname.value.length==0){
	alert("펫 이름이 입력되지 않았습니다.");
	p_frm.pname.focus();
	return false;	
	}
	
	if (document.p_frm.detail.value.length==0){
	alert("펫 상세증상이 입력되지 않았습니다.");
	p_frm.detail.focus();
	return false;	
	}
	
	if (document.p_frm.owner.value.length==0){
	alert("주인 이름이 입력되지 않았습니다.");
	p_frm.owner.focus();
	return false;	
	}
	
	if (document.p_frm.hp.value.length==0){
	alert("연락처가 입력되지 않았습니다.");
	p_frm.hp.focus();
	return false;	
	}
	
	success();
	return true;
}
function success(){
	alert("회원등록이 완료되었습니다.");	
}

function search(){
window.location	="p_list.jsp";
}

function modify(){
	alert("회원정보 수정이 완료되었습니다.");	
	}