<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
	request.setCharacterEncoding("utf-8");
	
	//리스트 생성 및 세션 생성 및 세션 가져오기(유지)
	ArrayList<String> cartList = (ArrayList)session.getAttribute("cartList");
	if(cartList == null){
		cartList = new ArrayList<>();
		
		//상품 리스트에 세션 부여
		session.setAttribute("cartList", cartList);
	}
	
	String cart = request.getParameter("product");
	cartList.add(cart);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 추가 처리</title>

</head>
<body>
	<script type="text/javascript">
		alert("<%=cart %>가(이) 추가되었습니다.");
		history.go(-1);
	</script>
</body>
</html>