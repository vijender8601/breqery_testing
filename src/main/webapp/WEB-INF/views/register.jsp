<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Brewery Management Registration</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <style>
        body {
            background: url('<c:url value="resources/images/free-beer.jpg"/>') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
        }
        .form-signup {
                    width: 100%;
                    max-width: 400px;
                    padding: 15px;
                    margin: auto;
                    margin-top: 10%;
                    text-align: left; /* Align text to the left */
                }
                .form-signup input {
                    background-color: transparent; /* Transparent input background */
                    border: 1px solid rgba(255, 255, 255, 0.5); /* Semi-transparent border */
                    color: #fff; /* Text color inside input fields */
                    margin-bottom: 15px; /* Add gap between input fields */
                }
        .form-signup label {
            font-weight: normal;
        }
        .btn-primary {
            background-color: #007bff; /* Button background color */
            border: none; /* Remove button border */
        }
        .back-to-login {
            margin-top: 15px;
            text-align: center;
        }
        .back-to-login a {
            color: #007bff; /* Link color */
            text-decoration: none; /* Remove underline from link */
        }
        .back-to-login a:hover {
            text-decoration: underline; /* Add underline on hover */
        }
    </style>
</head>
<body class="text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <form class="form-signup" action="/brewery_app/register" method="post" modelAttribute="user"> <!-- Updated action URL -->
                    <h1 class="h3 mb-3 font-weight-normal">Register for Brewery Management</h1> <!-- Updated title -->
                    <label for="personName" class="sr-only">Username</label>
                    <input type="text" name="personName" id="personName" class="form-control" placeholder="Username" required autofocus>
                    <label for="email" class="sr-only">Email</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Email" required>
                    <label for="personPassword" class="sr-only">Password</label>
                    <input type="personPassword" name="personPassword" id="personPassword" class="form-control" placeholder="Password" required>
                    <label for="confirmPassword" class="sr-only">Confirm Password</label>
                    <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" placeholder="Confirm Password" required>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
                    <div class="back-to-login">
                        <p>Already have an account? <a href="<c:url value='/sign' />">Sign in here</a></p>
                    </div>
                                        <p class="mt-5 mb-3 text-muted">&copy; 2024 Brewery Management - By khushal</p> <!-- Updated footer text -->

                </form>
            </div>
        </div>
    </div>
</body>
</html>