<%@page import="java.sql.*"%>

<%@page import="sjhtest.Condb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약품추가, 수정</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
Connection conn=null;
Statement st=null;
String mode= request.getParameter("mode");
String dnum= request.getParameter("dnum");
String dname= request.getParameter("dname");
String dkind= request.getParameter("dkind");
String detail= request.getParameter("detail");
String maker= request.getParameter("maker");
String dprice= request.getParameter("dprice");
String dstock= request.getParameter("dstock");
try {
	conn= Condb.getConnection();
	st = conn.createStatement();
	String sql="";
	switch (mode){
	case "insert":
	 sql="insert into sjhdrug values ("+ dnum +"," + 
	         "'"+ dname +"',"+
	    	 "'"+ dkind + "',"+
	         "'"+ detail + "',"+
	         "'"+ maker +"',"+
	         dprice + ","+
     		 dstock + ")";
		st.executeUpdate(sql);
		
	
	%>
	
	<jsp:forward page="d_join.jsp"></jsp:forward>
	<%	
	break;
	case "modify":
		sql="update sjhdrug set "+
		"dname = '"+ dname +"',"+ 
		"dkind = '"+ dkind +"',"+
		"detail = '"+ detail +"',"+
		"maker = '"+ maker +"',"+
		"dprice = "+ dprice +","+
		"dstock = "+ dstock +" " +
		"where dnum =" + dnum;
		st.executeUpdate(sql);
		%>
		
		<jsp:forward page="d_list.jsp"></jsp:forward>	
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