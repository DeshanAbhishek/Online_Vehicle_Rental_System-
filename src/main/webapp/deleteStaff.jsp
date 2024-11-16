<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <script src="/docs/5.3/assets/js/color-modes.js"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.122.0">
  <title>Delete Staff Member</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/login/">
  <style>
    .deleteStaff {
      width: 200%;
      margin: 50px auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .deleteStaff form {
      display: flex;
      flex-direction: column;
      align-items: center;
      width: 100%;
    }

    .deleteStaff input[type="text"],
    .deleteStaff input[type="date"],
    .deleteStaff input[type="number"],
    .deleteStaff select {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .deleteStaff input[type="submit"] {
      width: 100%;
      padding: 10px;
      background-color: #808080;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .deleteStaff input[type="submit"]:hover {
      background-color: #666666;
    }

    .back {
      color: white;
      margin-left: 2.5%
    }

    .left-div {
      width: 40%;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .right-div {
      width: 40%;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .input-style {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .button {
      width: 100%;
      padding: 10px;
      background-color: #808080;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .button:hover {
      background-color: #666666;
    }

    .delete-staff-label {
      text-align: center;
      margin-bottom: 20px;
    }
  </style>
</head>

<body>
  <div class="container">
    <header>
      <div class="navbar navbar-dark bg-dark shadow-sm">
        <div class="container">
          <a href="home.jsp" class="navbar-brand d-flex align-items-center">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2  2 0 0 1 2-2h4l2 -3h6l2 3h4a2 2 0 0 1 2 2z"></path><circle cx=" 12" cy="13" r="4"></circle></svg>
            <strong>RVR</strong>
          </a>
          <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></ span>
          </button>
        </div>
      </div>
      <div class="delete-staff-label">
        <h1>Delete Staff Member</h1>
      </div>
    </header>

    <div class="row">
      <div class="col-md-6">
        <div class="deleteStaff">
          <h2><a class="back" href="allStaffMembers.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
          <%
          String id=request.getParameter("id");
          try{
          Connection con=ConnectionProvider.getCon();
          Statement st=con.createStatement();
          ResultSet rs=st.executeQuery("select * from staff where id='"+id+"'");
          while(rs.next()){

          %>

          <form action="deleteStaffServlet" method="POST">
          <input type="hidden" name="id" value="<%out.println(id); %>">
          <div class="left-div">
            <h3>Full Name</h3>
            <input class="input-style" type="text" name="name" value="<%=rs.getString(2) %>" readonly>
          </div>

          <div class="right-div">
            <h3>Job Category</h3>
            <input class="input-style" type="text" name="category" value="<%=rs.getString(3) %>" readonly>
          </div>

          <div class="left-div">
            <h3>Enter Date of Birth</h3>
            <input class="input-style" type="date" name="dob" value="<%=rs.getString(4) %>" readonly>
          </div>

          <div class="right-div">
            <h3>Active</h3>
            <select class="input-style" name="active">
              <option value="yes">Yes</option>
              <option value="no">No</option>
            </select>
          </div>

          <div class="left-div">
            <h3>NIC</h3>
            <input class="input-style" type="text" name="nic" value="<%=rs.getString(6) %>" readonly>
          </div>

          <div class="right-div">
            <h3>Contact Number</h3>
            <input class="input-style" type="number" name="contact" value="<%=rs.getString(7) %>" readonly>
          </div>

          <button class="button" style="background-color: #808080;">Delete <i class='far fa-arrow-alt-circle-right'></i></button>
          </form>
          <%
          }}catch(Exception e){
          System.out.print(e);
          }
          %>
        </div>
      </div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr38bgBIFaxYSKm+9PlTWEq1Aul69Egi0h4ycNR7GZD+2W/89V3ttD5v+N" crossorigin="anonymous"></script>
</body>
</html>