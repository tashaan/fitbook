package com.fitbook;

import java.util.Set;

import javax.jdo.PersistenceManager;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@PersistenceCapable
public class RelationshipEventLog {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;

	@Persistent
	private String date;
	
	@Persistent
	private String pRecord;
	
	@Persistent
	private String notes;
	
	@Persistent
	private Set<Key> athlete;
	
	@Persistent
	private Set<Key> workout;

	private RelationshipEventLog(String date, String pRecord, String notes,
			EntityAthlete athlete, EntityWorkout workout) {
		setDate(date);
		setpRecord(pRecord);
		setNotes(notes);
		this.addWorkout(athlete, workout);
	}

	public static RelationshipEventLog create(PersistenceManager pm, String date, 
			String pRecord, String notes, EntityAthlete athlete, EntityWorkout workout) {
		RelationshipEventLog rel = new RelationshipEventLog(date, pRecord, notes, athlete, workout);
		pm.makePersistent(rel);
		return rel;
	}

	public Key getKey() {
		return key;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getpRecord() {
		return pRecord;
	}

	public void setpRecord(String pRecord) {
		this.pRecord = pRecord;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Set<Key> getAthlete() {
		return athlete;
	}

	public void setAthlete(Set<Key> athlete) {
		this.athlete = athlete;
	}

	public Set<Key> getWorkout() {
		return workout;
	}

	public void setWorkout(Set<Key> workout) {
		this.workout = workout;
	}
	
	public void addWorkout(EntityAthlete a, EntityWorkout w) {
		athlete.add(a.getKey());
		workout.add(w.getKey());
	}
	
	public void removeWorkout(EntityAthlete a, EntityWorkout w) {
		athlete.remove(a.getKey());
		workout.remove(w.getKey());
	}

}
