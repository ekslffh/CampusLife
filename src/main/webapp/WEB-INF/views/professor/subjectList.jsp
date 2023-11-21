<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
테스트 ${subList }
<table class="table table-border">
	<thead>
		<tr>
			<th>과목번호</th>
			<th>과목이름</th>
			<th>상태</th>
			<th>구분</th>
			<th>전공</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty subList }">
			<tr>
				<td colspan="5">등록된 과목 없음</td>
			</tr>
		</c:if>
		<c:if test="${not empty subList }">
			<c:forEach items="${subList }" var="sub">
				<tr>
					<td>${sub.subNo}</td>
					<td>${sub.subNm}</td>
					<td>${sub.subStatus}</td>
					<td>${sub.subType}</td>
					<td>${sub.subMajCd}</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
