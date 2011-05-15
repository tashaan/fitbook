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
<title>FitBook Settings</title>
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
		<table>
			<tr>
				<td class="col1">

				<div class="roundcont">
					<div class="roundtop">
						<img src="/images/topl.gif" alt="" width="15" height="15" class="corner" style="display: none" />
					</div>

				<h1>&nbsp;&nbsp;&nbsp;&nbsp;My FitBook Settings</h1>

				<%
					DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
					Query q = new Query("EntityAthlete");
					q.addFilter("athlete", Query.FilterOperator.EQUAL, user);
					PreparedQuery pq = datastore.prepare(q);

					Entity result = pq.asSingleEntity();
					if (result == null) {
				%>
				We have detected that you have not customized your account. Please
				take some time to fill out your personal information.

				<form action="/createUser" method="get">
				First name: <input type="text" name="firstName" /><br/>
				Last name: <input type="text" name="lastName" /><br/>
				Gender: <input type="text" name="gender" size="1" maxlength="1" /><br/>
				Height: <input type="text" name="height" /><br/>
				Weight: <input type="text" name="weight" /><br/>
				<input type="submit" value="Submit" /><br/>
				</form>

				<%
				} else {
				%>
				<p>Hello,  <%=result.getProperty("firstName")%> <%=result.getProperty("lastName")%>.
				Previously inserted personal information has been detected in our database.
				You can modify your personal information here.
				Currently registered information is:
				Gender is <%=result.getProperty("gender")%>.
				Height is <%=result.getProperty("height")%>.
				Weight is <%=result.getProperty("weight")%>.</p>

				<p>&nbsp;</p>
				<form action="/updateUser" method="get">
				<table>
					<tr>
						<td><p>Gender:</p></td>
						<td><input type="text" name="gender" size="1" maxlength="1" value="<%=result.getProperty("gender")%>" /></td>
					</tr>
					<tr>
						<td><p>Height:</p></td>
						<td><input type="text" name="height" size="5" maxlength="5" value="<%=result.getProperty("height")%>" /></td>
					</tr>
					<tr>
						<td><p>Weight:</p></td>
						<td><input type="text" name="weight" size="5" maxlength="5" value="<%=result.getProperty("weight")%>" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td></td>
					</tr>
					<tr>
						<td><input type="submit" value="Submit" /></td>
						<td></td>
					</tr>
				</table>
				</form>
				<%
				}
				%>

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