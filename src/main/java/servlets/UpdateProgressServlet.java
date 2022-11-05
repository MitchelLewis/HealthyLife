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
@WebServlet("/update-progress")
public class UpdateProgressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProgressServlet() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("update_progress.jsp");
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
		String goalName = formData.get("goal")[0];
		String goalUpdate = formData.get("goal-update")[0];
		for(Goal goal: goals) {
			if(goal.getGoalName().equals(goalName)) {
				goals.remove(goal);
				Integer updatedProgress = goal.getCurrentProgress() + Integer.valueOf(goalUpdate);
				Goal updatedGoal = new Goal(goal.getGoalName(), goal.getGoalUnit(), updatedProgress, goal.getTarget());
				goals.add(updatedGoal);
				break;
			}
		}
		session.setAttribute("goals", goals);
		response.sendRedirect("dashboard");
	}

}
