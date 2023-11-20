<!DOCTYPE html>

<head>
  <meta charset="UTF-8">
  <title>Signup Page</title>
  <style>
    /* CSS styles go here */
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
    }a

     h2 {
       color: #333;
     }

    .container{
      width: 40%;
      margin:0 auto;
    }

    form {
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    }

    label {
      display: block;
      margin-bottom: 10px;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    input[type="submit"] {
      background-color: #333;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #555;
    }
  </style>
</head>
<body>

<div id="student-admission" class="container">
  <h2>Student Login Form</h2>
  <form action="studentMustLogin" method="post">
    <label for="email">Email :</label>
    <input type="email" id="email" name="studentemail" placeholder="Please Enter Your Email" required><br><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="studentPass" placeholder="Please Enter Your Password" required><br><br>

    <input type="submit" value="Login" >
  </form>
</div>
</body>
</html>
