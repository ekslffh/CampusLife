<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- 게시판 헤더 영역 시작 -->
<div class="card-header"
	style="padding-bottom: 5px; margin-bottom: 15px;">
	<h5 class="card-tit">계정 관리</h5>
	<nav>
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="index.html"><i
					class="bi bi-house-door"></i></a></li>
			<li class="breadcrumb-item"><a href="#">계정 조회</a></li>
			<li class="breadcrumb-item active">계정 리스트</li>
		</ol>
	</nav>
</div>

<div class="table-responsive">
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<thead>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>단과대학</th>
				<th>전공</th>
				<th>상태</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>단과대학</th>
				<th>전공</th>
				<th>상태</th>
			</tr>
		</tfoot>
		<tbody>
			<c:forEach items="${stdList}" var="stdList">
				<tr>
					<td>${stdList.stdNo }</td>
					<td>${stdList.stdNm }</td>
					<td>${stdList.stdMajCd }</td>
					<td>${stdList.stdMajCd }</td>
					<td>${stdList.stdStatus }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="table-responsive">
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<thead>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>소속 부서</th>
				<th>연락처</th>
				<th>상태</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>소속 부서</th>
				<th>연락처</th>
				<th>상태</th>
			</tr>
		</tfoot>
		<tbody>
			<c:forEach items="${stfList}" var="stfList">
				<tr>
					<td>${stfList.stfNo }</td>
					<td>${stfList.stfNm }</td>
					<td>${stfList.stfDeptNo }</td>
					<td>${stfList.stfTel }</td>
					<td>${stfList.stfStatus }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="table-responsive">
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<thead>
			<tr>
				<th>교번</th>
				<th>이름</th>
				<th>단과대학</th>
				<th>전공</th>
				<th>상태</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<th>교번</th>
				<th>이름</th>
				<th>단과대학</th>
				<th>전공</th>
				<th>상태</th>
			</tr>
		</tfoot>
		<tbody>
			<c:forEach items="${profList}" var="profList">
				<tr>
					<td>${profList.profNo }</td>
					<td>${profList.profNm }</td>
					<td>${profList.profMajCd }</td>
					<td>${profList.profMajCd }</td>
					<td>${profList.profStatus }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>





