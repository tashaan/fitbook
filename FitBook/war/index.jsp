<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- The HTML 4.01 Transitional DOCTYPE declaration-->
<!-- above set at the top of the file will set     -->
<!-- the browser's rendering engine into           -->
<!-- "Quirks Mode". Replacing this declaration     -->
<!-- with a "Standards Mode" doctype is supported, -->
<!-- but may lead to some differences in layout.   -->

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>

<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Fitbook Home</title>
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

				<br/>
				<h1>&nbsp;&nbsp;&nbsp;&nbsp;A Planner for Heroes and Heroines</h1><br>
				<p><b>FitBook</b> is a free workout planner that is tailored for CrossFit athletes.
				Our goal is to allow CrossFit athletes to keep track of past workouts as well as
				personal records for each exercise. Our main features are the <a href="#">customizable calendar</a> and <a href="#">workout
				statistics</a> pages.</p><br>

				<p>With a simple and user-friendly design, our athletes are able to add, modify, and
				remove workouts, which will be dynamically updated on the site. Your personal
				information will be stored on Google's Datastore and will be <i>securely monitored</i> by
				Google's App Engine. Additionally, users are allowed to create custom workouts to further
				personalize their calendars.</p><br>

				<p>Through data analysis, detailed statistics are produced by our server to display graphs
				that plot personal records and provide data mapping workout progress and improvements.</p>

				<p>&nbsp;</p>

				<div class="roundbottom">
					<img src="/images/bottoml.gif" alt="" width="15" height="15" class="corner" style="display: none" />
				</div>
			</div>

			<p></p>

			<div class="roundcont">
				<div class="roundtop">
					<img src="/images/topl.gif" alt="" width="15" height="15" class="corner" style="display: none" />
				</div>

						<h1>&nbsp;&nbsp;&nbsp;&nbsp;What is CrossFit? Forging Elite
							Fitness.</h1>
						<br> <img src="/images/pic4.jpg" width="100%" />
						<blockquote>
							CrossFit is the principal strength and conditioning program for
							many police academies and tactical operations teams, military
							special operations units, champion martial artists, and hundreds
							of other elite and professional athletes worldwide.</br></br>Our program
							delivers a fitness that is, by design, broad, general, and
							inclusive. Our specialty is not specializing. Combat, survival,
							many sports, and life reward this kind of fitness and, on
							average, punish the specialist.</br></br>The CrossFit program is designed
							for universal scalability making it the perfect application for
							any committed individual regardless of experience. We’ve used our
							same routines for elderly individuals with heart disease and cage
							fighters one month out from televised bouts. We scale load and
							intensity; we don’t change programs.</br></br>The needs of Olympic
							athletes and our grandparents differ by degree not kind. Our
							terrorist hunters, skiers, mountain bike riders and housewives
							have found their best fitness from the same regimen.</br></br>Thousands of
							athletes worldwide have followed our workouts posted daily on
							this site and distinguished themselves in combat, the streets,
							the ring, stadiums, gyms and homes.</br></br>We also publish the CrossFit
							Journal, designed to support the CrossFit community detailing the
							theory, techniques, and practice d by our coaches in our gym, in
							essence bringing your garage or gym into ours, making you a part
							of the CrossFit family.</br></br>We offer seminars, trainer
							certifications, and training and regularly provide consultation
							services to athletic teams, coaches, and police and military
							agencies throughout the free world.
						</blockquote>
						<div class="roundbottom">
							<img src="/images/bottoml.gif" alt="" width="15" height="15"
								class="corner" style="display: none" />
						</div>
					</div>

			<p></p>

			<div class="roundcont">
				<div class="roundtop">
					<img src="/images/topl.gif" alt="" width="15" height="15" class="corner" style="display: none" />
				</div>

				<h1>&nbsp;&nbsp;&nbsp;&nbsp;Eric and Kevin's First Day at CrossFit!</h1><br>
				<img src="/images/pic2.jpg" width="100%" />

				<div class="roundbottom">
					<img src="/images/bottoml.gif" alt="" width="15" height="15" class="corner" style="display: none" />
				</div>
			</div>

			</td>
			<td>
		</tr>
	</table>

	</div>

	<div id="footer">
		<p>Copyright © 2011 Team Crazy 8. All rights reserved.</p>
	</div>

</body>
</html>
