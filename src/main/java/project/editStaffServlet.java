package project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/editStaffServlet")
public class editStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String dob = request.getParameter("dob");
        String active = request.getParameter("active");
        String nic = request.getParameter("nic");
        String contact = request.getParameter("contact");

		boolean isAdded = UserModel.editStaff(id, name, category, dob, active,nic,contact);
		
		if (isAdded) {
            request.setAttribute("message", "Successfully Edited");
            request.getRequestDispatcher("allStaffMembers.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Something Went Wrong! Try Again !");
            request.getRequestDispatcher("allStaffMembers.jsp").forward(request, response);
        }
		
	}

}
