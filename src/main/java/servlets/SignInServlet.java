package servlets;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DatabaseConnection;
import models.Goal;
import models.UserData;

/**
 * Servlet implementation class SignInServlet
 */
@WebServlet("/sign-in")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignInServlet() {
        super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserData userData = (UserData) session.getAttribute("userData");
        if(userData == null) {
            userData = new UserData();
        }
        userData.setErrors(new ArrayList<>());
        session.setAttribute("userData", userData);
        RequestDispatcher rd = 
                request.getRequestDispatcher("sign_in.jspx");
        rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = 
		request.getRequestDispatcher("sign_in.jspx");
        HttpSession session = request.getSession();
		Map<String, String[]> formData = request.getParameterMap();
        UserData userData = (UserData) session.getAttribute("userData");
		if(validateFormData(formData)) {
			Integer optUserId;
			try {
				optUserId = validateSignIn(formData.get("email")[0], formData.get("password")[0]);
				if(optUserId != null) {
					String userName = getUserName(optUserId);
					userData.setUserName(userName);
					session.setAttribute("userData", userData);
					session.setAttribute("user_id", optUserId);
					session.setAttribute("goals", getUserGoals(optUserId));
					response.sendRedirect("dashboard");
				} else {
					List<String> errors = new ArrayList<>();
					errors.add("Your email/password is incorrect");
					userData.setErrors(errors);
					session.setAttribute("userData", userData);
					rd.forward(request, response);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			List<String> invalidParameters = getInvalidParameters(formData);
            userData.setErrors(invalidParameters);
            session.setAttribute("userData", userData);
			rd.forward(request, response);
		}
	}

	private boolean validateFormData(Map<String, String[]> formData) {
		String[] email = formData.get("email");
		String[] password = formData.get("password");
		if(email.length == 0 || password.length == 0) {
			return false;
		}
		if(email[0].length() == 0 || password[0].length() == 0) {
			return false;
		}
		
		return true;
		//TODO: add more form validation
	}
	
	private List<String> getInvalidParameters(Map<String, String[]> formData) {
		List<String> errors = new ArrayList<>();
		String[] email = formData.get("email");
		String[] password = formData.get("password");
		if(email.length == 0 || email[0].length() == 0) {
			errors.add("You must provide your email address");
		}
		if(password.length == 0 || password[0].length() == 0) {
			errors.add("You must provide your password");
		}
		return errors;
	}

	private Integer validateSignIn(String email, String password) throws ClassNotFoundException, SQLException, NoSuchAlgorithmException, UnsupportedEncodingException {
		Connection database = DatabaseConnection.getDatabase();
		PreparedStatement statement = database.prepareStatement("select id, passwordHash from users where email = ?");
		statement.setString(1, email);
		ResultSet rs = statement.executeQuery();
		try {
			if(!rs.next()) {
				return null; 
			} else {
				String hashedPassword = DatabaseConnection.hashPassword(password);
				if(rs.getString("passwordHash").equals(hashedPassword)) {
					return rs.getInt("id");
				} else {
					return null;
				}
			}
		} finally {
			statement.close();
			database.close();
		}
	}

	private String getUserName(Integer userId) throws Exception {
		Connection database = DatabaseConnection.getDatabase();
		PreparedStatement statement = database.prepareStatement("select firstName from users where id = ?");
		statement.setInt(1, userId);
		ResultSet rs = statement.executeQuery();
		try {
			if(!rs.next()) {
				throw new Exception("Could not find name for user with ID = " + userId); 
			} else {
				return rs.getString("firstName");
			}
		} finally {
			statement.close();
			database.close();
		}
	}

	private List<Goal> getUserGoals(Integer userId) throws Exception {
		List<Goal> goals = new ArrayList<>();
		Connection database;
		PreparedStatement statement;
		database = DatabaseConnection.getDatabase();
		statement = database.prepareStatement("select * from user_goals where userId = ?");
		statement.setInt(1, userId);
		ResultSet rs = statement.executeQuery();
		while(rs.next()) {
			Goal goal = new Goal(rs.getString("goalName"), rs.getString("goalUnit"), rs.getInt("currentProgress"), rs.getInt("target"));
			goals.add(goal);
		}
		return goals;
	}

}
