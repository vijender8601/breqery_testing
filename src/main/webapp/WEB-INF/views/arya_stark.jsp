<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            background-image: url("https://img.freepik.com/free-vector/gradient-background-international-beer-day-celebration_23-2150533676.jpg?w=826&t=st=1719033026~exp=1719033626~hmac=b6e50fafd98c4f123f51ed0a7bd64aeea37ef6c362014765efa67ff805ba38f3");
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
        .card {
            color: #fff;
            background: transparent;
        }
        .card-title {
            color: #ffc107;
        }
        .container{
            margin-top: 20px;
            padding: 20px;
            background-image: url('https://images.livemint.com/img/2021/09/20/1140x641/beer-kolkata-zero-alcohol-Mint-Lounge_1632133058191_1632133076554.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
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
            padding-top: 70px; /* Space for fixed navbar */
        }
        .card-text{
            color: #000;
        }
        .container:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
            transition: 0.4s;
        }
        .card li{
            background: transparent;
            transition: 0.1s;
        }
        .card .card-text{
            color: white;
        }
        .animated {
            -webkit-transition: height 0.2s;
            -moz-transition: height 0.2s;
            transition: height 0.2s;
        }
        .stars {
            display: inline-block;
            cursor: pointer;
        }
        .star {
            font-size: 30px;
            color: #ffc107;
        }
        textarea {
            resize: none;
        }
        .btn-exit {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <a class="navbar-brand" href="#">
            <img src="https://tse4.mm.bing.net/th/id/OIP.hXbUbGSPfzBD_cAHbeFYoAHaF7?rs=1&pid=ImgDetMain" alt="Logo"> <!-- Replace with your logo image -->
        </a>
        <span class="navbar-text">Brewery</span>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
    </nav>

    <div class="container">
        <h1 class="mt-4 mb-4">Brewery Information</h1>
        <div class="row" id="breweries-list">
            <%-- This div will be populated with brewery cards --%>
            <div class="col-md-12 ms-md-auto">
                <div class="well well-sm">
                    <div class="text-right">
                        <a class="btn btn-danger btn-exit" href="/brewery_app/brewery" id="exit-review">Exit</a>
                        <a class="btn btn-success btn-green" href="#reviews-anchor" id="open-review-box">Leave a Review</a>
                    </div>
                    <div class="row" id="post-review-box" style="display:none;">
                        <div class="col-md-12">
                            <form accept-charset="UTF-8" action="${pageContext.request.contextPath}/brewery/${id}" method="post">
                                <input id="ratings-hidden" name="rating" type="hidden"/>
                                <textarea class="form-control animated" cols="50" id="new-review" name="comment" placeholder="Enter your review here..." rows="5"></textarea>
                                <div class="text-left">
                                    <div class="stars" id="star-rating">
                                        <span class="star" data-value="1"><i class="fa-regular fa-star"></i></span>
                                        <span class="star" data-value="2"><i class="fa-regular fa-star"></i></span>
                                        <span class="star" data-value="3"><i class="fa-regular fa-star"></i></span>
                                        <span class="star" data-value="4"><i class="fa-regular fa-star"></i></span>
                                        <span class="star" data-value="5"><i class="fa-regular fa-star"></i></span>
                                    </div>
                                    <a class="btn btn-danger btn-lg" href="#" id="close-review-box" style="display:none; margin-right: 10px;">
                                        <span class="glyphicon glyphicon-remove"></span>Cancel</a>
                                    <button class="btn btn-success btn-lg" type="submit">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
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
                const response = await fetch('https://api.openbrewerydb.org/v1/breweries/${id}');
                const data = await response.json();
                console.log(data);
                displayBreweries(data);
            } catch (error) {
                console.error('Error fetching data:', error);
            }

            var reviewBox = document.getElementById('post-review-box');
            var newReview = document.getElementById('new-review');
            var openReviewBtn = document.getElementById('open-review-box');
            var closeReviewBtn = document.getElementById('close-review-box');
            var ratingsField = document.getElementById('ratings-hidden');
            var stars = document.querySelectorAll('.stars .star');
            var offStars = document.querySelectorAll('.fa-regular');

            openReviewBtn.addEventListener('click', function (e) {
                e.preventDefault();
                reviewBox.style.display = 'block';
                newReview.focus();
                openReviewBtn.style.display = 'none';
                closeReviewBtn.style.display = 'inline-block';
            });

            closeReviewBtn.addEventListener('click', function (e) {
                e.preventDefault();
                reviewBox.style.display = 'none';
                openReviewBtn.style.display = 'inline-block';
                closeReviewBtn.style.display = 'none';
            });

            stars.forEach(function (star) {
                star.addEventListener('click', function () {
                    var value = parseInt(this.getAttribute('data-value'));
                    ratingsField.value = value;
                    highlightStars(value);
                });
            });

            function highlightStars(value) {
                stars.forEach(function (star) {
                    var starValue = parseInt(star.getAttribute('data-value'));
                    if (starValue <= value) {
                        star.classList.add('active');
                        offStars[starValue-1].classList.remove('fa-regular');
                        offStars[starValue-1].classList.add('fa-solid');
                    } else {
                        star.classList.remove('active');
                        offStars[starValue-1].classList.add('fa-regular');
                        offStars[starValue-1].classList.remove('fa-solid');
                    }
                });
            }

            // Initial highlight based on hidden field value
            highlightStars(parseInt(0));
        });

        function displayBreweries(brewery) {
            const breweriesList = document.getElementById('breweries-list');
            const breweryCard =
                '<div class="col-lg-12 col-md-12 col-sm-12 mb-4">'+
                    '<div class="card" style="width: 100%;">'+
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
                '</div>';
            breweriesList.innerHTML = breweryCard + breweriesList.innerHTML;
        }

        // Functions for search options
        async function searchByCity(text) {
            try {
                const response = await fetch('https://api.openbrewerydb.org/v1/breweries?by_city=' + text);
                const data = await response.json();
                displayBreweries(data);
            } catch (error) {
                console.error('Error fetching data:', error);
            }
        }
    </script>
</body>
</html>