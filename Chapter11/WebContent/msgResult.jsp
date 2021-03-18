<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메시지 처리</title>
</head>
<body>
<%-- <c:if test="${msg eq 'update'}">
	<script type="text/javascript">
		alert("게시글이 수정되었습니다.");
		history.go(-1);
	</script>
</c:if> --%>
<c:if test="${msg eq 'delete'}">
	<script type="text/javascript">
		alert("게시글이 삭제되었습니다.");
		history.go(-1);
	</script>
</c:if>
게시판 목록
</body>
</html>