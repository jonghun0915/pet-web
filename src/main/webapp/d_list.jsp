<%@page import="sjhtest.Condb"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약품목록조회</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section style=" position:fixed;top:60px; width:100%; height:100%;
background-color:lightgray">
<h2 style="text-align:center">약품목록 조회/수정 </h2> <br>
<form style="display:flex;align-items:center;
justify-content:center;text-align:center">
<table border=1>
<tr><td>약품번호 </td><td>약이름 </td>
	<td>약종류 </td><td>약의효과 </td>
	<td>제조회사 </td>
    <td>가   격</td><td>재   고 </td>
    </tr>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement st = null;
String grade="";
try {
	conn = Condb.getConnection();
	st = conn.createStatement();
	String sql="select * from sjhdrug order by dnum";
	ResultSet rs= st.executeQuery(sql);
	while (rs.next()){
	%>
<tr>
<td><a href="d_modify.jsp?mod_dnum=<%=rs.getString("dnum") %>"><%=rs.getString("dnum") %></a></td>
<td><%=rs.getString("dname") %>  </td>
<td><%=rs.getString("dkind") %>  </td>
<td><%=rs.getString("detail") %>  </td>
<td><%=rs.getString("maker") %>  </td>
<td><%=rs.getString("dprice") %>  </td>
<td><%=rs.getString("dstock") %>  </td>
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