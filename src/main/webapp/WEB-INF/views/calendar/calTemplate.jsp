<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>

<script>
  document.addEventListener('DOMContentLoaded', function() {
    // 공통 FullCalendar 설정
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

    // FullCalendar을 이용한 일정 표시
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, commonCalendarOptions);
    calendar.render();

    // 서버에서 데이터 가져오기
    var request = $.ajax({
      url: "/production/monthPlan",
      method: "GET",
      dataType: "json"
    });

    request.done(function(data) {
      console.log(data);

      // 가져온 데이터로 캘린더 업데이트
      var calendarWithData = new FullCalendar.Calendar(calendarEl, {
        ...commonCalendarOptions,  // 공통 설정 재사용
        events: data
      });

      calendarWithData.render();
    });

    request.fail(function(jqXHR, textStatus) {
      alert("요청 실패: " + textStatus);
    });

    $('#addCalendar').on("click", function() {
      var newEvent = {
        title: $("#calendar_title").val(),
        content: $("#calendar_content").val(),
        start: $("#calendar_start_date").val(),
        end: $("#calendar_end_date").val(),
      };

      // 이벤트를 events 배열에 추가
      calendar.addEvent(newEvent);

      // 서버로 데이터 전송
      $.ajax({
        url: "/production/addEvent", // 서버에 데이터를 전송할 주소
        method: "POST", // POST 방식으로 전송
        contentType: "application/json",
        data: JSON.stringify(newEvent),
        success: function(response) {
          console.log("이벤트가 성공적으로 추가되었습니다:", response);
        },
        error: function(jqXHR, textStatus, errorThrown) {
          console.error("발생", textStatus, errorThrown);
        }
      });

      // 모달을 닫기
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
                        <input type="text" class="form-control" id="calendar_title" name="calendar_title">
                        <label for="taskId" class="col-form-label">내용</label>
                        <input type="text" class="form-control" id="calendar_content" name="calendar_content">
                        <label for="taskId" class="col-form-label">시작 일자</label>
                        <input type="date" class="form-control" id="calendar_start_date" name="calendar_start_date">
                        <label for="taskId" class="col-form-label">종료 일자</label>
                        <input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date">
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