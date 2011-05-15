<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.calendar.Month,java.util.*,java.io.*,java.sql.*,com.calendar.*"%>
<%@ include file="resources.jsp"%>

<html>
<head>
<title>FitBook Calendar</title>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<%
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
	%>

	<div id="masthead">
		<ul id="top_menu">
			<%
				if (user != null) {
			%>
			<li><a href="<%=userService.createLogoutURL("/index.jsp")%>">Log Off</a></li>
			<%
				} else {
			%>
			<li><a href="<%=userService.createLoginURL(request.getRequestURI())%>">Log In</a></li>
			<%
				}
 			%>
			<li><a href="/athlete/references.jsp">References</a></li>
			<%
				if (user != null) {
			%>
			<li><a href="/athlete/statistics.jsp">Statistics</a></li>
			<%
				}
 			%>
			<li><a href="/athlete/calendar.jsp">Calendar</a></li>
			<li><a href="/index.jsp">Home</a></li>
		</ul>
		<div id="filler"></div>

		<%
			if (user != null) {
		%>
		<div id="user_container">
			<div id="user_info">
				<li>&nbsp;&nbsp;&nbsp;</li>
				<li>Welcome, <font color="#99b910">user</font>!
				<br>Modify your <a href="/athlete/settings.jsp">settings!</a><br>Last logged in: 00:00</li>
				<li><img src="/images/silhouette.gif" width="45px" height="45px" border="1px" /></li>
			</div>
		</div>
		<%
			}
 		%>
	</div>

	<div id="page_content">

		<table><tr><td class="col1_calendar">
		<div class="roundcont_calendar">
			<div class="roundtop_calendar">
				<img src="/images/topl.gif" alt="" width="15" height="15" class="corner" style="display: none" />
			</div>

			<table cellspacing="3" cellpadding="4" height="350px" border="0" width="100%" align="center">
				<tr>
					<td colspan="7"><center><h1><%=monthName%>, <%=intYear%></h1></center></td>
				</tr>

				<tr bgcolor="#FFF">
					<th width="14%"><font color="#000">Sunday</font></th>
					<th width="14%"><font color="#000">Monday</font></th>
					<th width="14%"><font color="#000">Tuesday</font></th>
					<th width="14%"><font color="#000">Wednesday</font></th>
					<th width="14%"><font color="#000">Thursday</font></th>
					<th width="15%"><font color="#000">Friday</font></th>
					<th width="15%"><font color="#000">Saturday</font></th>
				</tr>

				<%
					{
						Month aMonth = Month.getMonth(
								Integer.parseInt(currentMonthString),
								Integer.parseInt(currentYearString));
						int[][] days = aMonth.getDays();
						for (int i = 0; i < aMonth.getNumberOfWeeks(); i++) {
				%>
				<tr bgcolor="#ccc">
				<%
					for (int j = 0; j < 7; j++) {
						if (days[i][j] == 0) {
				%>
					<td class="empty_day_cell" style='border: thin solid #777;'>&nbsp;</td>
				<%
					} else {
				%>
					<td align="right" valign="top" class="day_cell" style='border: thin solid #777;'>
						<input type="hidden" name="dayDetails" value="<%=i + "" + j%>" />
						<font color="#000"><%=days[i][j]%></font>
					</td>
				<%
					}
							}
				%>
				</tr>
				<%
						}
					}
				%>
				<tr><td height="5px">&nbsp;</td></tr>
			</table>

			<div class="roundbottom_calendar">
				<img src="/images/bottoml.gif" alt="" width="15" height="15" class="corner" style="display: none" />
			</div>

		</div>
		</td></tr></table>

		<table><tr>
			<td class="col2_calendar" valign="top">
			<div class="roundcont_2">
				<div class="roundtop_2">
					<img src="/images/topl.gif" alt="" width="15" height="15" class="corner" style="display: none" />
				</div>
					<h1>Athlete Panel</h1></br>
					<table width="100%"><tr><td style='border: thin dotted #777;'>
					<p><a href="#" target="_self">Add Workout</a></p>
					<p><a href="#" target="_self">Modify Workout</a></p>
					<p><a href="#" target="_self">Remove Workout</a></p>
					</td></tr></table>
			</div>
			</td>
			<td class="col3_calendar">
			<div class="roundcont_3">
				<div class="roundtop_3">
					<img src="/images/topl.gif" alt="" width="15" height="15" class="corner" style="display: none" />
				</div>
					<h1>Workout: Carla's Cardio.</h1></br>
					<b>BJ's Bench Press:</b><p>30 minutes | 10 reps | 20 loads | 30 times | 5 weights</p>
					<b>Kevin's Kleans and Jerk:</b><p>30 minutes | 10 reps | 20 loads | 30 times | 5 weights</p>
				<div class="roundbottom_3">
					<img src="/images/bottoml.gif" alt="" width="15" height="15" class="corner" style="display: none" />
				</div>
			</div>
			</td>
		</tr></table>

		<div id="footer">
			<p>Copyright © 2011 Team Crazy 8. All rights reserved.</p>
		</div>
	</div>

</body>
</html>