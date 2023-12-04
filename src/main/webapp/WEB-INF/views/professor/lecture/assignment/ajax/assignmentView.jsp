<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div>
	<h2>과제정보</h2>
	<br />
	<table class="table table-bordered">
		<tr>
			<th class="table-light">제목</th>
			<td>${assignment.asTitle }</td>
			<th class="table-light">등록일시</th>
			<td>${assignment.asRegTm }</td>
		</tr>
		<tr>
			<th class="table-light">시작일시</th>
			<td>${assignment.asStartTm }</td>
			<th class="table-light">마감일시</th>
			<td>${assignment.asEndTm }</td>
		</tr>
		<tr>
			<th class="table-light">첨부파일</th>
			<td colspan="3">-</td>
		</tr>
		<tr>
			<th class="table-light" >내용</th>
			<td colspan="3">${assignment.asContent }</td>
		</tr>
	</table>
	<div style="text-align: right; margin-top: 10px;">
		<c:url value="/lecture/assignment/update.do" var="updateURL">
			<c:param name="asNo" value="${assignment.asNo }" />
		</c:url>
		<c:url value="/lecture/assignment/delete.do" var="deleteURL">
			<c:param name="asNo" value="${assignment.asNo }" />
			<c:param name="asLecNo" value="${assignment.asLecNo }" />
		</c:url>
		<a href="#" data-url="${updateURL }" class="btn btn-warning">수정</a>
		<button id="del_btn" class="btn btn-danger" data-url="${deleteURL }">삭제</button>
		<c:url value="/lecture/assignment/list.do" var="listURL">
			<c:param name="lecNo" value="${assignment.asLecNo }" />
		</c:url>
		<a class="btn btn-secondary" href="#" data-url="${listURL }" style="border: 1px solid gray;">목록으로</a>
	</div>
</div>

<hr/>

<div>
	<h2>제출정보</h2>
	<br />
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>제출파일</th>
				<th>제출일시</th>
				<th>수정일시</th>
				<th>점수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>20170935</td>
				<td>나성민</td>
				<td>파일~</td>
				<td>2023-12-05T15:30</td>
				<td>2023-12-05T15:30</td>
				<td>70</td>
			</tr>
		</tbody>
	</table>
</div>