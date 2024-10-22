function joinCheck(){
	if (document.s_frm.amount.value.length==0){
	alert("판매수량이 입력되지 않았습니다.");
	s_frm.amount.focus();
	return false;	
	}
		
	success();
	return true;
}
function success(){
	alert("판매등록이 완료되었습니다.");	
}

function search(){
window.location	="s_list.jsp";
}

function modify(){
	alert("판매정보 수정이 완료되었습니다.");	
	}