<%@page import="sjhtest.Condb"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫목록조회</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section style=" position:fixed;top:60px; width:100%; height:100%;
background-color:lightgray">
<h2 style="text-align:center">펫목록 조회/수정 </h2> <br>
<form style="display:flex;align-items:center;
justify-content:center;text-align:center">
<table border=1>
<tr><td>펫번호 </td><td>펫 이름 </td>
    <td>종류 </td><td>질환종류 </td>
    <td>상세증상 </td><td>증상정도 </td>
    <td>주인이름 </td><td>고객등급</td>
    </tr>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement st = null;
try {
	conn = Condb.getConnection();
	st = conn.createStatement();
	String sql="select * from sjhpet order by pnum";
	//회원번호 오름차순으로 모든 필드값을 불러온다. 
	ResultSet rs= st.executeQuery(sql);
	while (rs.next()){
	%>
<tr>
<td><a href="p_modify.jsp?mod_pnum=<%=rs.getString("pnum") %>"><%=rs.getString("pnum") %></a></td>
<td><%=rs.getString("pname") %>  </td>
<td><%=rs.getString("kinds") %>  </td>
<td><%=rs.getString("disease") %>  </td>
<td><%=rs.getString("detail") %>  </td>
<td><%=rs.getString("degree") %>  </td>
<td><%=rs.getString("owner") %>  </td>
<td><%=rs.getString("hp") %>  </td>
</tr>
<% 
   } 
}
catch (Exception e){
	e.printStackTrace();
}
%>
</table>
</form>

</section>



<jsp:include page="footer.jsp"/>
</body>
</html>