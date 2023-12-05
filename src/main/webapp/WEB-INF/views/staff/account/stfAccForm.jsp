<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<style>
.card-body {
	padding: 25px 30px 30px 35px;
}

hr {
	border: 0.5px solid #000; /* 가로 구분선의 스타일을 설정합니다. */
	margin: 13px 0; /* 위 아래 여백을 조정합니다. */
}

th {
	border-right: 1px solid #ccccccad; /* 각 열 사이에 세로 구분선 스타일 추가 */
	padding: 5px;
	vertical-align: middle;
	text-align: center;
}
</style>

<section class="section">
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">

					<!-- 게시판 헤더 영역 시작 -->
					<div class="card-header"
						style="padding-bottom: 5px; margin-bottom: 15px;">
						<h5 class="card-tit">계정 등록</h5>
						<nav>
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="index.html"><i
										class="bi bi-house-door"></i></a></li>
								<li class="breadcrumb-item">등록</li>
<!-- 								<li class="breadcrumb-item active"><a href="stdAccForm">학생</a></li> -->
								<li class="breadcrumb-item active">
								<a href="${pageContext.request.contextPath}/staff/account/stdAccInsert.do">학생</a></li>
								<li class="breadcrumb-item active">
								<a href="${pageContext.request.contextPath}/staff/account/accInsert.do">교직원</a></li>
								<li class="breadcrumb-item active">
								<a href="${pageContext.request.contextPath}/staff/account/profAccInsert.do">교수</a></li>
							</ol>
						</nav>
					</div>

					<div
						style="display: flex; justify-content: center; align-items: center;">
						<!-- <div class="card" style="width:800px;"> -->
						<div style="width: 800px;">

							<div class="card-body">
<!-- 								<input class="btn gray_btn" id="autoFillButton" type="button" -->
<!-- 									value="자동 생성" onclick="autofillButton()"> -->
								<form:form method="post" modelAttribute="stf" id="stfForm"
									enctype="multipart/form-data">
									<div style="text-align: center; height: 65px;">
										<h3>
											<b>교직원 계정 생성</b>
										</h3>
									</div>
									<hr style="margin: 0px;">
									<table class="table table-border">
										<tr>
											<th>이름</th>
											<td style="padding: 9px 0px 9px 15px;">
											<form:input
													path="stfNm" class="form-control" maxlength='10'
													style="width:200px;" />
											<form:errors path="stfNm" class="error" /></td>
										</tr>
<!-- 										<tr> -->
<!-- 											<th>생년월일</th> -->
<%-- 											<td style="padding: 9px 0px 9px 15px;"><form:input --%>
<%-- 													path="stf" class="form-control" type="date" --%>
<%-- 													style="width:200px;" /> <form:errors path="stfBir" --%>
<%-- 													class="error" /></td> --%>
<!-- 										</tr> -->
										<tr>
											<th>전화번호</th>
											<td style="padding: 9px 0px 9px 15px;">
											<form:input
													path="stfTel" class="form-control" maxlength='15'
													style="width:200px;" />
											</td>
										</tr>
										<tr>
											<th>성별</th>
											<td style="padding: 9px 0px 9px 15px;"><label> 
											<input type="radio" name="stfGender" value="F" id="femaleRadio" />
													여성 <br>
											</label> <label> 
											<input type="radio" name="stfGender"
													value="M" id="maleRadio" /> 남성
											</label></td>
										</tr>

										<tr>
											<th>이메일</th>
											<td style="padding: 9px 0px 9px 15px;">
												<div style="display: flex; align-items: center;">
													<form:input path="stfEmail" class="form-control"
														style="width:200px;" />
<!-- 													&nbsp; @ &nbsp; -->
<%-- 													<form:select id="stfEmail" path="stfEmail" --%>
<%-- 														class="form-control" style="width:200px;"> --%>
<%-- 														<form:option value="">-- 이메일 주소 --</form:option> --%>
<%-- 														<form:option value="naver.com">naver.com</form:option> --%>
<%-- 														<form:option value="daum.net">daum.net</form:option> --%>
<%-- 														<form:option value="gmail.com">gmail.com</form:option> --%>
<%-- 														<form:option value="kakao.com">kakao.com</form:option> --%>
<%-- 														<form:option value="hanmail.net">hanmail.net</form:option> --%>
<%-- 													</form:select> --%>
												</div>
											</td>
										</tr>
										<tr>
											<th>우편번호</th>
											<td
												style="display: flex; align-items: center; padding: 9px 0px 9px 15px;">
												<form:input
													id="stf_postNo" path="stfPostNo" class="form-control"
													style="width:200px;" /> &nbsp;&nbsp; <input
												class="btn btn-light btn-sm" onclick="findAddr()"
												value="주소찾기" style="width: 66px;"> <form:errors
													path="stfPostNo" class="error" /></td>
										</tr>
										<tr>
											<th>주소</th>
											<td style="padding: 9px 0px 9px 15px;"><form:input
													id="stf_addr" path="stfAddr" class="form-control" /></td>
										</tr>
										<tr>
											<th>상세 주소</th>
											<td style="padding: 9px 0px 9px 15px;"><form:input
													path="stfDetailAddr" class="form-control"
													style="width:200px;" /></td>
										</tr>
										<tr>
											<th>입사일</th>
											<td style="padding: 9px 0px 9px 15px;"><form:input
													path="stfJoinDt" class="form-control" type="date"
													style="width:200px;" /></td>
										</tr>

										<tr>
											<th>국적</th>
											<td style="padding: 9px 0px 9px 15px;">
												<form:input path="stfCountry" class="form-control" style="width:200px;" />
											</td>
										</tr>
										<tr>
											<th>부서</th>
											<td style="padding: 9px 0px 9px 15px;">
											<form:select
													path="stfDeptNo" class="form-control" style="width:200px;">
													<form:option value="1">-- 선택하세요 --</form:option>
													<form:option value="7241">교무처</form:option>
													<form:option value="7046">입학홍보처</form:option>
													<form:option value="7251">학생복지처</form:option>
													<form:option value="7263">인사팀</form:option>
											</form:select>
											</td>
										</tr>

										<tr>
											<th>프로필</th>
											<td style="padding: 9px 0px 9px 15px;">
<!-- 											<input type="file" name="stfProfile" multiple /> -->
											</td>
										</tr>
									</table>

									<div
										style="text-align: right; height: 100px; padding: 10px 0px 20px 20px; width: 701px;">
										<input class="btn btn-primary" type="submit" value="등록">
										<input class="btn btn-dark" type="reset" value="취소"> 
										<a class="btn gray_btn" href="<c:url value=''/>">목록</a>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<script>
	function findAddr() {
		new daum.Postcode({
			oncomplete : function(data) {

				console.log(data);

				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var jibunAddr = data.jibunAddress; // 지번 주소 변수
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('stf_postNo').value = data.zonecode;
				if (roadAddr !== '') {
					document.getElementById("stf_addr").value = roadAddr;
				} else if (jibunAddr !== '') {
					document.getElementById("stf_addr").value = jibunAddr;
				}
			}
		}).open();
	}
</script>