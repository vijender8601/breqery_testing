<%@ page isELIgnored="false"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Brewery Information</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: url('<c:url value="resources/images/beer-background.jpg"/>');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #fff;
        }
        .navbar {
            background-color: #844826;
        }
        .navbar-brand img {
            height: 30px; /* Adjust the logo height */
        }
        .navbar-text {
            color: #ffc107;
        }
        .form-control {
            background-color: rgba(255, 255, 255, 0.2);
            border: none;
            color: #fff;
        }
        .form-control::placeholder {
            color: #fff;
        }
        .search-options button {
            border-radius: 30px; /* Oval-shaped buttons */
            margin-right: 5px;
        }
        .search-logo i {
            color: #ffc107;
            cursor: pointer;
        }
        .card {
            background-color: rgba(0, 0, 0, 0.8);
            color: #fff;
        }
        .card-title {
            color: #ffc107;
        }
        .container h1 {
            color: #ffc107;
        }
        .navbar-nav .nav-item .form-control {
            transition: width 0.4s;
        }
        .navbar-nav .nav-item .form-control:focus {
            width: 100%;
        }
        .navbar-brand img {
            height: 30px; /* Adjust the logo height */
        }
        body {
            padding-top: 35px; /* Space for fixed navbar */
        }
        .search-options {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            z-index: 1000;
            background-color: #844826;
            padding: 5px;
            width: 100%;
        }
        .search-options button {
            border-radius: 30px; /* Oval-shaped buttons */
            margin-right: 5px;
        }
        #searchInput {
            width: 100%;
            margin-bottom: 10px;
            padding: 5px;
            border: 1px solid #ffc107;
            color: #ffc107;
        }
        .form-control::placeholder {
            color: #ffc107;
            opacity: 1;
        }
        .card {
            background-image: url('https://images.livemint.com/img/2021/09/20/1140x641/beer-kolkata-zero-alcohol-Mint-Lounge_1632133058191_1632133076554.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }
        .form-inline {
            margin: 10px;
        }
        .btn-outline-primary {
            color: #ffc107;
            border-color: #ffc107;
        }
        .btn-outline-primary:hover {
            background-color: #ffc107;
            color: #000;
        }
        .search-options .active {
            background-color: #fff;
            color: #000;
        }
        .btn-outline-primary {
            color: #ffc107;
            border-color: #ffc107;
        }
        .btn:hover,
        .btn.active {
            background-color: #ffc107;
            color: #fff;
        }
        .card-text {
            color: #000;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
            transition: 0.4s;
        }
        .card li {
            background: transparent;
            transition: 0.1s;
        }
        .card .card-text {
            color: white;
        }
         .logout-btn {
                    margin-left: 5px; /* Space between the search icon and logout button */
                }
                    .btn-exit {
                        border-color: transparent;
                        color:#ffc107;
                    }
                    .btn-exit:hover {
                        background-color: #ffc107;
                        color: #fff; /* Change text color on hover */
                        border-color: #ffc107;
                    }


    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <a class="navbar-brand" href="#">
            <img src="resources/images/OIP-removebg-preview.png" alt="Logo" style='width: 3.5rem; height: 2.5rem;'> <!-- Replace with your logo image -->
        </a>
        <span class="navbar-text">Brewery</span>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <!-- Empty list for spacing -->
            </ul>
            <div class="search-logo" id="searchLogo">
                <i class="fa-solid fa-magnifying-glass"></i>
            </div>
            <ul class="navbar-nav">
                <li class="nav-item">
<a class="btn btn-exit" href="<c:url value='/logout'/>" style="margin-left: 10px; border: 1px solid transparent;">
    Logout
</a>
                </li>
            </ul>
            <div class="search-options" id="searchOptions">
                <form class="form-inline" onsubmit="return formSubmitHandler();">
                    <input id="searchInput" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button type="button" class="btn active" id="byName" data-option="name">Search by Name</button>
                    <button type="button" class="btn btn-outline-primary" id="byType" data-option="type">Search by Type</button>
                    <button type="button" class="btn btn-outline-primary" id="byCity" data-option="city">Search by City</button>
                </form>
            </div>
        </div>
    </nav>

    <div class="container">
        <h1 class="mt-4 mb-4">Brewery Information</h1>
        <div class="row" id="breweries-list">
            <%-- This div will be populated with brewery cards --%>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <%-- Script to fetch and display brewery data --%>
    <script>
        document.addEventListener('DOMContentLoaded', async () => {
            try {
                const response = await fetch('https://api.openbrewerydb.org/v1/breweries');
                const data = await response.json();

                displayBreweries(data);
            } catch (error) {
                console.error('Error fetching data:', error);
            }
        });

        function displayBreweries(breweries) {
            const breweriesList = document.getElementById('breweries-list');
            breweriesList.innerHTML = '';

            breweries.forEach(brewery => {
                const breweryCard =
                    '<div class="col-lg-4 col-md-6 col-sm-12 mb-4">'+
                    '<a href="${pageContext.request.contextPath}/brewery/' + brewery.id + '" class="text-decoration-none" style="cursor: pointer;">' +
                        '<div class="card" style="width: 22rem;">'+
                          '<div class="card-body">'+
                            '<h5 class="card-title">' + brewery.name + '</h5>'+
                          '</div>'+
                          '<ul class="list-group list-group-flush">'+
                            '<li class="list-group-item">' +
                                '<p class="card-text">Address: ' + brewery.address_1
                            + '</li>' +
                            '<li class="list-group-item">' +
                                '<p class="card-text">City: ' + brewery.city
                            + '</li>' +
                            '<li class="list-group-item">' +
                                '<p class="card-text">State: ' + brewery.state_province
                            + '</li>' +
                            '<li class="list-group-item">' +
                                '<p class="card-text">Contact: ' + brewery.phone
                            + '</li>' +
                          '</ul>'+
                          '<div class="card-body">'+
                            '<a href="' + brewery.website_url + '" class="card-link">Visit the site' +'</a>'+
                          '</div>'+
                        '</div>'+
                        '</a>'+
                    '</div>';

                breweriesList.innerHTML += breweryCard;
            });
        }

        // Functions for search options
        async function searchByName(text) {
            try {
                const response = await fetch('https://api.openbrewerydb.org/v1/breweries?by_name='+text);
                const data = await response.json();

                displayBreweries(data);
            } catch (error) {
                console.error('Error fetching data:', error);
            }
        }

        async function searchByType(text) {
            try {
                const response = await fetch('https://api.openbrewerydb.org/v1/breweries?by_type='+text);
                const data = await response.json();

                displayBreweries(data);
            } catch (error) {
                console.error('Error fetching data:', error);
            }
        }

        async function searchByCity(text) {
            try {
                const response = await fetch('https://api.openbrewerydb.org/v1/breweries?by_city='+text);
                const data = await response.json();

                displayBreweries(data);
            } catch (error) {
                console.error('Error fetching data:', error);
            }
        }

        function formSubmitHandler() {
            const activeButton = document.querySelector('.active');
            const text = document.getElementById('searchInput').value;
            if (activeButton) {
                if(activeButton.id==='byName')
                    searchByName(text);
                else if(activeButton.id==='byType')
                    searchByType(text);
                else
                    searchByCity(text);
            } else {
                console.log('No button is currently active.');
            }
            return false;
        }

        // Toggle search options on logo click
        document.getElementById('searchLogo').addEventListener('click', (event) => {
            event.stopPropagation(); // Prevent click event from reaching the body
            const searchOptions = document.getElementById('searchOptions');
            searchOptions.style.display = searchOptions.style.display === 'block' ? 'none' : 'block';
        });

        // Handle search option selection
        const searchButtons = document.querySelectorAll('.search-options button');
        searchButtons.forEach(button => {
            button.addEventListener('click', () => {
                searchButtons.forEach(btn => btn.classList.remove('active'));
                searchButtons.forEach(btn => btn.classList.add('btn-outline-primary'));
                button.classList.add('active');
                button.classList.remove('btn-outline-primary');
            });
        });

        // Hide search options when clicking outside
        document.addEventListener('click', (event) => {
            const searchOptions = document.getElementById('searchOptions');
            const searchLogo = document.getElementById('searchLogo');
            if (!searchOptions.contains(event.target) && !searchLogo.contains(event.target)) {
                searchOptions.style.display = 'none';
            }
        });
    </script>
</body>
</html>