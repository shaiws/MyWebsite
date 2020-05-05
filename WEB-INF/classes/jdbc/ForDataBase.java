package jdbc;

import java.sql.*;

public class ForDataBase {

	private Connection con;

	/**
	 * constructor - create object con ( Connection type) invoking from the line:
	 * <jsp:useBean id="db" class = "jdbc.ForDataBase"/>
	 */

	public ForDataBase() {
		try {
			// we want use MySQL Connector
			Class.forName("com.mysql.cj.jdbc.Driver");

			// param #1 - The URL of the database : jdbc:mysql://127.0.0.1:3306/kvutza1
			// jdbc:mysql - protocol
			// 127.0.0.1 - IP
			// 3306 - port number
			// kvutza1 - database name
			// param #2 - default user of MySQLServer, name -root
			// param #3 - root password
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/website", "root", "");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * This function creates a PreparedStatement object from SQL querty String
	 */
	public PreparedStatement preparedStatement(String query) {
		try {
			return con.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * This function performs one direction SQL commands and returns the number of
	 * updated rows
	 */

	public int insertUpdateDelete(PreparedStatement sql) {
		int num = 0;
		try {
			// Invoke sql command
			num = sql.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}

	/**
	 * This function performs Select SQL commands and returns the result array of
	 * the data
	 */

	public String[][] select(PreparedStatement sql) {
		String[][] result = null;
		try {
			// Invoke sql command and puts the result into ResultSet object - res
			ResultSet res = sql.executeQuery();
			// m- the column number
			int m = res.getMetaData().getColumnCount();
			// move the cursor to the last row
			res.last();
			// n- the number of the last row
			int n = res.getRow();
			// create the array
			result = new String[n][m];
			// move the cursor before the first line
			res.beforeFirst();
			// copy the data from resultset to the array
			int i = 0;
			while (res.next()) {

				for (int j = 0; j < m; j++)
					result[i][j] = res.getString(j + 1);
				i++;
			}
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
