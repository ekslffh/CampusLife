<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<section class="section">
   <div class="row">
      <div class="col-lg-12">
         <div class="card">
            <div class="card-body">
            
               <!-- 게시판 헤더 영역 시작 -->
               <div class="card-header" style="padding-bottom: 5px; margin-bottom: 15px;}">
                   <h5 class="card-tit">계정 관리</h5>
                   <nav>
                     <ol class="breadcrumb">
                       <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
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
		</div>

   
</div>

         </div>
         </div>
</section>



