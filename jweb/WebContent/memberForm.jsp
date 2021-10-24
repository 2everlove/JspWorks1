<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome to our-site</title>
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript" src="resources/js/check.js"></script>
<script type="text/javascript" src="js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
    const request = new XMLHttpRequest(); 
    
	function idCheck(){
	    let t_id = document.querySelector('#t_id').value;
	    console.log(t_id);
	    /* const member = {
		    "id" : t_id
	    }; 
	    console.log(member);*/
	   	request.open('POST', '/jweb/idcheck', true);
	    request.setRequestHeader('Content-type', 'application/x-www-form-urlencoded; charset=utf-8');
	    //request.send(JSON.stringify(member));
	    request.send("id="+t_id);
	    //console.log(JSON.stringify(member));
	    request.onreadystatechange = searchProcess;
	    
	    /* var t_id = $("#t_id").val(); //입력상자의 ID값
	    $.ajax({
			type: "post",
			dataType: "text",
			async: false, //async x
			url: "/jweb/idcheck",
			data:{id: t_id}, //id를 서블릿에 보냄
			success:function(data, textStatus){
			    if(data=="usable"){
					$(message).text("아이디를 사용할 수 있습니다.").css("color","green");
					$("#t_id").css("border","1px solid black")
					$("#id_message").val("true")
			    } else {
					$(message).text("아이디를 사용할 수 없습니다.").css("color","red");
					$("#t_id").css("border","3px solid red")
					$("#id_message").val("false")
			    }
			},
			error:function(data, textStatus){
			    alert('Error'+data, textStatus);
			}
	    });//ajax닫기 */
	    
	}
	   
	   
	  
	   	
	    
	
	function searchProcess(){
	    let messsage = document.querySelector('#message');
	    message.innerHTML = "";
	    if(request.readyState == 4 && request.status == 200) {
			let result = request.responseText;
		    console.log(result);
		    if(result == "usable"){
				message.innerHTML = "<span style='color:green'>아이디를 사용할 수 있습니다</span>"
		    } else {
				message.innerHTML = "<span style='color:red'>아이디를 사용할 수 없습니다</span>"
		    }
	    }
	}
</script>

</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div id="container">
		<div class="title">
			<h1>Welcome to World Job Friends</h1>
		</div>
		<form name ="regForm" action="memberAdd.do" method="post">
			<table>
				<tr>
					<th colspan="2" id="memberForm__table-FstColumn">회원가입</th>
				</tr>
				<tr>
					<th>아이디</th>
					<td>
					<div id="message"></div>
					<input type="text" id="t_id" name="memberId" placeholder="ID" required autofocus onkeyup="idCheck()">
					<input type="text" name="id_message" id="id_message" hidden="">
					</td>
					
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="passwd" placeholder="PASSWORD" required></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="passwd_confirm" placeholder="PASSWORD CHECK" required></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" required onkeypress="press()"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<label><input type="radio" name="gender" value="남" checked>남</label>
						<label><input type="radio" name="gender" value="여">여</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="등록" onclick="checkMember()">
						<input type="button" value="취소" onClick="window.location.reload()">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>