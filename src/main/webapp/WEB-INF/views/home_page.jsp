<%@ page isELIgnored="false"%>
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
            background-image: url('https://images.unsplash.com/photo-1563741772498-5e8a3d2ee15d');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #fff;
        }
        .navbar {
            background-color: rgba(0, 0, 0, 0.8);
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
        .search-options {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            z-index: 1000;
            background-color: rgba(0, 0, 0, 0.8);
            padding: 5px;
            border-radius: 5px;
            width: 100%;
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
            background-color: #F8F9FA;
            padding: 5px;
            border-radius: 5px;
            width: 100%;
        }
        .search-options button {
            border-radius: 30px; /* Oval-shaped buttons */
            margin-right: 5px;
        }

        #searchInput{
            width: 100%;
            margin-bottom: 10px;
            padding: 5px;
            border: 1px solid #ffc107;
            color: #ffc107;
        }

        .form-control::placeholder{
            color: #ffc107;
            opacity: 1;
        }

        .card {
            background-color: #fff; /* White cards */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }

        .form-inline{
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

        .card-text{
            color: #000;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
            background-image: url('data:image/jpeg;base64,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');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .card:hover li{
            background: transparent;
        }
        .card:hover .card-text{
            color: white;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <a class="navbar-brand" href="#">
            <img src="https://tse4.mm.bing.net/th/id/OIP.hXbUbGSPfzBD_cAHbeFYoAHaF7?rs=1&pid=ImgDetMain" alt="Logo"> <!-- Replace with your logo image -->
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

        function formSubmitHandler()
        {
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
        document.getElementById('searchLogo').addEventListener('click', () => {
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
    </script>
</body>
</html>
