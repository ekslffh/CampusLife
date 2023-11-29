<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="../assets/js/color-modes.js"></script>
    
<main class="d-flex flex-nowrap">
  <%@ include file="/WEB-INF/views/professor/lecture/lectureSidebar.jsp"%>

  <div id="content">
  </div>
</main>

<!-- <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->
<!-- <script src="sidebars.js"></script></body> -->
<script type="text/javascript">
	$(function() {
		// a태그이면서 data-url을 갖고있는 요소들을 찾아서 클릭이벤트 주기
		// 1. acitve 클래스 추가, 2. 해당 url을 통해서 값받아와서 요소 넣어주기
		$('a[data-url]').click(function() {
			console.log("click!!!");
			$('a').removeClass('active');
			$(this).addClass('active');
			
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
	})
</script>