package com.db;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fitbook.*;

@SuppressWarnings("serial")
public class InputWorkoutServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws IOException {		
		String name;
		int typeInt;
		String type = "";
		WoD temp;

		Parser myParser1 = new Parser();
		myParser1.read("db/Girls.txt");

		List<WoD> WoDList1 = myParser1.getWorkouts();

		for(int i = 0; i < WoDList1.size(); i++)
		{      
			temp = WoDList1.get(i);
			name = temp.getName();
			typeInt = temp.getType();

			switch (typeInt){
			case 1: type = "AMRAP";
			break;
			case 2: type = "For Time";
			break;
			case 3: type = "Each Round For Time";
			break;
			case 4: type = "Round Each Minute";
			break;
			case 5: type = "Max Reps Each Round";
			break;
			}

			PersistenceManager pm = PMF.get().getPersistenceManager();

			try {
				EntityWorkout.create(pm, name, type);
			} finally {
				pm.close();
			}
		}
		
		Parser myParser2 = new Parser();
		myParser2.read("db/Heroes.txt");
		
		List<WoD> WoDList2 = myParser2.getWorkouts();

		for(int i = 0; i < WoDList2.size(); i++)
		{      
			temp = WoDList2.get(i);
			name = temp.getName();
			typeInt = temp.getType();

			switch (typeInt){
			case 1: type = "AMRAP";
			break;
			case 2: type = "For Time";
			break;
			case 3: type = "Each Round For Time";
			break;
			case 4: type = "Round Each Minute";
			break;
			case 5: type = "Max Reps Each Round";
			break;
			}

			PersistenceManager pm = PMF.get().getPersistenceManager();

			try {
				EntityWorkout.create(pm, name, type);
			} finally {
				pm.close();
			}
		}
	}
}