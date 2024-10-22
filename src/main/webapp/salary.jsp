<%@page import="sjhtest.Condb"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출조회 페이지</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section style=" position:fixed;top:60px; width:100%; height:100%;
background-color:lightgray">
<h2 style="text-align:center">회원매출조회 </h2> <br>
<form style="display:flex;align-items:center;
justify-content:center;text-align:center">
<table border=1>
<tr><td>판매번호</td>
<td>펫번호</td><td>펫이름 </td>
<td>약품명</td><td>가 격 </td><td>판매수량 </td>
<td>매출합계 </td>
</tr>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement st = null;
String grade="";
try {
	conn= Condb.getConnection();//DB 연결
	st = conn.createStatement();
	//SQL 실행하기 위한 변수 생성
	String sql="select snum,pnum,pname,dname,dprice,amount "+
	"from sjhsales order by snum";
	ResultSet rs= st.executeQuery(sql);
	//st를 통해서 sql 실행결과를 받아옴
	
	while(rs.next()){
		int a= rs.getInt("dprice");
		int b= rs.getInt("amount");
		int total = a*b;
%>
<tr>
<td><%=rs.getString("snum") %> </td>
<td><%=rs.getString("pnum") %> </td>
<td><%=rs.getString("pname") %> </td>
<td><%=rs.getString("dname") %> </td>
<td><%=rs.getString("dprice") %> </td>
<td><%=rs.getString("amount") %> </td>
<td><%=total %></td>
 </tr>
 <%
 }
	
	}
	catch(Exception e){
	e.printStackTrace();
}
%>
</table>
</form>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>