<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">과목 개설</h1>


	<form:form method="post"
		action="${pageContext.request.contextPath }/professor/subject/insertSubject.do"
		modelAttribute="subject" enctype="multipart/form-data">
		<form:hidden path="subNo" />
		<table class="table table-border">

			<tr>
				<th>과목 이름</th>
				<td><form:input path="subNm" class="form-control" /> <form:errors
						path="subNm" class="error" /></td>
			</tr>
			<tr>
				<th>과목 상태</th>
				<td><form:select path="subStatus" class="form-control">
						<form:option value="S01">활설화</form:option>
						<form:option value="S02">비활설화</form:option>
					</form:select> <form:errors path="subStatus" class="error" /></td>
			</tr>
			<tr>
				<th>과목 구분</th>
				<td><form:select path="subType" class="form-control">
						<form:option value="OFF">오프라인</form:option>
						<form:option value="ON">온라인</form:option>
					</form:select> <form:errors path="subType" class="error" /></td>
			</tr>
			<tr>
				<th>과목 전공</th>
				<td><form:select path="subMajCd" class="form-control">
						<form:option value="OFF">오프라인</form:option>
						<form:option value="ON">온라인</form:option>
					</form:select> <form:errors path="subMajCd" class="error" /></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" class="btn btn-primary"
					value="저장"> <input type="reset" class="btn btn-danger"
					value="취소"></td>
			</tr>
		</table>
	</form:form>

	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table me-1"></i> DataTable Example
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
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
		</div>
	</div>
</div>

