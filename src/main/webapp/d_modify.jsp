<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sjhtest.Condb"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약품정보 수정</title>
</head>
<body>
<script type="text/javascript" src="dcheck.js"></script>
<jsp:include page="header.jsp"/>
<section style=" position:fixed;top:60px; width:100%; height:100%;
background-color:lightgray">
<h2 style="text-align:center">펫 약품 정보 수정 </h2> <br>
<form method="post" action="d_action.jsp" style="display:flex;align-items:center;
justify-content:center;text-align:center">
<input type ="hidden" name="mode" value="modify">
<table border=1>
<%
request.setCharacterEncoding("UTF-8"); 
Connection conn = null;
Statement st = null;
String mod_dnum=request.getParameter("mod_dnum");
String dname="";
String dkind="";
String detail="";
String maker="";
String dprice="";
String dstock="";
try {
	conn= Condb.getConnection();
	st = conn.createStatement();
	String sql="select * from sjhdrug where dnum= "
			+ mod_dnum;
	ResultSet rs= st.executeQuery(sql);
	rs.next();
	mod_dnum=rs.getString("dnum");
	// 조건에 맞는 도서번호의 필드에 저장된 값을 불러와서 변수에 저장
	dname=rs.getString("dname");
	dkind=rs.getString("dkind");
	detail=rs.getString("detail");
	maker=rs.getString("maker");
	dprice=rs.getString("dprice");
	dstock=rs.getString("dstock");
}
catch (Exception e){
	e.printStackTrace();
}
%>	
<tr><td>약품번호</td>
<td><input type="text" name="dnum" value="<%=mod_dnum %>" ></td></tr>
<tr><td>약이름</td>
<td><input type="text" name="dname" value="<%=dname %>"></td></tr>
<tr><td>약종류</td>
<td><input type="text" name="dkind" value="<%=dkind %>"></td></tr>
<tr><td>약의 효과</td>
<td><input type="text" name="detail" value="<%=detail %>"></td></tr>
<tr><td>제조회사</td>
<td><input type="text" name="maker" value="<%=maker%>"></td></tr>
<tr><td>가  격</td>
<td><input type="text" name="dprice" value="<%=dprice %>"></td></tr>
<tr><td>재  고</td>
<td><input type="text" name="dstock" value="<%=dstock %>"></td></tr>
<tr><td colspan=2>
<input type="submit" value="수정" onclick="return modify()">
<input type="button" value="조회" onclick="return search()"></td>
</tr>
</table>
</form>
</section>


<jsp:include page="footer.jsp"/>
</body>
</html>