package com.fitbook;

import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.users.User;

@PersistenceCapable
public class EntityAthlete {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;

	@Persistent
	private User athlete;

	@Persistent
	private String firstName;

	@Persistent
	private String lastName;

	@Persistent
	private String gender;

	@Persistent
	private String height;

	@Persistent
	private String weight;
	
	public EntityAthlete(User athlete, String firstName, String lastName, String gender,
			String height, String weight) {
		setAthlete(athlete);
		setFirstName(firstName);
		setLastName(lastName);
		setGender(gender);
		setHeight(height);
		setWeight(weight);
	}

	public static EntityAthlete create(PersistenceManager pm, User athlete, String firstName,
			String lastName, String gender, String height, String weight) {
		EntityAthlete a = new EntityAthlete(athlete, firstName, lastName, gender, height, weight);
		pm.makePersistent(a);
		return a;
	}
	
	@SuppressWarnings("unchecked")
	public static EntityAthlete getExerciseById(PersistenceManager pm, long id) {
		String query = "select from " + EntityAthlete.class.getName()
		+ " where key == " + id;
		List<EntityAthlete> athletes = (List<EntityAthlete>) pm.newQuery(query).execute();
		if (athletes.isEmpty()) 
			return null;
		return athletes.get(0);
	}

	@SuppressWarnings("unchecked")
	public static List<EntityAthlete> getAllEntries(PersistenceManager pm) {
		String query = "select from " + EntityAthlete.class.getName();
		return (List<EntityAthlete>) pm.newQuery(query).execute();
	}

	public Key getKey() {
		return key;
	}

	public User getAthlete() {
		return athlete;
	}

	public void setAthlete(User athlete) {
		this.athlete = athlete;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

}
