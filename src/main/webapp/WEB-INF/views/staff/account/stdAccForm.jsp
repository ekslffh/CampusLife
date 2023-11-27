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
								<form:form method="post" modelAttribute="std" id="stdForm"
									enctype="multipart/form-data">
									<div style="text-align: center; height: 65px;">
										<h3>
											<b>학생 계정 생성</b>
										</h3>
									</div>
									<hr style="margin: 0px;">
									<table class="table table-border">
										<tr>
											<th>이름</th>
											<td style="padding: 9px 0px 9px 15px;">
											<form:input
													path="stdNm" class="form-control" maxlength='10'
													style="width:200px;" />
											<form:errors path="stdNm" class="error" /></td>
										</tr>
										<tr>
											<th>생년월일</th>
											<td style="padding: 9px 0px 9px 15px;">
											<form:input path="stdBir" class="form-control" type="date" style="width:200px;" />
 											<form:errors path="stdBir" class="error" />
 											</td> 
										</tr>
										<tr>
											<th>전화번호</th>
											<td style="padding: 9px 0px 9px 15px;">
											<form:input path="stdTel" class="form-control" maxlength='15' style="width:200px;" />
											</td>
										</tr>
										<tr>
											<th>성별</th>
											<td style="padding: 9px 0px 9px 15px;">
												<label> 
													<input type="radio" name="stdGender" value="F" id="femaleRadio" /> 여성 <br>
												</label> 
												
												<label> 
													<input type="radio" name="stdGender" value="M" id="maleRadio" /> 남성
												</label>
											</td>
										</tr>

										<tr>
											<th>이메일</th>
											<td style="padding: 9px 0px 9px 15px;">
												<div style="display: flex; align-items: center;">
													<form:input path="stdEmail" class="form-control" style="width:200px;" />
												</div>
											</td>
										</tr>
										<tr>
											<th>우편번호</th>
											<td
												style="display: flex; align-items: center; padding: 9px 0px 9px 15px;">
												<form:input id="std_postNo" path="stdPostNo" class="form-control" style="width:200px;" /> &nbsp;&nbsp; 
													<input class="btn btn-light btn-sm" onclick="findAddr()" value="주소찾기" style="width: 80px;"> 
												<form:errors path="stdPostNo" class="error" />
											</td>
										</tr>
										<tr>
											<th>주소</th>
											<td style="padding: 9px 0px 9px 15px;">
												<form:input id="std_addr" path="stdAddr" class="form-control" />
											</td>
										</tr>
										<tr>
											<th>상세 주소</th>
											<td style="padding: 9px 0px 9px 15px;">
												<form:input path="stdDetailAddr" class="form-control" style="width:200px;" />
											</td>
										</tr>
										<tr>
											<th>국적</th>
											<td style="padding: 9px 0px 9px 15px;">
												<form:input path="stdCountry" class="form-control" style="width:200px;" />
											</td>
										</tr>
										<tr>
											<th>단과대학</th>
											<td style="padding: 9px 0px 9px 15px;">
											<select id="colSelect" class="form-control" style="width:200px;">
													<option>-- 선택하세요 --</option>
													<option>공과대학</option>
													<option>문과대학</option>
													<option>사범대학</option>
													<option>사회과학대학</option>
													<option>아트&디자인테크놀로지대학</option>
													<option>생명나노대학</option>
													<option>경상대학</option>
											</select>
											</td>
										</tr>
										<tr>
											<th>전공</th>
											<td style="display: flex; align-items: center; padding: 9px 0px 9px 15px;">
												<form:select path="stdMajCd" id="majSelect" class="form-control" style="width:200px;" /> &nbsp;&nbsp; 
<!-- 												<input class="btn btn-light btn-sm" onclick="findMajor()" value="전공 찾기" style="width: 80px;">  -->
											</td>
										</tr>
										<tr>
											<th>프로필</th>
											<td style="padding: 9px 0px 9px 15px;">
