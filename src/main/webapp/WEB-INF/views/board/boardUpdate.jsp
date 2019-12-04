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
	<h1>글 수정</h1>
	<form class="boardEdit">
	<table class="table">
		<tr>
			<td >
				<table border="1" class="table">
					<tr>
						<td>글제목</td>
						<td><input type="text" size="50" id="boardTitle" name="boardTitle" value="${Content.boardTitle}"></td>
						<input type="hidden" name="boardNo" value="${Content.boardNo}">
					</tr>
					<tr>
						<td>글내용</td>
						<td><textarea rows="20" cols="55" id="boardContent" name="boardContent" >${Content.boardContent}</textarea></td>
					</tr>
					
				</table>
			</td>
		</tr>
		
		<tr>
			<td align ="right">
				<a href="/board/List.do"><button type="button">List</button></a>
				<input type="button" id="updateSubmit" value="작성완료">
			</td>
		</tr>
	</table>
	</form>
	</div>
<script type="text/javascript">
	$j(document).ready(function(){
		$j("#updateSubmit").on("click",function(){
			var $frm = $j('.boardEdit :input');
			var param = $frm.serialize();
			console.log(param);
			console.log(param);
			$j.ajax({
			    url : "/board/UpdateOK.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data)
			    {
			    	alert("수정완료");	
					location.href = "/board/List.do";
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