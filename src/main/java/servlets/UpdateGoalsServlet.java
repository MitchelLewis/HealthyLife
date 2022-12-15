package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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

import database.DatabaseConnection;
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
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("update_goals.jspx");
        rd.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        ArrayList<Goal> goals = (ArrayList<Goal>) session.getAttribute("goals");
        response.setContentType("text/html;charset=UTF-8");
        Map<String, String[]> formData = request.getParameterMap();
        Connection database;
        try {
            database = DatabaseConnection.getDatabase();
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException("Failed to open database connection - error message: " + e.getMessage());
        }
        List<Goal> enteredGoals = new ArrayList<>();
        for (Goal goal : goals) {
            try {
                String[] targetAsArray = formData.get(goal.getGoalName() + ".target");
                String goalValue = targetAsArray[0];
                enteredGoals.remove(goal);
                goal.setTarget(Integer.valueOf(goalValue));
                enteredGoals.add(goal);
                PreparedStatement statement = database
                        .prepareStatement("update user_goals set target = ? WHERE userId = ? AND goalName = ?");
                statement.setInt(1, goal.getTarget());
                statement.setInt(2, (Integer) session.getAttribute("user_id"));
                statement.setString(3, goal.getGoalName());
                statement.execute();
                statement.close();
            } catch (NullPointerException e) {
                enteredGoals.add(goal);
                continue;
            } catch (SQLException e) {
                throw new ServletException(
                        "Failed to insert data into the database - error message: " + e.getMessage());
            }
        }
        try {
            database.close();
        } catch (SQLException e) {
            throw new ServletException("Failed to close the database - error message: " + e.getMessage());
        }
        session.setAttribute("goals", enteredGoals);
        response.sendRedirect("dashboard");
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String goalToDelete = request.getParameter("goalName");
        boolean isSuccess = false;
        if(goalToDelete == null) {
            response.sendError(404, "Could not find the goal to delete");
        } else {
            HttpSession session = request.getSession(false);
            Connection database;
            try {
                database = DatabaseConnection.getDatabase();
            } catch (ClassNotFoundException | SQLException e) {
                throw new ServletException("Failed to open database connection - error message: " + e.getMessage());
            }   
            ArrayList<Goal> goals = (ArrayList<Goal>) session.getAttribute("goals");
            for(Goal goal: goals) {
                if(goal.getGoalName().equals(goalToDelete)) {
                    try {
                        PreparedStatement statement = database.prepareStatement("delete from user_goals WHERE userId = ? AND goalName = ?");
                        statement.setInt(1, (Integer) session.getAttribute("user_id"));
                        statement.setString(2, goal.getGoalName());
                        statement.execute();
                        statement.close();
                        goals.remove(goal);
                        isSuccess = true;
                        break;
                    } catch(SQLException e) {
                        throw new ServletException("Failed to delete data from the database - error message: " + e.getMessage());
                    }
                }
            }
            try {
                database.close();
            } catch(SQLException e) {
                throw new ServletException("Failed to close the database - error message: " + e.getMessage());
            }
            if(isSuccess) response.setStatus(200); else response.sendError(404, "Could not find goal specified");
        }
    }
}
