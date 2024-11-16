package project;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/addNewStaffServlet")
public class addNewStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String dob = request.getParameter("dob");
        String active = request.getParameter("active");
        String nic = request.getParameter("nic");
        String contact = request.getParameter("contact");

        boolean isAdded = UserModel.addNewStaff(id, name, category, dob, active,nic,contact);

        if (isAdded) {
            request.setAttribute("message", "Successfully Added");
            request.getRequestDispatcher("allStaffMembers.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Something Went Wrong! Try Again !");
            request.getRequestDispatcher("addNewStaff.jsp").forward(request, response);
        }
    }
}
