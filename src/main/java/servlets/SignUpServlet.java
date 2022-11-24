package servlets;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        session.setAttribute("errors", new ArrayList<>());
        RequestDispatcher rd = request.getRequestDispatcher("sign_up.jspx");
        rd.forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher rd = request.getRequestDispatcher("sign_up.jspx");
        Map<String, String[]> formData = request.getParameterMap();
        try {
            if (validateFormData(formData)) {
                createUserRecord(formData, request);
                HttpSession session = request.getSession();
                session.setAttribute("name", formData.get("first-name")[0]);
                rd = request.getRequestDispatcher("sign_up_success.jsp");
                rd.forward(request, response);
            } else {
                List<String> invalidParameters = getInvalidParameters(formData);
                HttpSession session = request.getSession();
                session.setAttribute("errors", invalidParameters);
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private boolean validateFormData(Map<String, String[]> formData) throws ClassNotFoundException, SQLException {
        String[] fName = formData.get("first-name");
        String[] lName = formData.get("surname");
        String[] email = formData.get("email");
        String[] password = formData.get("password");
        if (fName.length == 0 || lName.length == 0 || email.length == 0 || password.length == 0) {
            return false;
        }
        if (fName[0].length() == 0 || lName[0].length() == 0 || email[0].length() == 0 || password[0].length() == 0) {
            return false;
        }
        Connection database = DatabaseConnection.getDatabase();
        PreparedStatement statement = database.prepareStatement("select count(id) from users where email = ?");
        statement.setString(1, email[0]);
        ResultSet existingEmailQueryResult = statement.executeQuery();
        existingEmailQueryResult.next();
        if (existingEmailQueryResult.getInt(1) > 0) {
            statement.close();
            database.close();
            return false;
        }
        return true;
        // TODO: add more form validation
    }

    private List<String> getInvalidParameters(Map<String, String[]> formData) throws ClassNotFoundException, SQLException {
        List<String> errors = new ArrayList<>();
        String[] fName = formData.get("first-name");
        String[] lName = formData.get("surname");
        String[] email = formData.get("email");
        String[] password = formData.get("password");
        if (fName.length == 0 || fName[0].length() == 0) {
            errors.add("You must provide your first name");
        }
        if (lName.length == 0 || lName[0].length() == 0) {
            errors.add("You must provide your surname");
        }
        if (email.length == 0 || email[0].length() == 0) {
            errors.add("You must provide your email address");
        }
        if (password.length == 0 || password[0].length() == 0) {
            errors.add("You must provide your password");
        }
        Connection database = DatabaseConnection.getDatabase();
        PreparedStatement statement = database.prepareStatement("select count(id) from users where email = ?");
        statement.setString(1, email[0]);
        ResultSet existingEmailQueryResult = statement.executeQuery();
        existingEmailQueryResult.next();
        if (existingEmailQueryResult.getInt(1) > 0) {
            errors.add("This email address is already registered to an account");
            statement.close();
            database.close();
        }
        return errors;
    }

    private boolean createUserRecord(Map<String, String[]> formData, HttpServletRequest request)
            throws SQLException, ClassNotFoundException, NoSuchAlgorithmException, UnsupportedEncodingException {
        UserRecord record = UserRecord.createRecord(formData);
        Connection database = DatabaseConnection.getDatabase();
        PreparedStatement statement = database.prepareStatement(
                "insert into users(firstName, lastName, email, passwordHash) values (?, ?, ?, ?)",
                Statement.RETURN_GENERATED_KEYS);
        statement.setString(1, record.firstName());
        statement.setString(2, record.surname());
        statement.setString(3, record.email());
        String hashedPassword = DatabaseConnection.hashPassword(record.password());
        statement.setString(4, hashedPassword);
        statement.executeUpdate();
        ResultSet generatedKeys = statement.getGeneratedKeys();
        if (generatedKeys.next()) {
            request.getSession().setAttribute("user_id", generatedKeys.getInt(1));
        }
        statement.close();
        database.close();
        return true;
    }

}
