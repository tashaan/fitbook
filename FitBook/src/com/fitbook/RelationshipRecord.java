package com.fitbook;

import java.util.Set;

import javax.jdo.PersistenceManager;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@PersistenceCapable
public class RelationshipRecord {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;
	
	@Persistent
	private String date;
	
	@Persistent
	private int pRounds;
	
	@Persistent
	private int pWeights;
	
	@Persistent
	private Set<Key> athlete;
	
	@Persistent
	private Set<Key> exercise;

	private RelationshipRecord(String date, int pRounds, int pWeights,
			EntityAthlete athlete, EntityExercise exercise) {
		setDate(date);
		setpRounds(pRounds);
		setpWeights(pWeights);
		this.addExercise(athlete, exercise);
	}

	public static RelationshipRecord create(PersistenceManager pm, String date, 
			int pRounds, int pWeights, EntityAthlete athlete, EntityExercise exercise) {
		RelationshipRecord rr = new RelationshipRecord(date, pRounds, pWeights, athlete, exercise);
		pm.makePersistent(rr);
		return rr;
	}
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getpRounds() {
		return pRounds;
	}

	public void setpRounds(int pRounds) {
		this.pRounds = pRounds;
	}

	public int getpWeights() {
		return pWeights;
	}

	public void setpWeights(int pWeights) {
		this.pWeights = pWeights;
	}

	public Set<Key> getAthlete() {
		return athlete;
	}

	public void setAthlete(Set<Key> athlete) {
		this.athlete = athlete;
	}

	public Set<Key> getExercise() {
		return exercise;
	}

	public void setExercise(Set<Key> exercise) {
		this.exercise = exercise;
	}

	public Key getKey() {
		return key;
	}
	
	public void addExercise(EntityAthlete a, EntityExercise e) {
		athlete.add(a.getKey());
		exercise.add(e.getKey());
	}
	
	public void removeExercise(EntityAthlete a, EntityExercise e) {
		athlete.remove(a.getKey());
		exercise.remove(e.getKey());
	}

}
