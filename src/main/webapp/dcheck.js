function joinCheck(){
	if (document.d_frm.dname.value.length==0){
	alert("약품명이 입력되지 않았습니다.");
	d_frm.dname.focus();
	return false;	
	}
	
	if (document.d_frm.dkind.value.length==0){
	alert("약종류이 입력되지 않았습니다.");
	d_frm.dkind.focus();
	return false;	
	}
	if (document.d_frm.detail.value.length==0){
	alert("약의 효과가 입력되지 않았습니다.");
	d_frm.detail.focus();
	return false;	
	}
	if (document.d_frm.dprice.value.length==0){
	alert("가격이 입력되지 않았습니다.");
	d_frm.dprice.focus();
	return false;	
	}
	if (document.d_frm.dstock.value.length==0){
	alert("재고가 입력되지 않았습니다.");
	d_frm.dstock.focus();
	return false;	
	}
	success();
	return true;
}
function success(){
	alert("약품등록이 완료되었습니다.");	
}

function search(){
window.location	="d_list.jsp";
}

function modify(){
	alert("약품정보 수정이 완료되었습니다.");	
	}