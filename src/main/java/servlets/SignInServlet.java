package servlets;

import java.io.IOException;
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

import models.Goal;

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
		request.setAttribute("errors", new ArrayList<>());
        RequestDispatcher rd = 
                request.getRequestDispatcher("sign_in.jsp");
        rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = 
		request.getRequestDispatcher("sign_in.jsp");
		Map<String, String[]> formData = request.getParameterMap();
		if(validateFormData(formData)) {
			String optUserId = validateSignIn(formData.get("email")[0], formData.get("password")[0]);
			if(!optUserId.isEmpty()) {
				String userName = getUserName(optUserId);
				HttpSession session = request.getSession();
				session.setAttribute("name", userName);
				session.setAttribute("goals", getUserGoals(optUserId));
				response.sendRedirect("dashboard");
			} else {
				List<String> errors = new ArrayList<>();
				errors.add("Your email/password is incorrect");
				request.setAttribute("errors", errors);
				rd.forward(request, response);
			}
		} else {
			List<String> invalidParameters = getInvalidParameters(formData);
			request.setAttribute("errors", invalidParameters);
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

	private String validateSignIn(String email, String password) {
		//TODO: need to query DB for email/pass
		if(email.equals("foo@bar.com") && password.equals("password")) {
			return "1234567";
		} else {
			return "";
		}
	}

	private String getUserName(String userId) {
		//TODO: need to query DB for user name from user ID
		return "Test user";
	}

	private List<Goal> getUserGoals(String userId) {
		//TODO: need to query DB for user goals
		List<Goal> goals = new ArrayList<>();
		Goal caloriesRecord = new Goal("Calories", "kcals", 1800, 2000);
		Goal sugarRecord = new Goal("Sugar", "grams", 25, 50);
		Goal sleepRecord = new Goal("Sleep", "hours", 8, 8);
		goals.add(sleepRecord);
		goals.add(caloriesRecord);
		goals.add(sugarRecord);
		return goals;
	}

}
