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
<h2 style="text-align:center">판매목록 조회/수정 </h2> <br>
<form style="display:flex;align-items:center;
justify-content:center;text-align:center">
<table border=1>
<tr>
    <td>판매번호</td>
    <td>펫번호</td>
    <td>펫이름</td>
    <td>약품번호</td>
    <td>약이름</td>
    <td>가격</td>
    <td>재고</td>
    <td>판매수량</td>
</tr>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement st = null;
try {
    conn = Condb.getConnection();
    st = conn.createStatement();
    String sql="select * from sjhsales order by snum";
    ResultSet rs= st.executeQuery(sql);
    while (rs.next()){
        String mod_snum = rs.getString("snum");
        String pnum = rs.getString("pnum");
        String pname = rs.getString("pname");
        String dnum = rs.getString("dnum");
        String dname = rs.getString("dname");
        String dprice = rs.getString("dprice");
        String dstock = rs.getString("dstock");
        String amount = rs.getString("amount");
    %>
    <tr>
        <td><a href="s_modify.jsp?mod_snum=<%=mod_snum %>"><%=mod_snum %></a></td>
        <td><%=pnum %></td>
        <td><%=pname %></td>
        <td><%=dnum %></td>
        <td><%=dname %></td>
        <td><%=dprice %></td>
        <td><%=dstock %></td>
        <td><%=amount %></td>
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
