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
<script type="text/javascript" src="scheck.js"></script>
<jsp:include page="header.jsp"/>
<section style=" position:fixed;top:60px; width:100%; height:100%;
background-color:lightgray">
<h2 style="text-align:center">펫 약품 정보 수정 </h2> <br>
<form method="post" action="s_action.jsp" style="display:flex;align-items:center;
justify-content:center;text-align:center">
<input type ="hidden" name="mode" value="modify">
<table border=1>
<%
request.setCharacterEncoding("UTF-8"); 
Connection conn = null;
Statement st = null;
String mod_snum=request.getParameter("mod_snum");
String pnum="";
String pname="";
String dnum="";
String dname="";
String dprice="";
String dstock="";
String amount="";
try {
    conn= Condb.getConnection();
    st = conn.createStatement();
    String sql="select * from sjhsales where snum= " + mod_snum;
    ResultSet rs= st.executeQuery(sql);
    if(rs.next()) {
        mod_snum=rs.getString("snum");
        pnum=rs.getString("pnum");
        pname=rs.getString("pname");
        dnum=rs.getString("dnum");
        dname=rs.getString("dname");
        dprice=rs.getString("dprice");
        dstock=rs.getString("dstock");
        amount=rs.getString("amount");
    }
    rs.close();
}
catch (Exception e){
    e.printStackTrace();
}
%>  
<tr><td>판매번호</td>
<td><input type="text" name="snum" value="<%=mod_snum %>" readonly >
</td></tr>
<tr><td>펫번호</td>
<td><input type="text" name="pnum" value="<%=pnum %>" readonly ></td></tr>
<tr><td>펫이름</td>
<td><input type="text" name="pname" value="<%=pname %>" readonly></td></tr>
<tr><td>약품번호</td>
<td><input type="text" name="dnum" value="<%=dnum %>" readonly></td></tr>
<tr><td>약이름</td>
<td><input type="text" name="dname" value="<%=dname %>" readonly></td></tr>
<tr><td>가 격</td>
<td><input type="text" name="dprice" value="<%=dprice%>" readonly></td></tr>
<tr><td>재 고</td>
<td><input type="text" name="dstock" value="<%=dstock %>" readonly></td></tr>
<tr><td>판매수량</td>
<td><input type="text" name="amount" value="<%=amount %>"></td></tr>
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
