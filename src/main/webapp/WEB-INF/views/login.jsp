<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Brewery Management Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value='/WEB-INF/css/signin.css' />"> <!-- Use JSTL to include CSS -->

    <style>
        body {
            background: url('<c:url value="resources/images/free-beer.jpg"/>') no-repeat center center fixed;
            color: #fff;
        }

        .form-signin {
            width: 100%;
            max-width: 400px;
            padding: 15px;
            margin: auto;
            margin-top: 10%;
            text-align: left; /* Align text to the left */
        }
        .form-signin input {
            background-color: transparent; /* Transparent input background */
            border: 1px solid rgba(255, 255, 255, 0.5); /* Semi-transparent border */
            color: #fff; /* Text color inside input fields */
            margin-bottom: 15px; /* Add gap between input fields */
        }
        .form-signin .checkbox {
            color: #fff; /* Checkbox text color */
        }
        .form-signin img {
            margin-bottom: 20px;
        }
        .form-signin label {
            font-weight: normal;
        }
        .btn-primary {
            background-color: #007bff; /* Button background color */
            border: none; /* Remove button border */
        }
        .register-link {
            margin-top: 15px;
            text-align: center;
        }
        .register-link a {
            color: #007bff; /* Link color */
            text-decoration: none; /* Remove underline from link */
        }
        .register-link a:hover {
            text-decoration: underline; /* Add underline on hover */
        }
    </style>
</head>
<body class="text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-4">

                <form class="form-signin" action="/brewery_app/login" method="post"> <!-- Updated action URL -->
                    <h1 class="h3 mb-3 font-weight-normal">Brewery Management System</h1> <!-- Updated title -->
                    <label for="username" class="sr-only">Username</label>
                    <input type="text" name="username" id="username" class="form-control" placeholder="Username" required autofocus>
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
                    <div class="checkbox mb-3">
                        <label>
                            <input type="checkbox" value="remember-me"> Remember me
                        </label>
                    </div>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                    <div class="register-link">
                        <p>New user? <a href="<c:url value='/register' />">Register here</a></p>
                    </div>
                    <p class="mt-5 mb-3 text-muted">&copy; 2023 Brewery Management</p> <!-- Updated footer text -->

                </form>
            </div>
        </div>
    </div>
</body>
</html>