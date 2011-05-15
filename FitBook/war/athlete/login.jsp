<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>

<html>
<head>
</head>
<body>
	<%
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();
		if (user != null) {
			response.sendRedirect("/athlete/calendarMonthPrintView.jsp");
		}
		else {
	%>
	<p>
		Harro! <a
			href="<%=userService.createLoginURL(request.getRequestURI())%>">Sign
			in</a> please.

	</p>
	<%

		}
	%>
</body>
</html>