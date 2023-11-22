<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    </script>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
  <script>
  $(function(){
		
		var request = $.ajax({
			url: "/production/monthPlan",
		  method: "GET",
		  dataType: "json"
		});
		 
		request.done(function( data ) {
			console.log(data);
				
				var calendarEl = document.getElementById('calendar');
				
			    var calendar = new FullCalendar.Calendar(calendarEl, {
			      initialView: 'dayGridMonth',
			      headerToolbar: {
			        left: 'prev,next today',
			        center: 'title',
			        right: 'dayGridMonth,timeGridWeek,timeGridDay'
			      },
			      events: data
			    });
		
			    calendar.render();								
		});
		 
		request.fail(function( jqXHR, textStatus ) {
		  alert( "Request failed: " + textStatus );
		});
});
  </script>
</html>
