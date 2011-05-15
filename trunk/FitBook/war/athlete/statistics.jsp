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
    <!--
    	Line Chart
     -->
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Month');
        data.addColumn('number', 'Actual Weight');
        data.addColumn('number', 'Ideal Weight');
        data.addRows(4);
        data.setValue(0, 0, 'Jan');
        data.setValue(0, 1, 1000);
        data.setValue(0, 2, 150);
        data.setValue(1, 0, 'Feb');
        data.setValue(1, 1, 1170);
        data.setValue(1, 2, 150);
        data.setValue(2, 0, 'Mar');
        data.setValue(2, 1, 860);
        data.setValue(2, 2, 150);
        data.setValue(3, 0, 'Apr');
        data.setValue(3, 1, 1030);
        data.setValue(3, 2, 150);

        var chart = new google.visualization.LineChart(document.getElementById('weight_chart'));
        chart.draw(data, {width: 620, height: 300, title: '2011: How Fat Are You? (lbs)'});
      }
    </script>
    <!--
    	Bar Chart
     -->
      <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Month');
        data.addColumn('number', 'Expected');
        data.addColumn('number', 'Actual');
        data.addRows(4);
        data.setValue(0, 0, 'Jan');
        data.setValue(0, 1, 15);
        data.setValue(0, 2, 3);
        data.setValue(1, 0, 'Feb');
        data.setValue(1, 1, 12);
        data.setValue(1, 2, 4);
        data.setValue(2, 0, 'Mar');
        data.setValue(2, 1, 20);
        data.setValue(2, 2, 5);
        data.setValue(3, 0, 'Apr');
        data.setValue(3, 1, 15);
        data.setValue(3, 2, 2);

        var chart = new google.visualization.ColumnChart(document.getElementById('wod_chart'));
        chart.draw(data, {width: 620, height: 300, title: 'How many times have you worked out?',
                          hAxis: {title: 'Month', titleTextStyle: {color: 'red'}}
                         });
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
				<div id="weight_chart"></div>
				<br/>
				<div id="wod_chart"></div>

				<h3>Analysis: You need more Crossfit!<br /></h3>


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