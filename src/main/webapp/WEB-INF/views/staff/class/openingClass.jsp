<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<style>
body {
	color: #000;
	overflow-x: hidden;
	height: 50%;
	background-repeat: no-repeat;
	padding: 0 !important;
}

.container {
	padding-left: 0px;
}

label {
	font-size: 18px;
}

input {
	padding: 10px 15px !important;
	border: 1px solid #CFD8DC !important;
	border-radius: 4px !important;
	box-sizing: border-box;
	background-color: #fff !important;
	color: #000 !important;
	font-size: 16px !important;
	letter-spacing: 1px;
}

input:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	border: 1px solid #FFA000 !important;
	outline-width: 0;
}

.daterangepicker {
	background-color: #fff;
	border-radius: 0 !important;
	align-content: center !important;
	padding: 0 !important;
}

/*Weekday Heading*/
thead tr:nth-child(2) {
	color: #BDBDBD !important;
}

tbody tr td {
	padding: 5px 7px !important;
}

tbody tr th {
	text-align: center;
}

.month {
	font-size: 16px !important;
	padding-bottom: 10px !important;
	padding-top: 10px !important;
}

.start-date, .end-date {
	border-radius: 0px !important;
}

.available:hover {
	border-radius: 0px !important;
}

.off {
	color: #EEEEEE !important;
}

.off:hover {
	background-color: #EEEEEE !important;
	color: #fff !important;
}

.drp-buttons {
	display: none !important;
}

.addSize {
	width: 300px;
}
</style>
<%
java.util.Calendar cal = java.util.Calendar.getInstance();
int year = cal.get(java.util.Calendar.YEAR);
pageContext.setAttribute("year", year);
%>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<br>
	<h1 class="h3 mb-2 text-gray-800">학기 개설</h1>
	<p class="mb-4" style="color: red;">
		<i class="bi bi-exclamation-circle"></i> 학기는 생성 후 삭제 및 변경할 수 없습니다.
	</p>


	<form:form method="post"
		action="${pageContext.request.contextPath }/staff/classRegi/insertClassRegi.do"
		modelAttribute="classRegi" enctype="multipart/form-data">
		<form:hidden path="crNo" />
		<form:hidden path="crEndSemSr" />
		<table class="table table-border">

			<tr>
				<th>개설 연도</th>
				<td><form:select path="crYear" class="form-control addSize">
						<form:option value="${year}"></form:option>
					</form:select></td>
			</tr>
			<tr>
				<th>개설 학기</th>
				<td><form:select path="crSem" class="form-control addSize">
						<form:option value="1">1학기</form:option>
						<form:option value="2">2학기</form:option>
					</form:select></td>
			</tr>
			<tr>
				<th>개설 학기 기간</th>
				<td style="width: 60%;">
					<div class="container">
						<form autocomplete="off">
							<div class="flex-row d-flex justify-content-left">
								<div class="col-xl-3 col-lg-3 col-3">
									<div class="input-group input-daterange">
										<input type="text" style="width: 100%;" name="daterange"
											value="01/01/2018 - 01/15/2018" readonly />
									</div>
								</div>
							</div>
						</form>
					</div>
				</td>
			</tr>
			<!-- 예비 수강신청 시작 일시 -->
			<tr>
				<th>(예비) 수강신청 시작 일시</th>
				<td><form:input path="crPreStartTm" type="datetime-local"
						class="addSize" /></td>
			</tr>
			<!-- 예비 수강신청 종료 일시 -->
			<tr>
				<th>(예비) 수강신청 종료 일시</th>
				<td><form:input path="crPreEndTm" type="datetime-local"
						 class="addSize" /></td>
			</tr>
			<!-- 수강신청 시작 일시 -->
			<tr>
				<th>수강신청 시작 일시</th>
				<td><form:input path="crStartTm" type="datetime-local"
						 class="addSize" /></td>
			</tr>
			<!-- 수강신청 종료 일시 -->
			<tr>
				<th>수강신청 종료 일시</th>
				<td><form:input path="crEndTm" type="datetime-local"
						 class="addSize" /></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" class="btn btn-primary"
					value="저장"> <input type="reset" class="btn btn-danger"
					value="취소"></td>
			</tr>
		</table>
	</form:form>


</div>




<script>
	$(document).ready(function() {
		$(function() {
			$('input[name="daterange"]').daterangepicker({
				"startDate" : "2023-01-01",
				"endDate" : "2023-01-30",
				opens : 'center',
				locale : {
					format : 'YYYY-MM-DD'
				}
			});
		});
	});

// 	$(document).ready(function() {
// 		// 예비 수강신청 시작 일시
// 		$('#crPreStartTm, #crPreStartTime').change(function() {
// 			var date = $('#crPreStartTm').val();
// 			var time = $('#crPreStartTime').val();
// 			var combinedDateTime = date + ' ' + time;
// 			$('#combinedPreStartDateTime').val(combinedDateTime);
// 		});

// 		// 예비 수강신청 종료 일시
// 		$('#crPreEndTm, #crPreEndTime').change(function() {
// 			var date = $('#crPreEndTm').val();
// 			var time = $('#crPreEndTime').val();
// 			var combinedDateTime = date + ' ' + time;
// 			$('#combinedPreEndDateTime').val(combinedDateTime);
// 		});

// 		// 수강신청 시작 일시
// 		$('#crStartTm, #crStartTime').change(function() {
// 			var date = $('#crStartTm').val();
// 			var time = $('#crStartTime').val();
// 			var combinedDateTime = date + ' ' + time;
// 			$('#combinedStartDateTime').val(combinedDateTime);
// 		});

// 		// 수강신청 종료 일시

// 		$('#crEndTm, #crEndTime').change(function() {
// 			var date = $('#crEndTm').val();
// 			var time = $('#crEndTime').val();
// 			var combinedDateTime = date + ' ' + time;
// 			$('#combinedEndDateTime').val(combinedDateTime);
// 		});
// 	});
</script>