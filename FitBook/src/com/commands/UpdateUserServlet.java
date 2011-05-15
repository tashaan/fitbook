package com.commands;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class UpdateUserServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws IOException {

		DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

		String gender = req.getParameter("gender");
		String height = req.getParameter("height");
		String weight = req.getParameter("weight");

		Query q = new Query("EntityAthlete");
		q.addFilter("athlete", Query.FilterOperator.EQUAL, user);
		PreparedQuery pq = datastore.prepare(q);
		Entity result = pq.asSingleEntity();		
		result.setProperty("gender", gender);
		result.setProperty("height", height);
		result.setProperty("weight", weight);
		datastore.put(result);
		
		resp.sendRedirect("/athlete/calendarMonthPrintView.jsp");
	}
}
