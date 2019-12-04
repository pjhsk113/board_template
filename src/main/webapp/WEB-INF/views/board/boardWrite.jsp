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
	<h1>글쓰기</h1>
	<form class="boardWrite">
	<table class="table" >
		<tr>
			<td >
				<table border ="1" class="table">
					<tr>
						<th>글제목</td>
						<td class="form-control"><input type="text" size="50" id="boardTitle" name="boardTitle"></td>
					</tr>
					<tr>
						<th>글내용</td>
						<td class="form-control"><textarea rows="20" cols="55" id="boardContent" name="boardContent"></textarea></td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td align="right">
				<a href="/board/List.do"><button type="button">List</button></a>
				<input type="button" id="submit" value="작성완료">
			</td>
		</tr>
	</table>
	</form>
	</div>
<script type="text/javascript">
	$j(document).ready(function(){
		$j("#submit").on("click",function(){
			var $frm = $j('.boardWrite :input');
			var param = $frm.serialize();
			console.log(param);
			$j.ajax({
			    url : "/board/WriteOK.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data)
			    {
			    	if(data ==1){
			    		alert("작성완료");	
			    	}
					
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