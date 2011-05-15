package com.fitbook;

import javax.jdo.PersistenceManager;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

import java.util.List;

@PersistenceCapable
public class EntityWorkout {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;

	@Persistent
	private String name;

	@Persistent
	private String type;

	public EntityWorkout(String name, String type) {
		setName(name);
		setType(type);
	}

	public static EntityWorkout create(PersistenceManager pm, String name, String type) {
		EntityWorkout workout = new EntityWorkout(name, type);
		pm.makePersistent(workout);
		return workout;
	}

	@SuppressWarnings("unchecked")
	public static EntityWorkout getWorkoutById(PersistenceManager pm, long id) {
		String query = "select from " + EntityWorkout.class.getName()
		+ " where key == " + id;
		List<EntityWorkout> workouts = (List<EntityWorkout>) pm.newQuery(query).execute();
		if (workouts.isEmpty()) 
			return null;
		return workouts.get(0);
	}

	@SuppressWarnings("unchecked")
	public static List<EntityWorkout> getAllEntries(PersistenceManager pm) {
		String query = "select from " + EntityWorkout.class.getName();
		return (List<EntityWorkout>) pm.newQuery(query).execute();
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
