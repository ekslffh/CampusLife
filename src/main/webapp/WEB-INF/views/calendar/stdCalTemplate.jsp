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
        right: ''
      },
      editable: true,
      displayEventTime: false,
      eventClick: function(info) {
    	  	var startDate = info.event.start.toLocaleDateString();
    	  	// 밑에서 json타입으로 날짜를 +1일 해서 가져왔기 때문에 상세 조회를 올바르게 하기 위해서 여기서는 -1을 해준다.
    	  	var endDate = info.event.end ? new Date(info.event.end.getTime() - 86400000).toLocaleDateString() : startDate;

    	    $('#eventModalTitle').text(info.event.title);
    	    $('#eventModalContent').text(info.event.extendedProps.content);
    	    $('#eventModalDateTime').html(startDate + ' ~ ' + endDate);
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
      console.log(data);

      // 가져온 일정으로 캘린더 업뎃
      var events = data.map(function(item) {
    	return {
      		title: item.title,
      		start: new Date(item.start[0], item.start[1] - 1, item.start[2]),
      		end: new Date(item.end[0], item.end[1] - 1, item.end[2]+1),
      		content: item.content
    		};
  		});
		
      // events에 저장된 캘린더의 정보로 다시 render
      calendar.addEventSource(events);
      calendarWithData.render();
    });
  });
</script>
<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">일정 상세 정보</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p><strong>제   목:</strong> <span id="eventModalTitle"></span></p>
        <p><strong>일   시:</strong> <span id="eventModalDateTime"></span></p>
        <p><strong>내   용:</strong> <span id="eventModalContent"></span></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<div id='calendar'></div>