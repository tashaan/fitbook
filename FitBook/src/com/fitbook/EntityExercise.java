package com.fitbook;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@PersistenceCapable
public class EntityExercise {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;

	@Persistent
	private String name;

	@Persistent
	private int timeAllotted;

	@Persistent
	private int reps;

	@Persistent
	private int loads;

	@Persistent
	private int times;

	@Persistent
	private String weights;
	
	public EntityExercise(String name, int timeAllotted, int reps, int loads,
			int times, String weights) {
		setName(name);
		setTimeAllotted(timeAllotted);
		setReps(reps);
		setLoads(loads);
		setTimes(times);
		setWeights(weights);
	}

	public static EntityExercise create(PersistenceManager pm, String name, int timeAllotted,
			int reps, int loads, int times, String weights) {
		EntityExercise exercise = new EntityExercise(name, timeAllotted, reps, loads, times, weights);
		pm.makePersistent(exercise);
		return exercise;
	}
	
	@SuppressWarnings("unchecked")
	public static EntityExercise getExerciseById(PersistenceManager pm, long id) {
		String query = "select from " + EntityExercise.class.getName()
		+ " where key == " + id;
		List<EntityExercise> exercises = (List<EntityExercise>) pm.newQuery(query).execute();
		if (exercises.isEmpty()) 
			return null;
		return exercises.get(0);
	}

	@SuppressWarnings("unchecked")
	public static List<EntityExercise> getAllEntries(PersistenceManager pm) {
		String query = "select from " + EntityExercise.class.getName();
		return (List<EntityExercise>) pm.newQuery(query).execute();
	}

	public Key getKey() {
		return key;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTimeAllotted() {
		return timeAllotted;
	}

	public void setTimeAllotted(int timeAllotted) {
		this.timeAllotted = timeAllotted;
	}

	public int getReps() {
		return reps;
	}

	public void setReps(int reps) {
		this.reps = reps;
	}

	public int getLoads() {
		return loads;
	}

	public void setLoads(int loads) {
		this.loads = loads;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public String getWeights() {
		return weights;
	}

	public void setWeights(String weights) {
		this.weights = weights;
	}

}
