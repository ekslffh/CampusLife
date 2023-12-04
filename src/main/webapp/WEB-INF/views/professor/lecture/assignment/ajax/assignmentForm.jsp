<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<c:url value="/lecture/assignment/insert.do" var="insertURL" />
<c:url value="/lecture/assignment/update.do" var="updateURL" />

<c:choose>
	<c:when test="${empty assignment.asNo}">
		<h2>과제추가</h2>
	</c:when>
	<c:otherwise>
		<h2>과제수정</h2>
	</c:otherwise>
</c:choose>
<br />

<form:form class="ajaxForm" method="post" modelAttribute="assignment">
	<form:hidden path="asLecNo" value="${lecNo }" />
	<c:if test="${not empty assignment.asNo }">
		<form:hidden path="asNo" value="${assignment.asNo }" />
	</c:if>
	<table class="table table-border">
		<tr>
			<th>시작일시</th>
			<td>
				<form:input path="asStartTm" class="form-control" type="datetime-local" />
				<span data-target="asStartTm" class="error"></span>
			</td>
		</tr>
		<tr>
			<th>마감일시</th>
			<td>
				<form:input path="asEndTm" class="form-control" type="datetime-local" />
				<span data-target="asEndTm" class="error"></span>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<form:input path="asTitle" class="form-control" />
				<span data-target="asTitle" class="error"></span>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<form:textarea path="asContent" class="form-control" style="height: 350px;" />
				<span data-target="asContent" class="error"></span>
			</td>
		</tr>
	</table>
	<div style="text-align: right; margin-top: 10px;">
		<c:choose>
			<c:when test="${empty assignment.asNo}">
				<input type="submit" data-url="${insertURL }" class="btn btn-primary" value="추가">
				<c:url value="/lecture/assignment/list.do" var="listURL">
					<c:param name="lecNo" value="${lecNo }" />
				</c:url>
				<a class="btn btn-secondary" href="#" data-url="${listURL }" style="border: 1px solid gray;">목록으로</a>
			</c:when>
			<c:otherwise>
				<c:url value="/lecture/assignment/view.do" var="viewURL">
					<c:param name="asNo" value="${assignment.asNo }" />
				</c:url>
				<input type="submit" data-url="${updateURL }" class="btn btn-warning" value="수정" />
				<a class="btn btn-secondary" href="#" data-url="${viewURL }" style="border: 1px solid gray;">돌아가기</a>
			</c:otherwise>
		</c:choose>
	</div>
</form:form>