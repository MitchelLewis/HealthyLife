package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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
 * Servlet implementation class UpdateGoalsServlet
 */
@WebServlet("/update-goals")
public class UpdateGoalsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateGoalsServlet() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("update_goals.jsp");
        rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		ArrayList<Goal> goals = (ArrayList<Goal>) session.getAttribute("goals");
		response.setContentType("text/html;charset=UTF-8");
		Map<String, String[]> formData = request.getParameterMap();
		List<Goal> enteredGoals = new ArrayList<>();
		for(Goal goal: goals) {
			try {
				String[] targetAsArray = formData.get(goal.getGoalName() + ".target");
				String goalValue = targetAsArray[0];
				enteredGoals.remove(goal);
				goal.setTarget(Integer.valueOf(goalValue));
				enteredGoals.add(goal);
			} catch(NullPointerException e) {
				enteredGoals.add(goal);
				continue;
			}
		}
		session.setAttribute("goals", enteredGoals);
		response.sendRedirect("dashboard");
	}

}
