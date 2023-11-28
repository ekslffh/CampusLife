<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    // FullCalendar 설정
    var commonCalendarOptions = {
      initialView: 'dayGridMonth',
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'addEventButton'
      },
      customButtons: {
        addEventButton: {
          text: '일정추가',
          click: function() {
            $("#calendarModal").modal("show");
          }
        }
      },
      editable: true,
      displayEventTime: false,
      eventClick: function(info) {
    	var calId = info.event.extendedProps.calId;
    	console.log(calId);
  	  	var startDate = info.event.start.toLocaleDateString();
  	  	// 밑에서 json타입으로 날짜를 +1일 해서 가져왔기 때문에 상세 조회를 올바르게 하기 위해서 여기서는 -1을 해준다.
  	  	var endDate = info.event.end ? new Date(info.event.end.getTime() - 86400000).toLocaleDateString() : startDate;
		
  	    $('#eventModalCalId').val(calId);
  	  	$('#eventModalTitle').val(info.event.title);
     	$('#eventModalContent').val(info.event.extendedProps.content);
      	$('#eventModalStartDt').val(startDate);
      	$('#eventModalEndDt').val(endDate);
        $('#eventModal').modal('show');
      }
    };

    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, commonCalendarOptions);
    calendar.render();

    // DB에서 저장된 일정 가져오기
    var request = $.ajax({
    	url: "${pageContext.request.contextPath}/cal/production/monthPlan",
      method: "GET",
      dataType: "json"
    });

    request.done(function(data) {

      // 가져온 일정으로 캘린더 업뎃
     var events = data.map(function(item) {
    	return {
    		calId : item.calId,
      		title: item.title,
      		start: new Date(item.start[0], item.start[1] - 1, item.start[2]),
      		end: new Date(item.end[0], item.end[1] - 1, item.end[2]+1),
      		content: item.content
    		};
  		});
		
  // events에 저장된 캘린더의 정보로 다시 render
     calendar.addEventSource(events);
     calendar.render();
    });

    request.fail(function(jqXHR, textStatus) {
      alert("요청 실패: " + textStatus);
    });

    $('#addCalendar').on("click", function() {
      var calInfo = {
        calTitle: $("#calTitle").val(),
        calContent: $("#calContent").val(),
        calStartDt: $("#calStartDt").val(),
        calEndDt: $("#calEndDt").val()
      };

      calendar.addEvent(calInfo);

      // ProductionController로 데이터 전송
      $.ajax({
        url: "${pageContext.request.contextPath}/cal/production/addCal.do",
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify(calInfo),
        success: function(response) {
          console.log("일정이 추가되었습니다:", response);
          location.reload();
        },
        error: function(jqXHR, textStatus, errorThrown) {
          console.error("발생", textStatus, errorThrown);
        }
      });

      // 모달 닫기
      $("#calendarModal").modal("hide");
    });
    
    $('#updateCal').on("click", function(){
    	 var updateCalInfo = {
    		calId: $('#eventModalCalId').val(),
    		calTitle: $("#eventModalTitle").val(),
    		calContent: $("#eventModalContent").val(),
    		calStartDt: $("#eventModalStartDt").val(),
    		calEndDt: $("#eventModalEndDt").val()
    	};
    	 
    	 console.log(updateCalInfo);
    	 
    	 // ProductionController로 데이터 전송
         $.ajax({
           url: "${pageContext.request.contextPath}/cal/production/updateCal.do",
           method: "POST",
           contentType: "application/json",
           data: JSON.stringify(updateCalInfo),
           success: function(response) {
             console.log("일정이 수정되었습니다:", response);
             location.reload();
           },
         });
    	
    	// 모달 닫기
        $("#eventModal").modal("hide");
    });
    
    $('#deleteCal').on("click", function(){
    	   var calId = $('#eventModalCalId').val();
    	   console.log(calId)
    	   // ProductionController로 데이터 전송
    	   $.ajax({
    	      url: "${pageContext.request.contextPath}/cal/production/deleteCal.do",
    	      method: "POST",
    	      contentType: "application/json",
    	      data: calId,
    	      success: function(response) {
    	         console.log("일정이 삭제되었습니다:", response);
    	         location.reload();
    	      },
    	   });

    	   // 모달 닫기
    	   $("#eventModal").modal("hide");
    });
  });
</script>
<div id='calendar'></div>
<!-- 일정 등록 모달 추가 -->
<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">일정추가</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="taskId" class="col-form-label">제목</label> <input
						type="text" class="form-control" id="calTitle" name="calTitle">
					<label for="calContent" class="col-form-label">내용</label>
					<textarea class="form-control" id="calContent" name="calContent"></textarea>
					<label for="taskId" class="col-form-label">시작 일자</label> <input
						type="date" class="form-control" id="calStartDt" name="calStartDt">
					<label for="taskId" class="col-form-label">종료 일자</label> <input
						type="date" class="form-control" id="calEndDt" name="calEndDt">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-warning" id="addCalendar">추가</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal"
					id="sprintSettingModalClose">취소</button>
			</div>
		</div>
	</div>
</div>

<!-- 일정 상세조회 모달 추가 -->
<div class="modal fade" id="eventModal" tabindex="-1" role="dialog"
    aria-labelledby="eventModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="eventModalLabel">일정 상세조회</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                	<input type="hidden" id="eventModalCalId"/>
					<label for="taskId" class="col-form-label">제목</label> <input
						type="text" class="form-control" id="eventModalTitle" name="eventModalTitle">
					<label for="calContent" class="col-form-label">내용</label>
					<textarea class="form-control" id="eventModalContent" name="eventModalContent"></textarea>
					<label for="taskId" class="col-form-label">시작 일자</label> <input
						type="date" class="form-control" id="eventModalStartDt" name="eventModalStartDt">
					<label for="taskId" class="col-form-label">종료 일자</label> <input
						type="date" class="form-control" id="eventModalEndDt" name="eventModalEndDt">
				</div>
            </div>
            <div class="modal-footer">
            	<button type="button" class="btn btn-primary" id="updateCal">수정</button>
            	<button type="button" class="btn btn-danger" id="deleteCal">삭제</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>