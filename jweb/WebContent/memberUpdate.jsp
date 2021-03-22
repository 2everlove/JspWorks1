<%-- <%@page import="com.jweb.Member"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="menu.jsp"/>
<jsp:useBean id="memDAO" class="com.jweb.member.MemberDAO" scope="application"/>
<jsp:useBean id="member" class="com.jweb.member.Member"/>
<%
	String memberId = request.getParameter("memberId");
	member = memDAO.getOndDB(memberId);
	String sessionId = null;
	if(session.getAttribute("sessionId") != null){
		sessionId = (String) session.getAttribute("sessionId");
	} else {
		out.println("<script>");
		out.println("alert('로그인을 해주세요.')");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
%>

<title><%=member.getMemberId() %>님의 상세보기</title>
<style type="text/css">
	input{text-align: center;}
</style>
<script type="text/javascript">
	function checkForm() {
	    const form = document.updateForm;
	    const pwd = form.passwd.value;
	    const pwd_confirm = form.passwd_confirm.value;
	    const id = form.memberId.value;
	    const name = form.name.value;
		const gender = form.gender.value;
		const regExPwd1 = /^[a-zA-Z0-9]{6,15}$/;
		const chk_num = pwd.search(/[0-9]/g);
		const chk_eng = pwd.search(/[a-zA-Z]/g);
		if (pwd==""){
		    alert("비밀번호가 입력되지 않았습니다.");
		    form.passwd.focus();
		    return false;
		} 
		else if (pwd_confirm==""){
		    alert("비밀번호를 다시 입력해주세요.");
		    form.passwd_confirm.focus();
		    return false;
		} 
		else if (pwd.length<6 || pwd.length>15){
			alert("비밀번호는 6자~15자까지 가능합니다.");
		    form.passwd.select();
		    return false;
		} 
		else if (!regExPwd1.test(pwd) || chk_num<0 || chk_eng<0){
			alert("비밀번호는 영문자, 숫자, 특수문자 조합으로만 가능합니다.");
		    form.passwd.select();
		    return false;
		} 
		else if(pwd!=pwd_confirm){
		    alert("비밀번호를 동일하게 입력해주세요.");
		    form.passwd.select();
		    return false;
		} 
		else if (name==""){
		    alert("이름을 입력해 주세요.");
		    form.name.focus();
		    return false;
		}
		if(confirm("입력한 정보가 맞으시면 확인을 눌러주세요.\n아이디 : "+id+"\n이름 : "+name+"\n성별 : "+gender))
			form.submit();		
	}
</script>
</head>
<body>
	<div id="container">
		<div class="title">
			<h1>수정 하기</h1>
		</div>
		<form name ="updateForm" action="updateProcess.jsp?memberId=<%=member.getMemberId() %>" method="post" onsubmit="return checkForm()">
			<table>
				<tr>
					<th colspan="2" id="memberForm__table-FstColumn"><%=member.getMemberId() %> (<span style="color: blue;"><%=member.getName() %></span>님)</th>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="memberId" value="<%=member.getMemberId() %>" disabled></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="passwd" value="<%=member.getPasswd() %>" ></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="text" name="passwd_confirm" placeholder="password confirm" ></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="<%=member.getName() %>" ></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
					<%if (member.getGender().equals("남")){ %>
					<label><input type="radio" name="gender" value="남" checked >남</label>
					<label><input type="radio" name="gender" value="여" >여</label>
					<%} else if (member.getGender().equals("여")){ %>
					<label><input type="radio" name="gender" value="남" >남</label>
					<label><input type="radio" name="gender" value="여" checked >여</label>
					<%} %>
					</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td><input type="text" name="joinDate" value="<%=member.getJoinDate() %>" disabled></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="저장" >
					<input type="button" value="취소" onclick="history.back()">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>