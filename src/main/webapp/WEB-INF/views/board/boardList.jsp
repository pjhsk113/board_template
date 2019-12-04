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
	<h1>게시판</h1>
	<table class="table table-hover" >
		<thead>
			<th>게시글 번호</th>
			<th>글 제목</th>
			<th>작성일</th>			
		</thead>
		<tbody>
			<c:choose>
			
				<c:when test="${empty boardList}">
					<tr>
						<td colspan="3">글이 없습니다.</td>
					</tr>
				</c:when>
				
				<c:otherwise>
					<c:forEach var="item" items="${boardList}" varStatus="index">
					<tr>
						<td>${boardOrder}</td>
						<td><a href="../board/View.do?boardNo=${item.boardNo}">${item.boardTitle}</a></td>
						<td>${item.boardDate}</td>
					</tr>
					<!-- 게시물 번호 -->
					<c:set var="boardOrder" value="${boardOrder-1}" />
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<!-- paging 처리 -->
	<div >
		<div >
			<div>
				<c:choose>
					<c:when test="${pageData.prevPage > 0}">
						<c:url value="/board/List.do" var="prevPageUrl">
							<c:param name="pageNo" value="${pageData.prevPage}" />
						</c:url>
						<a href="${prevPageUrl}"> [이전] </a>
					</c:when>
					<c:otherwise>
						[이전]
					</c:otherwise>
				</c:choose>
					<c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
						<c:url value="/board/List.do" var="pageUrl">
							<c:param name="pageNo" value="${i}" />
						</c:url>
						<c:choose>
							<c:when test="${pageData.nowPage == i}">
								<a><strong>${i}</strong></a>
							</c:when>
							<c:otherwise>
								<a href="${pageUrl}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:choose>
						<c:when test="${pageData.nextPage > 0}">
							<c:url value="/board/List.do" var="nextPageUrl">
								<c:param name="pageNo" value="${pageData.nextPage}" />
							</c:url>
							<a href="${nextPageUrl}"> [다음] </a>
						</c:when>
						<c:otherwise>
							[다음]
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<input type="button" value="글쓰기" id="writeBtn">
			<input type="button" value="회원가입" id="registerBtn">
			<input type="button" value="로그인" id="loginBtn">
		</div>
	</div>
<script type="text/javascript">
$j(document).ready(function(){
	$j("#registerBtn").click(function(){
		location.href = "../user/register.do";
	 });
	$j("#loginBtn").click(function(){
		location.href = "../user/login.do";
	 });
	$j("#writeBtn").click(function(){
		location.href = "../board/Write.do";
	 });
});

</script>
</body>
</html>