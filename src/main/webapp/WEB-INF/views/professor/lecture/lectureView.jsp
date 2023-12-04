<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- <script src="../assets/js/color-modes.js"></script> -->
   
<style>
  #content {
    flex: 1; /* 1로 설정하여 나머지 공간을 100% 차지하도록 함 */
    padding: 20px; /* 원하는 패딩 값 적용 (선택사항) */
    /* 다른 스타일 속성들을 필요에 따라 추가할 수 있음 */
  }
</style>
 
<main class="d-flex flex-nowrap">
  <%@ include file="/WEB-INF/views/professor/lecture/lectureSidebar.jsp"%>

  <div id="content">
  </div>
</main>

<script type="text/javascript">
	$(function() {
		function fillContent(url) {
			if (!url) return;
			let settings = {
				url : '${pageContext.request.contextPath }' + url,
				method : 'get',
				dataType : 'html',
				success : function(data) {
					$('#content').html(data);
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
					$(content).html(data);
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
		$('#content')
			.on('click', 'a[data-url]', function(event) {
				event.preventDefault();
				let url = $(this).data('url');
				let settings = {
					url : url,
					method : 'get',
					dataType : 'html',
					success : function(data) {
						$('#content').html(data);
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				}
				$.ajax(settings);
			})
			.on('submit', '#asForm', function(event) {
				event.preventDefault();
				var formData = $(this).serialize();
				let url = $('input[type=submit]').data('url');
				let settings = {
					url : url,
					data: formData,
					method : 'post',
					dataType : 'json',
					success : function(response) {
						if (response.message) {
							alert(response.message);
						}
						if (response.redirectUrl) {
							fillContent(response.redirectUrl);
						}
					},
					error : function(response) {
						let data = response.responseJSON;
						if (data.message) {
							alert(data.message);
						}
						if (data.redirectUrl) {
							fillContent(response.redirectUrl);
						}
						if (data.fieldErrors) {
							for (let fieldName in data.fieldErrors) {
								let fieldMessage = data.fieldErrors[fieldName];
								$('span[data-target=' + fieldName + ']').text(fieldMessage);
							}
						}
					}
				}
				$.ajax(settings);
			})
			.on('click', '#del_btn', function() {
				if (confirm("정말로 삭제하시겠습니까?")) {
					let url = $(this).data('url');
					let settings = {
						url : url,
						method : 'get',
						dataType : 'json',
						success : function(data) {
							if (data.message) {
								alert(data.message);
							}
							if (data.redirectUrl) {
								fillContent(data.redirectUrl);
							}
						},
						error : function(response) {
							let data = response.responseJSON;
							if (data.message) {
								alert(data.message);
							}
							if (data.redirectUrl) {
								fillContent(data.redirectUrl);
							}
						}
					}
					$.ajax(settings);
				} else {
					alert("삭제가 취소되었습니다.");
				}
			});
	});
</script>