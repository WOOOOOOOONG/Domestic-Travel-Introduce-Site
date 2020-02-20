<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%@page import="member.model.vo.MyPlan"%>
<%@page import="java.util.ArrayList"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)request.getSession().getAttribute("loginUser");
	
	ArrayList<MyPlan> planList = (ArrayList)request.getSession().getAttribute("planList");
	if(planList != null) {
		System.out.println(planList);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous">
</script>
<link
	href='<%= request.getContextPath() %>/resources/fullcalendar-4.3.1/packages/core/main.css'
	rel='stylesheet' />
<link
	href='<%= request.getContextPath() %>/resources/fullcalendar-4.3.1/packages/list/main.css'
	rel='stylesheet' />
<script
	src='<%= request.getContextPath() %>/resources/fullcalendar-4.3.1/packages/core/main.js'></script>
<script
	src='<%= request.getContextPath() %>/resources/fullcalendar-4.3.1/packages/list/main.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
	var initialLocaleCode = 'ko';
	clickId = 0;
    var calendarEl = document.getElementById('calendar');

    calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'list' ],

      locale: initialLocaleCode,
      
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'listDay,listWeek,dayGridMonth'
      },

      // customize the button names,
      // otherwise they'd all just say "list"
      views: {
        listDay: { buttonText: 'list day' },
        listWeek: { buttonText: 'list week' }
      },
      defaultView: 'listDay',
      defaultDate: sessionStorage.getItem("clickday"),
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2019-08-01'
        },
        {
          title: 'Long Event',
          start: '2019-08-07',
          end: '2019-08-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2019-08-09T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2019-08-16T16:00:00'
        },
        {
          title: 'Conference',
          start: '2019-08-11',
          end: '2019-08-13'
        },
        {
          title: 'Meeting',
          start: '2019-08-12T10:30:00',
          end: '2019-08-12T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2019-08-12T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2019-08-12T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2019-08-12T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2019-08-12T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2019-08-13T07:00:00'
        },
        {
          title: 'Click for Google',
          start: '2019-08-28'
        }
        <% if(planList != null) { %>
        	<% for(MyPlan p : planList) { %>
        		<% if(p.getmSeq() == loginUser.getM_seq()) {%>
        			,{
        				title: '<%= p.getpName()%>',
        				start: '<%= p.getStartDate() + "T" + p.getStartTime() %>',
        				end: '<%= p.getEndDate() + "T" + p.getEndTime() %>',
        				<% if(p.isFileBoard()) { %>
							imageurl: '<%= request.getContextPath() %>/resources/festival_uploadFile/<%= p.getFileName() %>',
						<% }else { %>
							imageurl: '<%= request.getContextPath() %>/resources/myplan_upload/<%= p.getFileName() %>',
						<% } %>
        				id: '<%= p.getpSeq() %>',
        				locationid: '<%= p.getmSeq() %>'
        			}
        		<% }%>
        	<% }%>
        <% }%>
      
      ]
      , eventRender:function(info) {   
    	  // image 보이게
    	  if (info.event.extendedProps.imageurl) {
              info.el.firstChild.innerHTML = "<img src='" + info.event.extendedProps.imageurl +"' width='40' height='40'>";
          }
    	  
    	  // 시간 처리
    	  if(calendar.getEventById(info.event.id).end != null) {
    		  var startMinute = "";
    		  var endMinute = "";
        	  if(calendar.getEventById(info.event.id).start.getMinutes() < 10) {
        		  startMinute = "0";
        	  }

        	  if(calendar.getEventById(info.event.id).end.getMinutes() < 10) {
        		  endMinute = "0";
        	  }
        	  var startTime = calendar.getEventById(info.event.id).start.getHours() + ":" + startMinute + calendar.getEventById(info.event.id).start.getMinutes();
    		  var endTime = calendar.getEventById(info.event.id).end.getHours() + ":" + endMinute + calendar.getEventById(info.event.id).end.getMinutes(); 
    		  info.el.firstChild.innerHTML = info.el.firstChild.innerHTML + startTime + "~" + endTime;
    	  }else {
    		  var minute = "";
        	  if(calendar.getEventById(info.event.id).start.getMinutes() < 10) {
        		  minute = "0";
        	  }
        	  var startTime = calendar.getEventById(info.event.id).start.getHours() + ":" + minute + calendar.getEventById(info.event.id).start.getMinutes();
    		  info.el.firstChild.innerHTML = info.el.firstChild.innerHTML + startTime + "~" + startTime;
    	  }
    	  
    	  
    	  // 날짜 처리
    	  if(calendar.getEventById(info.event.id).end != null) {
    		  var startDate = (calendar.getEventById(info.event.id).start.getFullYear()) + "-" + (calendar.getEventById(info.event.id).start.getMonth() + 1) + "-" + calendar.getEventById(info.event.id).start.getDate();
    		  var endDate = (calendar.getEventById(info.event.id).end.getFullYear()) + "-" + (calendar.getEventById(info.event.id).end.getMonth() + 1) + "-" + calendar.getEventById(info.event.id).end.getDate();
    		  info.el.lastChild.innerHTML = info.el.lastChild.innerHTML + "<br>" + startDate + " ~ " + endDate;
    	  }else {
    		  var startDate = (calendar.getEventById(info.event.id).start.getFullYear()) + "-" + (calendar.getEventById(info.event.id).start.getMonth() + 1) + "-" + calendar.getEventById(info.event.id).start.getDate();
    		  var endDate = (calendar.getEventById(info.event.id).start.getFullYear()) + "-" + (calendar.getEventById(info.event.id).start.getMonth() + 1) + "-" + calendar.getEventById(info.event.id).start.getDate();
    		  info.el.lastChild.innerHTML = info.el.lastChild.innerHTML + "<br>" + startDate + " ~ " + endDate;
    	  }
    	  
    	  if(info.event.end != null && info.event.end.getMonth() <= 8) {
    		  $(".fc-list-item-time").html($(".fc-list-item-time").html() + info.event.end.getFullYear() + "-0" + (info.event.end.getMonth() + 1) + "-" + info.event.end.getDate());
    	  }else if(info.event.end != null) {
    		  $(".fc-list-item-time").html($(".fc-list-item-time").html() + info.event.end.getFullYear() + "-" + (info.event.end.getMonth() + 1) + "-" + info.event.end.getDate());
		  }
    	  
    	  info.el.lastChild.innerHTML = info.el.lastChild.innerHTML + "<button type='button' class='deleteBtn' style='position:absolute; left:91%; margin-top:-2px; margin-bottom:5px;' onclick='deletePlan();'>삭제</button>"
    	  
      }
      , eventClick: function(info) {
    	  clickId = info.event.id;
      }
    });
    calendar.render();
    
    calendar.getAvailableLocaleCodes().forEach(function(localeCode) {
        var optionEl = document.createElement('option');
        optionEl.value = localeCode;
        optionEl.selected = localeCode == initialLocaleCode;
        optionEl.innerText = localeCode;
        /* localeSelectorEl.appendChild(optionEl); */
      });
    
	
  });
  	
  function deletePlan() {
	  if(window.confirm('삭제하시겠습니까?')) {
		  var removeEvent = calendar.getEventById(clickId);
		  $('input[name=clickId]').val(clickId);
		  removeEvent.remove();
		  $("#deleteClick").submit();
	  }
  }
</script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}

.fc-listWeek-button, .fc-listDay-button {
	display: none;
}

.fc-today-button {
	position: absolute;
	left: 89%;
}

.fc-listWeek-view {
	display: none;
}
</style>
</head>
<body>
	
	<div id='calendar'></div>
	<button
		onclick="location.href='<%= request.getContextPath() %>/views/myPage/PlanDetail.jsp'">추가</button>
	<form id="deleteClick" method="post" action="<%= request.getContextPath() %>/delete.pl">
		<input type="hidden" name='clickId' value="0">
	</form>
	<script>
  $(function() {
	  // day로 자동시작
	  $(".fc-listDay-button").trigger("click");
  });
  
  <% if(request.getSession().getAttribute("msg") != null) { %>
	alert('<%=request.getSession().getAttribute("msg") %>');
	<% request.getSession().setAttribute("msg", null); %>
<% } %>
  </script>
</body>
</html>
