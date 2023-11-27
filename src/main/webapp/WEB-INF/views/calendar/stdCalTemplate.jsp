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
      displayEventTime: false
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

    request.fail(function(jqXHR, textStatus) {
      alert("요청 실패: " + textStatus);
    });
  });
</script>
    <div id='calendar'></div>