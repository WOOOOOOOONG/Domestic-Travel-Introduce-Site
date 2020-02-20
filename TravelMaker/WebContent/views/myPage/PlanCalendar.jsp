<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="member.model.vo.Member" %>
<%@page import="member.model.vo.MyPlan" %>
<%@page import="java.util.ArrayList" %>
<%
	ArrayList<MyPlan> planList = (ArrayList)request.getSession().getAttribute("planList");	
	Member loginUser2 = (Member)request.getSession().getAttribute("loginUser");
	if(!planList.isEmpty()) {
		System.out.println(planList);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script
  src="https://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous">
</script>
<link href='<%= request.getContextPath() %>/resources/fullcalendar-4.3.1/packages/core/main.css' rel='stylesheet' />
<link href='<%= request.getContextPath() %>/resources/fullcalendar-4.3.1/packages/daygrid/main.css' rel='stylesheet' />
<link href='<%= request.getContextPath() %>/resources/fullcalendar-4.3.1/packages/timegrid/main.css' rel='stylesheet' />
<link href='<%= request.getContextPath() %>/resources/fullcalendar-4.3.1/packages/list/main.css' rel='stylesheet' />
<script src='<%= request.getContextPath() %>/resources/fullcalendar-4.3.1/packages/core/main.js'></script>
<script src='<%= request.getContextPath() %>/resources/fullcalendar-4.3.1/packages/core/locales-all.js'></script>
<script src='<%= request.getContextPath() %>/resources/fullcalendar-4.3.1/packages/interaction/main.js'></script>
<script src='<%= request.getContextPath() %>/resources/fullcalendar-4.3.1/packages/daygrid/main.js'></script>
<script src='<%= request.getContextPath() %>/resources/fullcalendar-4.3.1/packages/timegrid/main.js'></script>
<script src='<%= request.getContextPath() %>/resources/fullcalendar-4.3.1/packages/list/main.js'></script>
<script>
	$(function() {
		 $('.fc-unselectable').css('user-select','all');
	});

  document.addEventListener('DOMContentLoaded', function() {
	  var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();
		if(dd<10) {
		    dd='0'+dd
		} 
		if(mm<10) {
		    mm='0'+mm
		} 
		today = yyyy + '-' + mm + '-' + dd;

    var initialLocaleCode = 'ko';
    var localeSelectorEl = document.getElementById('locale-selector');
    var calendarEl = document.getElementById('calendar');

    calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,listMonth'
      },
      defaultDate: today,
      locale: initialLocaleCode,
      buttonIcons: false, // show the prev/next text
      weekNumbers: true,
      //navLinks: true,  can click day/week names to navigate views
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
          start: '2019-08-13T07:00:00',
        },
        {
          start: '2019-08-28',
          imageurl: '<%= request.getContextPath() %>/resources/images/강원도.jpg'
        }
        <% if(!planList.isEmpty()) { %>
    		<% for(MyPlan p : planList) { %>
    			<% if(p.getmSeq() == loginUser2.getM_seq()) {%>
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
    					locationid: '<%= p.getmSeq() %>',
    					<% if(p.getUrl() != null && p.getUrl() != "") { %>
    					url: '<%= p.getUrl() %>'
    					<% } %>
    				}
    			<% }%>
    		<% }%>
    	<% }%>
      ]
      ,dateClick: function(info) {
    	  sessionStorage.setItem("clickday", info.dateStr);
    	  var left = (screen.width/2)-350;
    	  var top = (screen.height/2)-300;
    	  var url = "<%= request.getContextPath() %>/views/myPage/PlanList.jsp";
    	  var uploadWin = window.open(url,"Calendar","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=700, height=600" + ",top=" + top + ",left=" + left);
    	  uploadWin.moveTo(left, top);
    	  uploadWin.focus();
	  }
      , eventRender:function(info) {   
    	  <% if(!planList.isEmpty()) { %>
    	  	if (info.event.extendedProps.imageurl) {
           	   info.el.firstChild.innerHTML = "<img src='" + info.event.extendedProps.imageurl +"' width='60' height='40' style='display:block; margin-left:auto; margin-right:auto;'>" + "<div style='text-align:center'>" + info.event.title + "</div>";
    	  	}
    	  <% } %>
      }
      , eventClick:function(info) {
    	  console.log(info.event.start);
    	  if(info.event.start.getMonth() <= 8) {
    		  sessionStorage.setItem("clickday", info.event.start.getFullYear() + "-0" + (info.event.start.getMonth() + 1) + "-" + info.event.start.getDate());
    	  }else {
    		  sessionStorage.setItem("clickday", info.event.start.getFullYear() + "-" + (info.event.start.getMonth() + 1) + "-" + info.event.start.getDate());
    	  }
    	  
    	  var left = (screen.width/2)-350;
    	  var top = (screen.height/2)-300;
    	  var url = "<%= request.getContextPath() %>/views/myPage/PlanList.jsp";
    	  var uploadWin = window.open(url,"Calendar","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=700, height=600" + ",top=" + top + ",left=" + left);
    	  uploadWin.moveTo(left, top);
    	  uploadWin.focus();
      }
      
    });

    calendar.render();

    // build the locale selector's options
    calendar.getAvailableLocaleCodes().forEach(function(localeCode) {
      var optionEl = document.createElement('option');
      optionEl.value = localeCode;
      optionEl.selected = localeCode == initialLocaleCode;
      optionEl.innerText = localeCode;
      /* localeSelectorEl.appendChild(optionEl); */
    });

  });
</script>
<style>

  #calendar {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #top {
    background: #eee;
    border-bottom: 1px solid #ddd;
    padding: 0 10px;
    line-height: 40px;
    font-size: 12px;
  }

  #calendar {
    max-width: 900px;
    margin: 0 auto;
    padding: 0 10px;
    z-index:-1;
    <%-- background-image : url(<%= request.getContextPath() %>/resources/images/PlanBackground.jpeg);
    background-size : 100%;
    /* opacity:0.5!important; */
    filter:alpha(opacity=50);
    z-index:-1;
    width:100%;
    height:100%; --%>
  }
	
  .fc-rigid {
  	cursor: pointer;
  	/* fc-widget-content fc-week-number */
  }
  
  .fc-week-number {
  	display:none;
  }
  
</style>
</head>
<body>
  <!-- <div id='top'>

    Locales:
    <select id='locale-selector'></select>

  </div> -->
  <div id='calendar' style="user-select:all"></div>

</body>
</html>