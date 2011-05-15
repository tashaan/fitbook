package com.db;

import java.util.*;
import java.io.*;

class Parser {
	public static int WORKOUT_START = 0x1;
	public static int WORKOUT_END = 0x4;
	public static int RECORD_START = 0x2;
	public static int RECORD_END = 0x3;

	private List<WoD> m_lWorkouts;
	private List<String> m_strWoDNames;
	private BufferedReader m_Reader;
	private BufferedWriter m_Writer;

	private String m_strTmpName;
	private int m_iTmpType;
	private String m_strTmpSpec;
	private String m_strTmpExer;
	private List<String> m_lstrTmpExer;

	public Parser() {
		m_lWorkouts = null;
		m_strWoDNames = null;
	}

	public Parser(List<WoD> list) {
		m_lWorkouts = list;
		genNameList();
	}

	public List<WoD> getWorkouts() {
		return m_lWorkouts;
	}

	public void setWorkouts(List<WoD> list) {
		m_lWorkouts = list;
		genNameList();
	}

	public List<String> getWoDNames() {
		return m_strWoDNames;
	}

	// Prep for file reading
	private void beginRead(String inputFile) throws IOException {
		m_Reader = new BufferedReader(new FileReader(inputFile));
		m_lWorkouts = new ArrayList<WoD>();
		m_strWoDNames = null;
	}

	// Cleanup after file reading
	private void endRead() throws IOException {
		genNameList();
		m_Reader.close();
	}

	// Prep for file writing
	/*
	 * private void beginWrite( String outputFile ) throws IOException {
	 * m_Writer = new BufferedWriter( new FileWriter( outputFile ) ); }
	 * 
	 * // Cleanup after file writing private void endWrite() throws IOException
	 * { m_Writer.close(); }
	 */

	// Create name list from WoD List
	public void genNameList() {
		int iCounter = 0;

		if (m_lWorkouts == null) {
			m_strWoDNames = null;
			return;
		}

		m_strWoDNames = new ArrayList<String>();

		// Duplicate the names in sequence
		for (iCounter = 0; iCounter < m_lWorkouts.size(); iCounter++) {
			m_strWoDNames.add(m_lWorkouts.get(iCounter).getName());
		}
	}

