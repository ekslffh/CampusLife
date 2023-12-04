<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url value="/lecture/assignment/insert.do" var="insertURL">
	<c:param name="lecNo" value="${lecNo }" />
</c:url>

<h2>과제목록</h2>
<div class="d-flex justify-content-end mb-3">
<a href="#" data-url="${insertURL }" class="btn btn-primary">과제추가</a>
</div>
<table class="table">
  <thead>
    <tr>
      <th scope="col">제목</th>
      <th scope="col">시작일시</th>
      <th scope="col">마감일시</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${assignmentList }" var="assignment">
    	<c:url value="/lecture/assignment/view.do" var="viewURL">
    		<c:param name="asNo" value="${assignment.asNo }"/>
    	</c:url>
    	<tr>
    	  <th scope="row"><a href="#" data-url="${viewURL }">${assignment.asTitle }</a></th>
	      <td>${assignment.asStartTm }</td>
	      <td>${assignment.asEndTm }</td>
    	</tr>
    </c:forEach>
  </tbody>
</table>