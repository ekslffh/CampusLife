<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- <script src="../assets/js/color-modes.js"></script> -->
   
<style>
  #content2 {
    flex: 1; /* 1로 설정하여 나머지 공간을 100% 차지하도록 함 */
    padding: 20px; /* 원하는 패딩 값 적용 (선택사항) */
    /* 다른 스타일 속성들을 필요에 따라 추가할 수 있음 */
  }
</style>
 
<main class="d-flex flex-nowrap">
  <%@ include file="/WEB-INF/views/student/lecture/lectureSidebar.jsp"%>

  <div id="content2">
  </div>
</main>

<!-- <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->
<!-- <script src="sidebars.js"></script></body> -->
<script type="text/javascript">
	$(function() {
		
		// url에 contextPath가 포함되어 있는지 판별하는 함수
		function isContextPathIncluded(url) {
		    // 현재 페이지의 URL을 가져오기
		    let currentUrl = window.location.href;

		    // 현재 페이지의 contextPath 추출
		    let contextPath = getContextPathFromUrl(currentUrl);

		    // 비교
		    return url.includes(contextPath);
		}
		
		function getContextPathFromUrl(url) {
		    // URL에서 path 부분 추출
		    let path = new URL(url).pathname;

		    // path에서 contextPath 부분 추출
		    let contextPath = path.split('/')[1]; // 예: "/myapp"에서 "myapp" 추출

		    return '/' + contextPath; // 예: "myapp"에서 "/myapp"로 변환
		}
		
		// url을 받아서 비동기로 html페이지를 요청하고 content요소에 넣어주는 역할
		function fillContent(url) {
			// falsy한 값이면 함수종료
			if (!url) return;
			// contextPath가 포함되어 있지 않으면 포함시켜주기
			if (!isContextPathIncluded(url)) {
				url = '${pageContext.request.contextPath }' + url
			}
			let settings = {
				url : url,
				method : 'get',
				dataType : 'html',
				success : function(data) {
					$('#content2').html(data);
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			}
			$.ajax(settings);
		}
		
		// a태그이면서 data-url을 갖고있는 요소들을 찾아서 클릭이벤트 주기
		// 1. acitve 클래스 추가, 2. 해당 url을 통해서 값받아와서 요소 넣어주기
		$('a[data-url]').click(function() {
			$('a').removeClass('active');
			$(this).addClass('active');
			
			// 강의계획서, 과제, .. 어떤 메뉴를 클릭했는지 이름가져오기
			let target = $(this).text();
			
			let url = $(this).data('url');
			let settings = {
				url : url,
				method : 'get',
				dataType : 'html',
				success : function(data) {
					$(content2).html(data);
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			}
			$.ajax(settings);
		});
		
		// data-url가지고 있는 요소 찾아서 클릭이벤트 강제로 발생시키기.
		var secondElement = $('[data-url]:eq(0)');
		secondElement.trigger('click');
		
		// content하위의 자식요소들에게 이벤트 전파 (event delegation)
		$('#content2')
			.on('click', 'a[data-url]', function(event) {
				event.preventDefault();
				let url = $(this).data('url');
				fillContent(url);
			})
			.on('submit', '.ajaxForm', function(event) {
				event.preventDefault();
				let formData = new FormData(this);
				
				// FormData의 키-값 쌍 확인
			    for (const pair of formData.entries()) {
			        console.log(pair[0] + ', ' + pair[1]);
			    }
				console.log('formData', formData);
				let $submitButton = $(this).find('input[type=submit]');
				let url = $submitButton.data('url');
				let settings = {
					url : url,
					method : 'post',
					data: formData,
				 	processData: false,  // 데이터를 query string	으로 변환하지 않음
			        contentType: false,  // 데이터 형식을 설정하지 않음
					dataType : 'json',
					success : function(data) {
						console.log(data);
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				}
				$.ajax(settings);
			})
	})
</script>