	// Read in a file and parse it
	public void read(String inputFile) throws IOException {
		int iCurrent = 0;
		StringBuffer buffer = new StringBuffer();

		beginRead(inputFile);

		// Primary Read Loop
		for (;;) {
			// Get a char
			iCurrent = m_Reader.read();

			// Throw out everything until start of workout found
			while (iCurrent != -1 && iCurrent != WORKOUT_START) {
				iCurrent = m_Reader.read();
			}
			// Leaves loop on EOF or workout start found

			// Done on EOF
			if (iCurrent == -1) {
				break;
			}

			/* Workout Start Found */

			// Throw out everything until end of workout or record start
			while (iCurrent != -1 && iCurrent != WORKOUT_END
					&& iCurrent != RECORD_START) {
				iCurrent = m_Reader.read();
			}
			// Leaves loop on EOF, workout end, or record start

			// Done on EOF
			if (iCurrent == -1) {
				break;
			}

			// Invalid record, trash it and start looking for new record
			if (iCurrent == WORKOUT_END) {
				continue;
			}

			/* Record Start Found */

			iCurrent = m_Reader.read();

			// Copy all chars until end of record or EOF/invalid marker
			while (iCurrent != -1 && iCurrent != WORKOUT_END
					&& iCurrent != RECORD_END) {
				buffer.append((char) iCurrent);

				iCurrent = m_Reader.read();
			}
			// Leaves loop on EOF, workout end, or record end

			// Done on EOF
			if (iCurrent == -1) {
				break;
			}

			// Invalid record, trash it and start looking for new record
			if (iCurrent == WORKOUT_END || buffer.length() == 0) {
				buffer.delete(0, buffer.length()); // clear the buffer
				continue;
			}

			m_strTmpName = buffer.toString(); // save name
			buffer.delete(0, buffer.length()); // clear the buffer

			/* Name Stored - Record End Found */

			// Throw out everything until end of workout or record start
			while (iCurrent != -1 && iCurrent != WORKOUT_END
					&& iCurrent != RECORD_START) {
				iCurrent = m_Reader.read();
			}
			// Leaves loop on EOF, workout end, or record start

			// Done on EOF
			if (iCurrent == -1) {
				break;
			}

			// Invalid record, trash it and start looking for new record
			if (iCurrent == WORKOUT_END) {
				continue;
			}

			/* Record Start Found */

			iCurrent = m_Reader.read();

			// Copy all chars until end of record or EOF/invalid marker
			while (iCurrent != -1 && iCurrent != WORKOUT_END
					&& iCurrent != RECORD_END) {
				buffer.append((char) iCurrent);

				iCurrent = m_Reader.read();
			}
			// Leaves loop on EOF, workout end, or record end

			// Done on EOF
			if (iCurrent == -1) {
				break;
			}

			// Invalid record, trash it and start looking for new record
			if (iCurrent == WORKOUT_END || buffer.length() == 0) {
				buffer.delete(0, buffer.length()); // clear the buffer
				continue;
			}

			m_iTmpType = Integer.parseInt(buffer.toString()); // save type
			buffer.delete(0, buffer.length()); // clear the buffer

			// Invalid record, trash it and start looking for new record
			if (m_iTmpType <= 0 || m_iTmpType >= WoD.NUM_TYPES) {
				continue;
			}

			/* Type Stored - Record End Found */

			// Throw out everything until end of workout or record start
			while (iCurrent != -1 && iCurrent != WORKOUT_END
					&& iCurrent != RECORD_START) {
				iCurrent = m_Reader.read();
			}
			// Leaves loop on EOF, workout end, or record start

			// Done on EOF
			if (iCurrent == -1) {
				break;
			}

			// Invalid record, trash it and start looking for new record
			if (iCurrent == WORKOUT_END) {
				continue;
			}

			/* Record Start Found */

			iCurrent = m_Reader.read();

			// Copy all chars until end of record or EOF/invalid marker
			while (iCurrent != -1 && iCurrent != WORKOUT_END
					&& iCurrent != RECORD_END) {
				buffer.append((char) iCurrent);

				iCurrent = m_Reader.read();
			}
			// Leaves loop on EOF, workout end, or record end

			// Done on EOF
			if (iCurrent == -1) {
				break;
			}

			// Invalid record, trash it and start looking for new record
			if (iCurrent == WORKOUT_END || buffer.length() == 0) {
				buffer.delete(0, buffer.length()); // clear the buffer
				continue;
			}

			m_strTmpSpec = buffer.toString(); // save specific
			buffer.delete(0, buffer.length()); // clear the buffer

			/* Specific Stored - Record End Found */

			// Throw out everything until end of workout or record start
			while (iCurrent != -1 && iCurrent != WORKOUT_END
					&& iCurrent != RECORD_START) {
				iCurrent = m_Reader.read();
			}
			// Leaves loop on EOF, workout end, or record start

			// Done on EOF
			if (iCurrent == -1) {
				break;
			}

			// Invalid record, trash it and start looking for new record
			if (iCurrent == WORKOUT_END) {
				continue;
			}

			/* Record Start Found */

			iCurrent = m_Reader.read();

			// Copy all chars until end of record or EOF/invalid marker
			while (iCurrent != -1 && iCurrent != WORKOUT_END
					&& iCurrent != RECORD_END) {
				buffer.append((char) iCurrent);

				iCurrent = m_Reader.read();
			}
			// Leaves loop on EOF, workout end, or record end

			// Done on EOF
			if (iCurrent == -1) {
				break;
			}

			// Invalid record, trash it and start looking for new record
			if (iCurrent == WORKOUT_END || buffer.length() == 0) {
				buffer.delete(0, buffer.length()); // clear the buffer
				continue;
			}

			m_strTmpExer = buffer.toString(); // save exercise
			buffer.delete(0, buffer.length()); // clear the buffer

			/* Exercise Stored - Record End Found */

			m_lstrTmpExer = new ArrayList<String>(); // make the exer list
			m_lstrTmpExer.add(m_strTmpExer); // store the first one

			/* Exercise List Begun */

			// Additional Exercise Read Loop
			for (;;) {
				iCurrent = m_Reader.read();

				// Throw out everything until end of workout or record start
				while (iCurrent != -1 && iCurrent != WORKOUT_END
						&& iCurrent != RECORD_START) {
					iCurrent = m_Reader.read();
				}
				// Leaves loop on EOF, workout end, or record start

				// Done on EOF
				if (iCurrent == -1) {
					break;
				}

				// No further exercises
				if (iCurrent == WORKOUT_END) {
					break;
				}

				/* Record Start Found */

				iCurrent = m_Reader.read();

				// Copy all chars until end of record or EOF/invalid marker
				while (iCurrent != -1 && iCurrent != WORKOUT_END
						&& iCurrent != RECORD_END) {
					buffer.append((char) iCurrent);

					iCurrent = m_Reader.read();
				}
				// Leaves loop on EOF, workout end, or record end

				// Done on EOF
				if (iCurrent == -1) {
					break;
				}

				// No further exercises - abandon partial record
				if (iCurrent == WORKOUT_END) {
					break;
				}

				// Invalid record, trash it and start looking for new record
				if (buffer.length() == 0) {
					buffer.delete(0, buffer.length()); // clear the buffer
					continue;
				}

				m_strTmpExer = buffer.toString(); // save exercise
				buffer.delete(0, buffer.length()); // clear the buffer

				/* Exercise Stored - Record End Found */

				m_lstrTmpExer.add(m_strTmpExer); // add the exer
			}
			// Leaves loop on EOF or workout end

			/* Complete Workout Stored */

			m_lWorkouts.add(new WoD(m_strTmpName, m_iTmpType, m_strTmpSpec,
					m_lstrTmpExer)); // Stored WoD added to the read list

			// Done on EOF
			if (iCurrent == -1) {
				break;
			}

			/* Workout End Found */
		} // End of Primary Read Loop

		endRead();
	}

}
