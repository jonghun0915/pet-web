<%@page import="java.sql.*"%>
<%@page import="sjhtest.Condb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫추가, 수정</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
Connection conn=null;
Statement st=null;
String mode= request.getParameter("mode");
//request.getParameter(이페이지로 넘어오기전에 해당 컴포넌트의 value)의 값을 변수에 저장
String pnum= request.getParameter("pnum");
String pname= request.getParameter("pname");
String kinds= request.getParameter("kinds");
String disease= request.getParameter("disease");
String detail= request.getParameter("detail");
String degree= request.getParameter("degree");
String owner= request.getParameter("owner");
String hp= request.getParameter("hp");
//request.getParameter는 외부파일로 부터 데이터를 불러오는 것
try {
	conn= Condb.getConnection();//DB 연결
	st = conn.createStatement();
	String sql="";
	switch (mode){
	case "insert":
	 sql="insert into sjhpet values ("+ pnum +"," + 
	         "'"+ pname +"',"+
	         "'"+ kinds+"',"+
	         "'"+ disease + "',"+
	         "'"+ detail + "',"+
	         "'" +degree+"',"+
	         "'" +owner+"',"+
	         "'" +hp+"')";
	         
		st.executeUpdate(sql);
	%>
	<jsp:forward page="p_join.jsp"></jsp:forward>
	<%	
	break;
	case "modify":
		
		sql="update sjhpet set "+
		"pname = '"+ pname +"',"+ 
		"kinds = '"+ kinds +"',"+ 
		"disease = '"+ disease +"',"+
		"detail = '"+ detail +"',"+
		"degree = '"+ degree +"',"+
		"owner = '"+ owner +"', "+
		"hp = '"+ hp +"' "+
		"where pnum =" + pnum;
		st.executeUpdate(sql);
		%>
		<jsp:forward page="p_list.jsp"></jsp:forward>
		<%		
		break;
		
	}
	
}
catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>