package com.fitbook;

import java.util.Set;

import javax.jdo.PersistenceManager;
import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;

@PersistenceCapable
public class RelationshipConsists {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;

	@Persistent
	private Set<Key> workout;

	@Persistent
	private Set<Key> exercise;

	private RelationshipConsists(EntityWorkout workout, EntityExercise exercise) {
		this.addExercise(workout, exercise);
	}

	public static RelationshipConsists create(PersistenceManager pm, 
			EntityWorkout workout, EntityExercise exercise) {
		RelationshipConsists rc = new RelationshipConsists(workout, exercise);
		pm.makePersistent(rc);
		return rc;
	}

	public Key getKey() {
		return key;
	}

	public Set<Key> getWorkout() {
		return workout;
	}

	public void setWorkout(Set<Key> workout) {
		this.workout = workout;
	}

	public Set<Key> getExercise() {
		return exercise;
	}

	public void setExercise(Set<Key> exercise) {
		this.exercise = exercise;
	}

	public void addExercise(EntityWorkout w, EntityExercise e) {
		workout.add(w.getKey());
		exercise.add(e.getKey());
	}

	public void removeExercise(EntityWorkout w, EntityExercise e) {
		workout.remove(w.getKey());
		exercise.remove(e.getKey());
	}

}
