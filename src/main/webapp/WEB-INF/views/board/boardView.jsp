<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/assets/css/bootstrap.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>상세보기</h1>
	<table class="table">

	<tr>
		<td>

			<table border ="1" class="table">
				<tr>
					<td width="120" align="center">
					제목
					</td>
					<td width="400">
					${Content.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					글내용
					</td>
					<td>
					${Content.boardContent}
					</td>
				</tr>
				<tr>
					<td height="50" align="center">
					글쓴이
					</td>
					<td>
					${Content.writer}
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href="/board/List.do"><button type="button">List</button></a>
			<a href="/board/Update.do?boardNo=${Content.boardNo}"><button type="button">수정</button></a>
			<a href="#" id="deleteBtn"><button type="button">삭제</button></a>
		</td>
	</tr>
</table>
</div>
<script type="text/javascript">
$j(document).ready(function(){
	$j("#deleteBtn").click(function(){
		$j.ajax({
		    url : "/board/DeleteOk.do?boardNo=${Content.boardNo}",
		    dataType: "json",
		    type: "GET",
		    success: function(data)
		    {
		    	
		    	if(confirm("삭제하시겠습니까?")){
		    		alert("삭제완료");
		    		location.href = "/board/List.do";
		    	}else{
		    		return false;
		    	}		    		
		    	
		    },
		    error: function ()
		    {
		    	alert("실패");
		    }
		});
	 });
	
});

</script>
</body>
</html>