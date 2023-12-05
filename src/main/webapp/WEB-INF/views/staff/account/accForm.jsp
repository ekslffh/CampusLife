<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>

<style>
#node0 {
	display: flex;
}

#node1 {
	float: left;
	width: 860px;
	height: 472px;
	margin-right: 30px;
}

#node2 {
	width: 800px;
	height: 472px;
	margin-right: 30px;
	display: block;
}

#node3 {
	display: flex;
	box-sizing: border-box;
}

#node4 {
 	width: 860px;
	height: 460px;
	display: inline-flex;
	margin-right: 25px;
}

#node5 {
	display: inline-flex;
	width: 500px;
	height: 460px;
	margin-right: 25px;
}

#node6 {
	width: 600px;
}

#node1-1 {
	display: inline-flex;
	width: 54%;
}

#node1-2 {
    display: flex;
    padding-top: 25px;
    justify-content: center;
}

.card-body {
	text-align: center;
	padding: 0 10px 10px 10px;
}
.card-header, .card-footer {
    border-color: #ebeef4;
    background-color: #fff;
    color: #798eb3;
    padding: 12px;
}

#vrCalendar{
max-height:90%;
margin:0 auto;
}
</style>



<section class="section">
<!-- 		<div class="col-lg-12"> -->
					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header" style="text-align:left; padding-bottom: 5px; margin-bottom: 15px;">
					    <h5 class="card-tit">계정 관리</h5>
					    <nav>
					      <ol class="breadcrumb">
					        <li class="breadcrumb-item"><a href="index.html"><i class="bi bi-house-door"></i></a></li>
					        <li class="breadcrumb-item"><a href="#">계정 정보</a></li>
					        <li class="breadcrumb-item active">계정 조회</li>
					      </ol>
					    </nav>
				    </div>
				    <!-- 게시판 헤더 영역 끝 -->

<div>
<a href="${pageContext.request.contextPath}/staff/account/stdInsert.do"><button class="btn btn-sm btn-danger">학생 계정 생성</button></a>
<a href="${pageContext.request.contextPath}/staff/account/profInsert.do"><button class="btn btn-sm btn-warning">교수 계정 생성</button></a>
<a href="${pageContext.request.contextPath}/staff/account/stfInsert.do"><button class="btn btn-sm btn-success">교직원 계정 생성</button></a>
</div>

<div>
<br>
<h3>계정 리스트 </h3>
여기에 accList.jsp 넣기~! 

<div class="card-body" id="accList"></div>
</div>


</section>



<script type="text/javascript">

$(function() {
	getAccList();
})

function getAccList() {
	let settings = {
			url : "${pageContext.request.contextPath}/staff/account/accList.do",
			method : "get",
			dataType : "html",
			success : function(resp) {
				console.log("resp", resp);
				$(accList).html(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			} //request line,header,body -> response processing
	};
	$.ajax(settings);
}



</script>