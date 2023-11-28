<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<br>
	<h1 class="h3 mb-2 text-gray-800">과목 개설</h1>
	<p class="mb-4" style="color: red;">
		<i class="bi bi-exclamation-circle"></i> 과목은 생성 후 삭제할 수 없습니다. 필수 과목
		여부를 꼭 확인하고 생성해주십시오.
	</p>

	<form:form method="post"
		action="${pageContext.request.contextPath }/professor/subject/insertSubject.do"
		modelAttribute="subject" enctype="multipart/form-data">
		<form:hidden path="subNo" />
		<table class="table table-border">

			<tr>
				<th>단과대학</th>
				<td><select class="form-control" id="collegeSelect">
						<option disabled selected style="color: #999;">단과대학교를
							선택하세요.</option>
						<option>공과대학</option>
						<option>문과대학</option>
						<option>사범대학</option>
						<option>사회과학대학</option>
						<option>아트&디자인테크놀리지대학</option>
						<option>생명나노대학</option>
						<option>경상대학</option>
				</select></td>
			</tr>
			<tr>
				<th>전공</th>
				<td><form:select path="subMajCd" class="form-control"
						id="majorSelect">

					</form:select></td>
			</tr>
			<tr>
				<th>과목명</th>
				<td><form:input path="subNm" class="form-control" /> <form:errors
						path="subNm" class="error" /></td>
			</tr>
			<tr>
				<th>상태</th>
				<td><form:select path="subStatus" class="form-control">
						<form:option value="S01">활설화</form:option>
						<form:option value="S02">비활설화</form:option>
					</form:select> <form:errors path="subStatus" class="error" /></td>
			</tr>
			<tr>
				<th>구분</th>
				<td><form:select path="subType" class="form-control">
						<form:option value="OFF">오프라인</form:option>
						<form:option value="ON">온라인</form:option>
					</form:select> <form:errors path="subType" class="error" /></td>
			</tr>
			<tr>
				<th>필수 여부</th>
				<td><form:radiobutton path="subRequired" value="0" id="optionalRadio"/> 선택 과목
				<form:radiobutton path="subRequired" value="1" id="requiredRadio"/> 필수 과목</td>
			</tr>
			<tr id="gradeRow" style="display:none;">
				<th>대상 학년</th>
				<td><form:select path="seGrade">
						<form:option value="0">학년을 선택해주세요.</form:option>
						<form:option value="1">1학년</form:option>
						<form:option value="2">2학년</form:option>
						<form:option value="3">3학년</form:option>
						<form:option value="4">4학년</form:option>
					</form:select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="btn btn-primary"
					value="저장"> <input type="reset" class="btn btn-danger"
					value="취소"></td>
			</tr>
		</table>
	</form:form>

	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table me-1"></i> 과목 리스트
		</div>
		<div class="card-body">
			<table id="datatablesSimple">
				<thead>
					<tr>
						<th>과목이름</th>
						<th>상태</th>
						<th>구분</th>
						<th>전공</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty subList }">
						<tr>
							<td colspan="5">등록된 과목 없음</td>
						</tr>
					</c:if>
					<c:if test="${not empty subList }">
						<c:forEach items="${subList }" var="sub">
							<tr>
								<td>${sub.subNm}</td>
								<td>${sub.subStatus}</td>
								<td>${sub.subType}</td>
								<td>${sub.subMajCd}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>


<script>
	// 상위 셀렉트 변경 시 이벤트 처리
	document.getElementById('collegeSelect').addEventListener('change',
			function() {
				// 선택된 값 가져오기
				var selectedCollege = this.value;

				// 선택된 값에 따라 하위 셀렉트 옵션 동적으로 변경
				var majorSelect = document.getElementById('majorSelect');
				majorSelect.innerHTML = ''; // 기존 옵션 비우기

				// 선택된 단과대학에 따라 옵션 추가
				switch (selectedCollege) {
				case '공과대학':
					addOption(majorSelect, '멀티미디어공학과', 'MULTI');
					addOption(majorSelect, '컴퓨터공학과', 'CE');
					addOption(majorSelect, '정보통신공학과', 'ICE');
					addOption(majorSelect, '전기전자공학과', 'EEE');
					addOption(majorSelect, '기계공학과', 'ME');
					addOption(majorSelect, '화학공학과', 'CHEM');
					break;
				case '문과대학':
					addOption(majorSelect, '국어국문학과', 'KLL');
					addOption(majorSelect, '영어영문학과', 'ELL');
					addOption(majorSelect, '일어일문학과', 'JLL');
					addOption(majorSelect, '문헌정보학과', 'LIS');
					addOption(majorSelect, '사학과', 'HIS');
					break;
				case '사범대학':
					addOption(majorSelect, '국어교육과', 'KEU');
					addOption(majorSelect, '영어교육과', 'EEU');
					addOption(majorSelect, '역사교육과', 'HEU');
					addOption(majorSelect, '수학교육과', 'MEU');
					addOption(majorSelect, '미술교육과', 'AEU');
					break;
				case '사회과학대학':
					addOption(majorSelect, '행정학과', 'PA');
					addOption(majorSelect, '경찰학과', 'PS');
					addOption(majorSelect, '정치언론학과', 'PCS');
					addOption(majorSelect, '아동복지학과', 'CDG');
					addOption(majorSelect, '사회복지학과', 'SW');
					break;
				case '생명나노대학':
					addOption(majorSelect, '식품영양학과', 'FAN');
					addOption(majorSelect, '간호학과', 'NUR');
					addOption(majorSelect, '스포츠과학과', 'SS');
					addOption(majorSelect, '생명시스템과학과', 'BSB');
					addOption(majorSelect, '국어국문학과', 'KLL');
					break;
				case '아트&디자인테크놀리지대학':
					addOption(majorSelect, '패션디자인학과', 'FD');
					addOption(majorSelect, '미디어영상학과', 'MVC');
					addOption(majorSelect, '회화과', 'FA');
					addOption(majorSelect, '융합디자인학과', 'CDA');
					break;
				case '경상대학':
					addOption(majorSelect, '경영학과', 'BA');
					addOption(majorSelect, '회계학과', 'ACC');
					addOption(majorSelect, '경제학과', 'ECO');
					addOption(majorSelect, '호텔항공경영학과', 'HAM');
					addOption(majorSelect, '무역물류학과', 'GT');
					addOption(majorSelect, '경영정보학과', 'MIS');
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
	
	 // 필수 여부 라디오 버튼 변경 이벤트 처리
    document.getElementById('requiredRadio').addEventListener('click', function() {
        var gradeRow = document.getElementById('gradeRow');
        gradeRow.style.display = (this.checked) ? 'table-row' : 'none';
    });
	 
 // 선택 과목 라디오 버튼 변경 이벤트 처리
    document.getElementById('optionalRadio').addEventListener('click', function() {
        var gradeRow = document.getElementById('gradeRow');
        gradeRow.style.display = 'none';
    });
</script>
