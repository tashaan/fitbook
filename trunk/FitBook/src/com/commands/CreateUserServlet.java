package com.commands;

import java.io.IOException;
import java.util.logging.Logger;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;

import com.fitbook.EntityAthlete;
import com.fitbook.PMF;

@SuppressWarnings("serial")
public class CreateUserServlet extends HttpServlet {
	private static final Logger log = Logger.getLogger(CreateUserServlet.class.getName());

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws IOException {

		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		PersistenceManager pm = PMF.get().getPersistenceManager();

		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String gender = req.getParameter("gender");
		String height = req.getParameter("height");
		String weight = req.getParameter("weight");

		try {
			EntityAthlete athlete = EntityAthlete.create(pm, user, firstName, lastName, gender, height, weight);
		} finally {
			pm.close();
		}
		resp.sendRedirect("/athlete/calendarMonthPrintView.jsp");

		//String content = req.getParameter("content");
		/*if (gender == null) {
			gender = "(No greeting)";
		}
		if (user != null) {
			log.info("Greeting posted by user " + user.getNickname() + ": " + gender);
		} else {
			log.info("Greeting posted anonymously: " + gender);
		}
		resp.sendRedirect("/calendarMonthPrintView.jsp");*/

		/*if (user != null) {
			//resp.setContentType("text/plain");
			//resp.getWriter().println("Hello, " + user.getNickname());
			resp.sendRedirect("/athlete/calendarMonthPrintView.jsp");

		} else {
			resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
		}*/
	}
}
