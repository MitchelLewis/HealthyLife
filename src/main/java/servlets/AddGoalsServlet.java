package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Goal;
import models.UserRecord;

/**
 * Servlet implementation class SignUpServlet
 */
@WebServlet("/add-goals")
public class AddGoalsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, String> allGoals;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddGoalsServlet() {
        super();
        this.allGoals = new HashMap<>();
        this.allGoals.put("Calories", "kcals");
        this.allGoals.put("Protein", "grams");
        this.allGoals.put("Salt", "grams");
        this.allGoals.put("Sugar", "grams");
        this.allGoals.put("Exercise", "minutes");
        this.allGoals.put("Working hours", "hours");
        this.allGoals.put("Sleep", "hours");
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		session.removeAttribute("goals");
		response.setContentType("text/html;charset=UTF-8");
		Map<String, String[]> formData = request.getParameterMap();
		List<Goal> enteredGoals = new ArrayList<>();
		for(String goal: allGoals.keySet()) {
			try {
				String[] goalValueAsArray = formData.get(goal);
				String[] targetAsArray = formData.get(goal + ".target");
				String goalValue = goalValueAsArray[0];
				int target = Integer.valueOf(targetAsArray[0]);
				Goal goalRecord = new Goal(goal, allGoals.get(goal), 0, target);
				enteredGoals.add(goalRecord);
			} catch(NullPointerException e) {
				continue;
			}
		}
		session.setAttribute("goals", enteredGoals);
		response.sendRedirect("dashboard");
	}

}
