<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <script src="/docs/5.3/assets/js/color-modes.js"></script>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.122.0">
  <title>Add New Staff Member</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <style>
    .displayMsg {
      width: 50%;
      margin: 50px auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .displayMsg h1 {
      text-align: center;
    }

    .left-div {
      width: 45%;
      margin: 20px auto;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .right-div {
      width: 45%;
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
  </style>
</head>

<body>
  <div class="container">
    <div class="displayMsg">
      <h1>Add New Staff Member</h1>
      <h1>${message}</h1> <!-- Display success or error message -->
    </div>
    <%
    int id=1;
    try{
        Connection con=ConnectionProvider.getCon();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select max(id) from staff");
        while(rs.next()){
            id=rs.getInt(1);
            id=id+1;
        }
    }catch(Exception e){

    }
    %>
    <%
    LocalDate currentDate = LocalDate.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    String maxDate = currentDate.minusYears(18).format(formatter);
    String minDate = currentDate.minusYears(60).format(formatter);
    %>
    <form action="addNewStaffServlet" method="POST">
      <h3 style="color: yellow;">Member ID: <%= id %></h3>
      <input type="hidden" name="id" value="<%= id %>">

      <div class="left-div">
        <h3>Full Name</h3>
        <input class="form-control input-style" type="text" name="name" placeholder="Enter Full Name" required oninput="this.value = this.value.replace(/[^a-zA-Z ]/g, '')">
        <hr>
      </div>

      <div class="right-div">
        <h3>Job Category</h3>
        <input class="form-control input-style" type="text" name="category" placeholder="Enter Job Category" required oninput="this.value = this.value.replace(/[^a-zA-Z ]/g, '')">
        <hr>
      </div>

      <div class="left-div">
        <h3>Enter Date of Birth</h3>
        <input class="form-control input-style" type="date" name="dob" placeholder="Enter Date of Birth" required min="<%= minDate %>" max="<%= maxDate %>">
        <hr>
      </div>

      <div class="right-div">
        <h3>Active in Office</h3>
        <select class="form-select input-style" name="active">
          <option value ="yes">Yes</option>
          <option value="no">No</option>
        </select>
        <hr>
      </div>
      
      <div class="left-div">
  <h3>NIC</h3>
  <input class="form-control input-style" type="text" name="nic" placeholder="Enter NIC" required maxlength="12" oninput="if(this.value.length === 9 && (this.value.endsWith('V') || this.value.endsWith('v'))) this.blur(); else this.value = this.value.replace(/[^0-9Vv]/g, '')" pattern="([0-9]{9}[Vv])|([0-9]{12})">
  <hr>
</div>
      
      <div class="right-div">
  <h3>Contact Number</h3>
  <input class="form-control input-style" type="tel" name="contact" placeholder="Enter Contact Number" required pattern="^(071|070|077|076|075|072|074|078)[0-9]{7}$" maxlength="10" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
  <hr>
</div>
      
      <div class="d-flex justify-content-center">
        <button class="btn btn-success" type="submit">Save <i class='far fa-arrow-alt-circle-right'></i></button>
        <button class="btn btn-secondary" type="button" onclick="location.href='allStaffMembers.jsp'">Back</button>
      </div>
    </form>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-qTOoTdtZlwtLlFf7hxhcP7PMDcQcDmDmLZTsaG6TN78DlhG+qN+q4T7F793H" crossorigin="anonymous"></script>
</body>
</html>