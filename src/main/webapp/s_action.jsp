<%@page import="java.sql.*"%>

<%@page import="sjhtest.Condb"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매추가, 수정</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
Connection conn=null;
Statement st=null;
String mode= request.getParameter("mode");
//데이터 추가의 경우 insert, 수정의 경우 modify가 저장  

try {
	conn= Condb.getConnection();
	st = conn.createStatement();
	String sql="";
	switch (mode){
	
	case "insert":
		String snum= request.getParameter("snum");
		//name 속성이 snum인 판매번호 값이 변수에 저장 
		String pnum= request.getParameter("pnum");
		//name 속성이 mnum인 콤보박스의 value값을 가져와서 변수에 저장 
		String[] arpnum = pnum.split(",");
		int i = 0;
		for(String all : arpnum){
			
			System.out.println("arpnum"+"["+i+"] = " +  all);
			i++;
		}
		System.out.println();
		
		//split("구분자") : 구분자단위로 문자열을 분리하여 배열에 저장 
		//armnum[0]=회원번호, armnum[1]=회원이름이 저장됨
		String dnum= request.getParameter("dnum");
		//name 속성이 bnum인 콤보박스의 value값을 가져와서 변수에 저장 
		String[] ardnum = dnum.split(",");
		int j = 0;
		for(String all : ardnum){
			
			System.out.println("ardnum"+"["+j+"] = " +  all);
			j++;
		}
		//arbnum[0]=도서번호(숫자값), arbnum[1]=도서명,arbnum[2]=출판사 
		//arbnum[3]=저자, arbnum[4]=가격(숫자값),arbnum[5]=재고(숫자값)
		String amount= request.getParameter("amount");
		//name 속성이 amount인 판매수량 값이 변수에 저장 
		int a= Integer.parseInt(ardnum[6]);
		//Integer.parseInt(문자열) : 숫자형태의 문자열값을 정수형으로 변환 
		// 재고의 값을 정수형으로 변환해서 변수에 저장  
		int b= Integer.parseInt(amount);
		// 판매수량의 값을 정수형으로 변환해서 변수에 저장 
		int dstock = a-b;
		//정수형 변수에 재고-판매수량의 값을 저장 
		sql="insert into sjhsales values ("+ snum +","+  
		          arpnum[0] +","+
		    	 "'"+arpnum[1] + "',"+
		           ardnum[0] + ","+
		         "'"+ ardnum[1] +"',"+
		         ""+ ardnum[5] +","+
		     	 ""+ ardnum[6] +","+
	     		 amount + ")";
		st.executeUpdate(sql);
		sql="update sjhdrug set "+
				"dstock = "+ dstock +" where dnum="+ ardnum[0];
   //해당 도서번호의 재고값을 위에서 계산한 값으로 변경한다.(books 테이블)		
		st.executeUpdate(sql);
	%>
	<jsp:forward page="s_join.jsp"></jsp:forward>
	<%	
	
	case "modify":
		 snum= request.getParameter("snum");
		 dnum= request.getParameter("dnum");
		 amount= request.getParameter("amount");
		sql="update sjhsales set "+
			"amount = "+ amount +
		"where snum =" + snum;
		st.executeUpdate(sql);
		//conn= Condb.getConnection();
		//st = conn.createStatement();
		//sql= "select stock from books where bnum=" + bnum;
		//ResultSet rs= st.executeQuery(sql);
		//rs.next();
		//stock = rs.getInt("stock");
		// rs.close();
		//conn= Condb.getConnection();
		//st = conn.createStatement();
		//sql= "select bnum,amount from sales where snum=" + snum;
		//rs= st.executeQuery(sql);
		//rs.next();
		//int mamount = Integer.parseInt(amount);
		//int mstock = stock - mamount;
		//rs.close();
		//sql = "update books set "+
		//		"stock = "//+ mstock +" where bnum="+ bnum;
		//st.executeUpdate(sql);
		
		%>
		<jsp:forward page="s_list.jsp"></jsp:forward>
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