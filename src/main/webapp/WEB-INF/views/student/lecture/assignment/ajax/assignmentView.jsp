<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<security:authentication property="principal.realUser" var="authMember" />
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
		<c:url value="/lecture/assignment/list.do" var="listURL">
			<c:param name="lecNo" value="${assignment.asLecNo }" />
		</c:url>
		<a class="btn btn-secondary" href="#" data-url="${listURL }" style="border: 1px solid gray;">목록으로</a>
	</div>
</div>

<hr/>

<div>
	<h2>나의제출</h2>
	<br />
	<c:choose>
		<c:when test="${empty assignmentSub }">
		<div class="d-flex justify-content-end mb-3">
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#fileModal">
				제출하기
			</button>
		</div>		
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
					<td colspan="6">제출내용없음.</td>
				</tr>
			</tbody>
		</table>
		</c:when>
		<c:otherwise>
		<div class="d-flex justify-content-end mb-3">
			<a href="#" data-url="${insertURL }" class="btn btn-warning">다시 제출하기</a>
		</div>		
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
					<td>${assignmentSub.student.stdNo }</td>
					<td>${assignmentSub.student.stdNm }</td>
					<td>
						<c:if test="${not empty assignmentSub.fileGroup and not empty assignmentSub.fileGroup.detailList }">
							<c:forEach items="${assignmentSub.fileGroup.detailList }" var="fileDetail">
								<c:url value="/download.do" var="downloadURL">
									<c:param name="afId" value="${fileDetail.afId }" />
									<c:param name="fiSn" value="${fileDetail.fiSn }" />
								</c:url>
								<a href="${downloadURL }">${fileDetail.fiOriginNm }</a>
							</c:forEach>
						</c:if>
					</td>
					<td>${assignmentSub.asubCrtTm }</td>
					<td>${assignmentSub.asubUpdTm }</td>
					<td>${assignmentSub.asubScore }</td>
				</tr>
			</tbody>
		</table>
		</c:otherwise>
	</c:choose>
</div>

<c:url value="/lecture/assignmentsub/insert.do" var="insertURL" />
<!-- 과제제출 모달 -->
<div class="modal fade" id="fileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form class="ajaxForm" action="post">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">과제제출</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      		<input name="asubAsNo" value="${assignment.asNo }" />
	      		<input name="asubStdNo" value="${authMember.stdNo }" />
	        	<input type="file" name="subFiles" />
	      </div>
	      <div class="modal-footer">
	        <input type="submit" class="btn btn-primary" value="제출하기" data-url="${insertURL }" />
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
      </form>
    </div>
  </div>
</div>