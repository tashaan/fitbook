package com.db;

import java.util.*;

class WoD
{
	static public int Type_AMRAP = 1;
	static public int Type_ForTime = 2;
	static public int Type_EachRoundForTime = 3;
	static public int Type_RoundEachMin = 4;
	static public int Type_MaxRepsEachRound = 5;

	static public int NUM_TYPES = 5;

	private String m_strName;       // WoD Name i.e. Fran
	private int m_iType;            // WoD Type i.e. AMRAP
	private String m_strSpecific;   // WoD Type Detail i.e. x min/x rounds
	private List<String> m_lstrExercises;   // WoD Exercise List i.e. 10 Burpees

	public WoD( String strName, int iType, String strSpec,
			List<String> lstrExer )
	{
		m_strName = strName;
		m_iType = iType;
		m_strSpecific = strSpec;
		m_lstrExercises = lstrExer;
	}

	public String getName()
	{ return m_strName; }

	public int getType()
	{ return m_iType; }

	public String getSpecific()
	{ return m_strSpecific; }

	public List<String> getExercises()
	{ return m_lstrExercises; }
}

