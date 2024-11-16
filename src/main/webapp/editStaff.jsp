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
  <title>Edit Staff Member</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <style>
    .editStaff {
      width: 200%;
      margin: 50px auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .editStaff form {
      display: flex;
      flex-direction: column;
      align-items: center;
      width: 100%;
    }

    .editStaff input[type="text"],
    .editStaff input[type="date"],
    .editStaff input[type="number"],
    .editStaff select {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .editStaff input[type="submit"] {
      width: 100%;
      padding: 10px;
      background-color: #808080;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .editStaff input[type="submit"]:hover {
      background-color: #666666;
    }

    .left-div, .right-div {
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
  </style>
  
  <script>
    function validateName(input) {
      input.value = input.value.replace(/[^a-zA-Z ]/g, '');
    }

    function validateCategory(input) {
      input.value = input.value.replace(/[^a-zA-Z ]/g, '');
    }

    function validateNIC(input) {
      input.value = input.value.replace(/[^0-9Vv]/g, '');
    }

    function validateContact(input) {
      input.value = input.value.replace(/[^0-9]/g, '');
    }

    window.onload = function() {
      // Set up the event listeners for validation
      document.querySelector('input[name="name"]').oninput = function() { validateName(this); };
      document.querySelector('input[name="category"]').oninput = function() { validateCategory(this); };
      document.querySelector('input[name="nic"]').oninput = function() { validateNIC(this); };
      document.querySelector('input[name="contact"]').oninput = function() { validateContact(this); };
    };
  </script>
</head>

 <body>
  <div class="container">
    <header>
      <div class="navbar navbar-dark bg-dark shadow-sm">
        <div class="container">
          <a href="home.jsp" class="navbar-brand d-flex align-items-center">
            <strong>RVR</strong>
          </ a>
          <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
        </div>
      </div>
      <div class="edit-staff-label">
        <h1>Edit Staff Member</h1>
      </div>
    </header>

    <div class="row">
      <div class="col-md-6">
        <div class="editStaff">
          <h2><a class="back" href="allStaffMembers.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
          <%
          String id=request.getParameter("id");
          try{
          Connection con=ConnectionProvider.getCon();
          Statement st=con.createStatement();
          ResultSet rs=st.executeQuery("select * from staff where id='"+id+"'");
          while(rs.next()){

          %>

          <form action="editStaffServlet" method="POST">
          <input type="hidden" name="id" value="<%out.println(id); %>">
          <div class="left-div">
            <h3>Full Name</h3>
            <input class="input-style" type="text" name="name" value="<%=rs.getString(2) %>" required oninput="validateName(this)">
          </div>

          <div class="right-div">
            <h3>Job Category</h3>
            <input class="input-style" type="text" name="category" value="<%=rs.getString(3) %>" required oninput="validateCategory(this)">
          </div>

          <div class="left-div">
            <h3>Enter Date of Birth</h3>
            <input class="input-style" type="date" name="dob" value="<%=rs.getString(4) %>" required>
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
            <input class="input-style" type="text" name="nic" value="<%=rs.getString(6) %>" required oninput="validateNIC(this)" maxlength="12" pattern="([0-9]{9}[Vv])|([0-9]{12})">
          </div>

          <div class="right-div">
            <h3>Contact Number</h3>
            <input class="input-style" type="tel" name="contact" value="<%=rs.getString(7).replaceFirst("^0+", "") %>" required oninput="validateContact(this)" pattern="^[0-9]{9}$" maxlength="9">
          </div>

          <button class="button" style="background-color: #808080;">Save <i class='far fa-arrow-alt-circle-right'></i></button>
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