<!-- 											<input type="file" name="stdProfile" multiple /> -->
											</td>
										</tr>
									</table>

									<div
										style="text-align: right; height: 100px; padding: 10px 0px 20px 20px; width: 701px;">
										<input class="btn btn-primary" type="submit" value="등록">
										<input class="btn btn-dark" type="reset" value="취소"> <a
											class="btn gray_btn"
											href="<c:url value=''/>">목록</a>
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


<!-- 전공 찾기 검색,,? -->
<script>
   // 상위 셀렉트 변경 시 이벤트 처리
   document.getElementById('colSelect').addEventListener('change', function() {
      // 선택된 값 가져오기
      var selectedCollege = this.value;

      // 선택된 값에 따라 하위 셀렉트 옵션 동적으로 변경
      var majorSelect = document.getElementById('majSelect');
      majSelect.innerHTML = ''; // 기존 옵션 비우기

      // 선택된 단과대학에 따라 옵션 추가
      switch (selectedCollege) {
         case '공과대학':
            addOption(majSelect, '멀티미디어공학과', 'MULTI');
            addOption(majSelect, '컴퓨터공학과', 'CE');
            addOption(majSelect, '정보통신공학과', 'ICE');
            addOption(majSelect, '전기전자공학과', 'EEE');
            addOption(majSelect, '기계공학과', 'ME');
            addOption(majSelect, '화학공학과', 'CHEM');
            break;
         case '문과대학':
            addOption(majSelect, '국어국문학과', 'KLL');
            addOption(majSelect, '영어영문학과', 'ELL');
            addOption(majSelect, '일어일문학과', 'JLL');
            addOption(majSelect, '문헌정보학과', 'LIS');
            addOption(majSelect, '사학과', 'HIS');
            break;
         case '사범대학':
        	addOption(majSelect, '국어교육과', 'KEU'); 
        	addOption(majSelect, '영어교육과', 'EEU'); 
        	addOption(majSelect, '역사교육과', 'HEU'); 
        	addOption(majSelect, '수학교육과', 'MEU'); 
        	addOption(majSelect, '미술교육과', 'AEU'); 
        	break;
         case '사회과학대학':
         	addOption(majSelect, '행정학과', 'PA'); 
         	addOption(majSelect, '경찰학과', 'PS'); 
         	addOption(majSelect, '정치언론학과', 'PCS'); 
         	addOption(majSelect, '아동복지학과', 'CDG'); 
         	addOption(majSelect, '사회복지학과', 'SW');
         	break;
         case '생명나노대학':
         	addOption(majSelect, '식품영양학과', 'FAN'); 
         	addOption(majSelect, '간호학과', 'NUR'); 
         	addOption(majSelect, '스포츠과학과', 'SS'); 
         	addOption(majSelect, '생명시스템과학과', 'BSB'); 
         	addOption(majSelect, '국어국문학과', 'KLL');
         	break;
         case '아트&디자인테크놀리지대학':
         	addOption(majlect, '패션디자인학과', 'FD'); 
         	addOption(majlect, '미디어영상학과', 'MVC'); 
         	addOption(majlect, '회화과', 'FA'); 
         	addOption(majlect, '융합디자인학과', 'CDA'); 
         case '경상대학':
         	addOption(majSelect, '경영학과', 'BA'); 
         	addOption(majSelect, '회계학과', 'ACC'); 
         	addOption(majSelect, '경제학과', 'ECO'); 
         	addOption(majSelect, '호텔항공경영학과', 'HAM'); 
         	addOption(majSelect, '무역물류학과', 'GT');	
         	addOption(majSelect, '경영정보학과', 'MIS');
         	break;
      }
   });

   // 옵션을 동적으로 추가하는 함수
   function addOption(select, text, value) {
      var option = document.createElement('option');
      option.text = text;
      option.value = value;
      select.add(option);
   }
</script>
 

<!-- 우편번호 api -->
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
				document.getElementById('std_postNo').value = data.zonecode;
				if (roadAddr !== '') {
					document.getElementById("std_addr").value = roadAddr;
				} else if (jibunAddr !== '') {
					document.getElementById("std_addr").value = jibunAddr;
				}
			}
		}).open();
	}
</script>
