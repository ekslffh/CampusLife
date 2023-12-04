<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<table class="table">
  <thead>
    <tr>
      <th scope="col">제목</th>
      <th scope="col">시작일시</th>
      <th scope="col">마감일시</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">
      	<a href="#">과제취업상담 과제(10점) 제출</a> 
      </th>
      <td>2023-12-1 18:00</td>
      <td>2023-12-5 17:00</td>
    </tr>
    <tr>
      <th scope="row">보고서 제출하기</th>
      <td>2023-12-1 18:00</td>
      <td>2023-12-5 17:00</td>
    </tr>
    <tr>
      <th scope="row">보고서2 제출하기</th>
      <td>2023-12-1 18:00</td>
      <td>2023-12-5 17:00</td>
    </tr>
    <c:forEach items="${assignmentList }" var="assignment">
    	<c:url value="/lecture/assignment/view.do" var="viewURL">
    		<c:param name="asNo" value="${assignment.asNo }" />
    	</c:url>
    	<tr>
    	  <th scope="row"><a href="#" data-url="${viewURL }">${assignment.asTitle }</a></th>
	      <td>${assignment.asStartTm }</td>
	      <td>${assignment.asEndTm }</td>
    	</tr>
    </c:forEach>
  </tbody>
</table>