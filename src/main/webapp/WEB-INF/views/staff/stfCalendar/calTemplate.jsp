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

    $('#addCalendar').on("click", function() {
      var calInfo = {
        calTitle: $("#calTitle").val(),
        calContent: $("#calContent").val(),
        calStartDt: $("#calStartDt").val(),
        calEndDt: $("#calEndDt").val(),
      };

      calendar.addEvent(calInfo);

      // ProductionController로 데이터 전송
      $.ajax({
        url: "${pageContext.request.contextPath}/cal/production/addCal.do",
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify(calInfo),
        success: function(response) {
          console.log("이벤트가 성공적으로 추가되었습니다:", response);
        },
        error: function(jqXHR, textStatus, errorThrown) {
          console.error("발생", textStatus, errorThrown);
        }
      });

      // 모달 닫기
      $("#calendarModal").modal("hide");
    });

  });
</script>
    <div id='calendar'></div>
      <!-- modal 추가 -->
    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정추가</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">제목</label>
                        <input type="text" class="form-control" id="calTitle" name="calTitle">
                        <label for="calContent" class="col-form-label">내용</label>
                        <textarea class="form-control" id="calContent" name="calContent"></textarea>
                        <label for="taskId" class="col-form-label">시작 일자</label>
                        <input type="date" class="form-control" id="calStartDt" name="calStartDt">
                        <label for="taskId" class="col-form-label">종료 일자</label>
                        <input type="date" class="form-control" id="calEndDt" name="calEndDt">
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