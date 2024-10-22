<%@page import="sjhtest.Condb"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매등록</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<section style=" position:fixed;top:60px; width:100%; height:100%;
background-color:lightgray">
<h2 style="text-align:center">판매 등록 </h2> <br>
<form method="post" action="s_action.jsp" name="s_frm" style="display:flex;align-items:center;
justify-content:center;text-align:center">
<input type ="hidden" name="mode" value="insert">
<table border=1>
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement st = null;
String snum="";
try {
	conn= Condb.getConnection();//DB 연결
	st = conn.createStatement();
	//SQL 실행하기 위한 변수 생성
	String sql="select max(snum)+1 snum from sjhsales";
	//sales테이블에서 현재까지의 회원번호 최대값에서 1을 더한 값을 mnum으로 별칭한다.
	ResultSet rs= st.executeQuery(sql);
	//st를 통해서 sql 실행결과를 받아옴 
	rs.next(); //1개의 결과물 출력 
	snum = rs.getString("snum");
	//데이터베이스에서 불러온 값을 변수에 저장
	}
catch(Exception e){
	e.printStackTrace();
}
%>
<script type="text/javascript" src="scheck.js"></script>
<tr><td>판매번호(자동발생)</td>
<td><input type="text" name="snum" value="<%=snum %>" 
readonly></td></tr>

<tr><td>회원정보</td>
<td><select name="pnum">
<% String sql="select pnum,pname from sjhpet order by pname";
//회원테이블에서 회원번호를 조회한다.
ResultSet rs= st.executeQuery(sql);
   while (rs.next()){
	String pnum = rs.getString("pnum"); 
	String pname = rs.getString("pname");
	String sum = pnum +"," + pname;
	//두개의 필드값을 저장한 변수값을 ,을 붙여서 하나의 변수에 저장 
%><option value= <%=sum %>><%=sum %>
  </option>
 <% }
   rs.close(); //새로운 sql문을 실행하기 이전 레코드셋은 종료
   %></select>
</td></tr>
 <tr><td>약품정보 </td>
<td><select name="dnum">
<% sql="select dnum,dname,dkind,detail,maker,dprice,dstock from sjhdrug order by dname";
//books테이블에서 필요한 필드를 조회한다. 재고는 판매수량과 연결하기 위하여 조회
   rs= st.executeQuery(sql);
   while (rs.next()){
	String dnum = rs.getString("dnum");
	String dname = rs.getString("dname");
	String dkind = rs.getString("dkind");
	String detail = rs.getString("detail");
	String maker = rs.getString("maker");
	String dprice = rs.getString("dprice");
	String dstock = rs.getString("dstock");
	String pum = dnum+","+dname+","+dkind+","+
	detail+","+maker+","+dprice+","+dstock;
	%> <option value= <%=pum %>><%=pum %>
	</option>
 <% }
   rs.close();
    %></select>
</tr>
<tr><td>판매수량</td>
<td><input type="text" name="amount"></td></tr>
<tr><td colspan=2>
<input type="submit" value="등록" onclick="return joinCheck()">
<input type="button" value="조회" onclick="return search()"></td>
</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>