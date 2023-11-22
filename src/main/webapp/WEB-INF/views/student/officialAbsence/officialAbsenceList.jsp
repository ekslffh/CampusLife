<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<security:authentication property="principal.realUser" var="authMember" />
<c:url value="/student/official-absence/insert.do" var="insertURL" />

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">수업 / 공결</h1>
	<p class="mb-4" style="color:red;">
		<i class="bi bi-exclamation-circle"></i>
		공결 신청은 당일만 가능하며 신청 후 삭제/변경할 수 없습니다. 출력시 공결상세리스트의 원하는 날짜 항목을 클릭하신 후 출력버튼을 눌러 주십시요.
		<!-- DataTables is a third party plugin that is used to generate the demo
		table below. For more information about DataTables, please visit the <a
			target="_blank" href="https://datatables.net">official DataTables
			documentation</a>. -->
	</p>
	
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<div class="container p-0">
				<div class="row align-items-center">
					<h6 class="m-0 font-weight-bold text-primary col-11 p-0">공결 상세목록</h6>
					<button type="button" class="btn btn-primary btn-sm col-1" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">신청</button>					
				</div>
			</div>
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">공결신청</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <form action="${insertURL }" method="post">
			          <div class="mb-3">
			            <label for="writer" class="col-form-label">작성자</label>
			            <input type="text" class="form-control" id="writer" value="${authMember.stdNm }" disabled="disabled">
			            <input type="hidden" name="oahStdNo" class="form-control" value="${authMember.stdNo }">
			          </div>
			          <div class="mb-3">
			            <label for="message-text" class="col-form-label">강의목록</label>
			            <select name="oahLsNo" class="form-select" aria-label="Default select example">
						  <option selected>강의를 선택해주세요.</option>
						  <option value="1">졸업프로젝트</option>
						  <option value="2">취업전략</option>
						  <option value="3">정보통신</option>
						</select>
			          </div>
			          <div class="mb-3">
			            <label for="message-text" class="col-form-label">공결종류</label>
			            <select name="oahOacId" class="form-select" aria-label="Default select example">
						  <option selected>공결종류를 선택해주세요.</option>
						  <c:forEach items="${absCategories }" var="absCtgr">
						  	<option value="${absCtgr.oacId }">${absCtgr.oacNm }</option>
						  </c:forEach>
						</select>
			          </div>
			          <div class="modal-footer">
					      <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소하기</button>
					      <button type="submit" class="btn btn-primary">신청하기</button>
				      </div>
			        </form>
			      </div>
			    </div>
			  </div>
			</div>
		</div>
		
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>주차</th>
							<th>차시</th>
							<th>날짜</th>
							<th>강의</th>
							<th>유형</th>
							<th>첨부파일</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>주차</th>
							<th>차시</th>
							<th>날짜</th>
							<th>강의</th>
							<th>유형</th>
							<th>첨부파일</th>
						</tr>
					</tfoot>
					<tbody>
					<c:forEach items="${absHistories}" var="history">
						<tr>
							<td>${history.oahLsNo }</td>
							<td>${history.oahLsNo }</td>
							<td>${history.oahRegDt }</td>
							<td>${history.oahLsNo }</td>
							<td>${history.oahOacId }</td>
							<td>${history.oahFile }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->