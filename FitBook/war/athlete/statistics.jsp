<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="javax.jdo.PersistenceManager"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.fitbook.EntityAthlete"%>
<%@ page import="com.fitbook.PMF"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.PreparedQuery"%>
<%@ page import="com.google.appengine.api.datastore.Query"%>


<html>
<head>
<title>FitBook Statistics</title>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<link href="style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Year');
        data.addColumn('number', 'Actual Weight');
        data.addColumn('number', 'Ideal Weight');
        data.addRows(4);
        data.setValue(0, 0, '2004');
        data.setValue(0, 1, 1000);
        data.setValue(0, 2, 400);
        data.setValue(1, 0, '2005');
        data.setValue(1, 1, 1170);
        data.setValue(1, 2, 460);
        data.setValue(2, 0, '2006');
        data.setValue(2, 1, 860);
        data.setValue(2, 2, 580);
        data.setValue(3, 0, '2007');
        data.setValue(3, 1, 1030);
        data.setValue(3, 2, 540);

        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        chart.draw(data, {width: 400, height: 240, title: 'How Fat Are You?'});
      }
    </script>
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
			<li><a href="#">Statistics</a></li>
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
		<table>
			<tr>
				<td class="col1">

				<div class="roundcont">
					<div class="roundtop">
						<img src="/images/topl.gif" alt="" width="15" height="15" class="corner" style="display: none" />
					</div>

				<h1>&nbsp;&nbsp;&nbsp;&nbsp;My FitBook Statistics</h1>

				<br/>
				<div id="chart_div"></div>

				<h3>Analysis: Get up do some more Crossfit!<br /></h3>


				<div class="roundbottom">
					<img src="/images/bottoml.gif" alt="" width="15" height="15" class="corner" style="display: none" />
				</div>
			</div>
		</table>
	</div>


	<div id="footer">
		<p>Copyright © 2011 Team Crazy 8. All rights reserved.</p>
	</div>

</body>
</html>