<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<!-- PLEASE NOTE this is hard coded for the purposes of the web site. The real code will exist
	when i figure out google's database and when the WOD database finally exists :)
	then the WODS will be called dynamically.  -->


<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>FitBook WOD References</title>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/Javascript">
function display (category) {
	var whichcategory = document.getElementById(category);
	if (whichcategory.className=="show") {
		whichcategory.className="hide";
	} else {
		whichcategory.className="show";
	}
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
				</div> <!-- end top -->

				<h1>&nbsp;&nbsp;&nbsp;&nbsp;WOD Workouts</h1>


<div title="Navigation"> <!-- menu -->
<center>
	<a href="javascript:display('Girls')" class="Group">
<h2>Girls</h2></a>
	<div class="hide" id="Girls">
		<a href="#" class="Option">Angie</a>
		<a href="#" class="Option">Barbara</a>
		<a href="#" class="Option">Chelsea</a>
		<a href="#" class="Option">Cindy</a>
		<a href="#" class="Option">Diane</a>
		<a href="#" class="Option">Elizabeth</a>
		<a href="#" class="Option">Fran</a>
		<a href="#" class="Option">Grace</a>
		<a href="#" class="Option">Helen</a>
		<a href="#" class="Option">Isabel</a>
		<a href="#" class="Option">Jackie</a>
		<a href="#" class="Option">Karen</a>
		<a href="#" class="Option">Linda</a>
		<a href="#" class="Option">Mary</a>
		<a href="#" class="Option">Nancy</a>
		<a href="#" class="Option">Annie</a>
		<a href="#" class="Option">Eva</a>
		<a href="#" class="Option">Kelly</a>
		<a href="#" class="Option">Lynne</a>
		<a href="#" class="Option">Nicole</a>
	</div>
	<a href="javascript:display('Heroes')" class="Group">
<h2>Heroes</h2></a>
	<div class="hide" id="Heroes">
		<a href="#" class="Option">Man 1</a>
		<a href="#" class="Option">Man 2</a>
		<a href="#" class="Option">Man 3</a>
	</div>
	<a href="javascript:display('Custom')" class="Group">
<h2>Custom WODs</h2></a>
	<div class="hide" id="Custom">
		<a href="#" class="Option">Custom 1</a>
		<a href="#" class="Option">Custom 2</a>
		<a href="#" class="Option">Custom 3</a>
	</div>
</center>
</div>

				<div class="roundbottom">
					<img src="/images/bottoml.gif" alt="" width="15" height="15" class="corner" style="display: none" />
				</div> <!-- end bottom -->
			</div>
				</td> <!-- end row -->
		</tr> <!-- end column -->
	</table> <!-- end table -->

	</div>


	<div id="footer">
		<p>Copyright © 2011 Team Crazy 8. All rights reserved.</p>
	</div>


</body>
</html>