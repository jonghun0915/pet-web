<%@page import="sjhtest.Condb"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 정보 수정</title>
</head>
<body>
<script type="text/javascript" src="pcheck.js"></script>
<jsp:include page="header.jsp"/>
<section style=" position:fixed;top:60px; width:100%; height:100%;
background-color:lightgray">
<h2 style="text-align:center">펫 정보 수정 </h2> <br>
<form method="post" action="p_action.jsp" style="display:flex;align-items:center;
justify-content:center;text-align:center">
<input type ="hidden" name="mode" value="modify">
<table border=1>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement st = null;
String mod_pnum=request.getParameter("mod_pnum");
String pname="";
String kinds="";
String disease="";
String detail="";
String degree="";
String owner="";
String hp="";
try {
	conn= Condb.getConnection();//DB 연결
	st = conn.createStatement();
	String sql="select * from sjhpet where pnum= "
			+ mod_pnum;
	ResultSet rs= st.executeQuery(sql);
	rs.next();
	//위의 SQL문을 실행하면 1개의 레코드셋을 불러온다.
	mod_pnum=rs.getString("pnum");
	pname=rs.getString("pname");
	kinds=rs.getString("kinds");
	disease=rs.getString("disease");
	detail=rs.getString("detail");
	degree=rs.getString("degree");
	owner=rs.getString("owner");
	hp=rs.getString("hp");
}
catch (Exception e){
	e.printStackTrace();
}
%>	
<tr><td>펫 번호</td>
<td><input type="text" name="pnum" value="<%=mod_pnum %>"
readonly ></td></tr>
<tr><td>펫 이름</td>
<td><input type="text" name="pname" value="<%=pname %>"></td></tr>
<tr><td>종 류</td>
<td><input type="text" name="kinds" value="<%=kinds %>"></td></tr>
<tr><td>질환종류</td>
<td><input type="text" name="disease" value="<%=disease %>"></td></tr>
<tr><td>상세증상</td>
<td><input type="text" name="detail" value="<%=detail %>"></td></tr>
<tr><td>증상정도</td>
<td><input type="text" name="degree" value="<%=degree %>"></td></tr>
<tr><td>주인이름</td>
<td><input type="text" name="owner" value="<%=owner %>"></td></tr>
<tr><td>연락처</td>
<td><input type="text" name="hp" value="<%=hp %>"></td></tr>
<tr><td colspan=2><input type="submit" value="수정" onclick="return modify()">
<input type="button" value="조회" onclick="return search()"></td>
</tr>
</table>
</form>
</section>


<jsp:include page="footer.jsp"/>
</body>
</html>
