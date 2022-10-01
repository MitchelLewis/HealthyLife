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

import models.UserRecord;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/sign-up")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
        
      // Creating a RequestDispatcher object to dispatch
      // the request the request to another resource
		request.setAttribute("errors", new ArrayList<>());
        RequestDispatcher rd = 
            request.getRequestDispatcher("sign_up.jsp");
        rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
        
      // Creating a RequestDispatcher object to dispatch
      // the request the request to another resource
		
        RequestDispatcher rd = 
            request.getRequestDispatcher("sign_up.jsp");
		Map<String, String[]> formData = request.getParameterMap();
		if(validateFormData(formData)) {
			createUserRecord(formData);
			response.sendRedirect("sign_up_success.html");
		} else {
			
			List<String> invalidParameters = getInvalidParameters(formData);
			request.setAttribute("errors", invalidParameters);
			rd.forward(request, response);
		}
	}
	
	private boolean validateFormData(Map<String, String[]> formData) {
		String[] fName = formData.get("first-name");
		String[] lName = formData.get("surname");
		String[] email = formData.get("email");
		String[] password = formData.get("password");
		if(fName.length == 0 || lName.length == 0 || email.length == 0 || password.length == 0) {
			return false;
		}
		if(fName[0].length() == 0 || lName[0].length() == 0 || email[0].length() == 0 || password[0].length() == 0) {
			return false;
		}
		
		return true;
		//TODO: add more form validation
	}
	
	private List<String> getInvalidParameters(Map<String, String[]> formData) {
		List<String> errors = new ArrayList<>();
		String[] fName = formData.get("first-name");
		String[] lName = formData.get("surname");
		String[] email = formData.get("email");
		String[] password = formData.get("password");
		if(fName.length == 0 || fName[0].length() == 0) {
			errors.add("You must provide your first name");
		}
		if(lName.length == 0 || lName[0].length() == 0) {
			errors.add("You must provide your surname");
		}
		if(email.length == 0 || email[0].length() == 0) {
			errors.add("You must provide your email address");
		}
		if(password.length == 0 || password[0].length() == 0) {
			errors.add("You must provide your password");
		}
		return errors;
	}
	
	private boolean createUserRecord(Map<String, String[]> formData) {
		UserRecord record = UserRecord.createRecord(formData);
		//TODO: store record in data store
		return true;
	}

}
