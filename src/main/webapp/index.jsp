<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Study Gate</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/styles.css">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Study Gate</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Register Online</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Courses</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Profile</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!--Header with background image-->
<header class="bg-image">
    <div class="container">
        <div class="row h-100 align-items-center">
            <div class="col-md-6 d-flex flex-column justify-content-center">
                <!-- Register online Buttons -->
                <div class="d-grid gap-2">
                    <a href="StudentREG1.jsp" class="btn btn-secondary btn-lg">Register Online</a>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Main Content -->
<div class="mt-5">
    <!-- Left Side: Welcome Section -->
    <div class="row">
        <div class="col-md-6 text-center">
            <h1 class="mb-4">Welcome to Study Gate</h1>

        </div>
        <div class="col-md-5 d-flex flex-column justify-content-center">
            <p class="lead mb-4">Shaping Lives, Creating Futures
                Welcome to ESOFT Metro Campus – Sri Lanka's Premier Destination for Higher Education Excellence! Established in 2000,
                ESOFT has grown into the country's largest private sector higher education network,
                providing educational opportunities for over 30,000 students annually across our 40 branches.
                Committed to shaping futures, we offer a diverse range of programs in ICT & Computing, Business Management,
                Hospitality Management, Engineering, Personal & Professional Development,
                Language Training and Corporate Training. What started with a focus on Computing has now blossomed into
                a beacon of academic diversity and excellence, empowering students to chart their path to success.
                Join us on this transformative journey where education meets innovation!</p>
        </div>
    </div>
</div>

<!-- Our Strength Section -->
<section class="our-strength py-5">
    <div class="container mt-1">
        <h2 class="text-center mb-5">Our Strength <span class="underline"></span></h2>
        <div class="row">
            <!-- Column 1: 23 Years -->
            <div class="col-md-3 text-center">
                <i class="fas fa-thumbs-up fa-2x mb-2"></i>
                <span class="strength-number text-danger">23 Years</span>
                <p class="strength-description">of Excellence</p>
            </div>
            <!-- Column 2: 40+ Branches -->
            <div class="col-md-3 text-center">
                <i class="fas fa-building fa-2x mb-2"></i>
                <span class="strength-number text-danger">40+</span>
                <p class="strength-description">Branches Islandwide</p>
            </div>
            <!-- Column 3: 400+ Academics -->
            <div class="col-md-3 text-center">
                <i class="fas fa-student-tie fa-2x mb-2"></i>
                <span class="strength-number text-danger">400+</span>
                <p class="strength-description">Full-time Academics</p>
            </div>
            <!-- Column 4: 35,000+ Students -->
            <div class="col-md-3 text-center">
                <i class="fas fa-graduation-cap fa-2x mb-2"></i>
                <span class="strength-number text-danger">35,000+</span>
                <p class="strength-description">Students</p>
            </div>
        </div>
    </div>
</section>

<!--Explore Our Courses-->
<div class="row">
    <div class="col text-center">
        <h1 class="mb-4">Explore Our Courses</h1>
        <p class="lead mb-4">Discover a wide range of courses tailored to your interests.</p>
    </div>
</div>

<!-- Courses Section -->
<div class="row">
    <div class="col">
        <!-- Course Carousel -->
        <div class="course-carousel">
            <!-- Navigation Arrows -->
            <div class="carousel-arrows">
                <button class="carousel-arrow prev-arrow"><i class="fas fa-chevron-left"></i></button>
                <button class="carousel-arrow next-arrow"><i class="fas fa-chevron-right"></i></button>
            </div>

            <!-- Course Cards -->
            <div class="container align-items-center justify-center">
                <div class="course-card-container">
                    <div class="course-card">
                        <img src="./images/C:\Users\USER\OneDrive - Sri Lanka Institute of Information Technology\Desktop\StudentRegistrationSystem\StudentCourseRegistration\src\main\webapp\images\pexels-divinetechygirl-1181243.jpg" alt="Engineering Course" class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title">School of Engineering | Postgraduate Level</h5>
                            <p class="card-text">Master of Science in Facilities Management – Kingston University (UK)</p>
                        </div>
                    </div>
                    <div class="course-card">
                        <img src="./images/pexels-buro-millennial-636760-1438072.jpg" alt="Fashion Course" class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title">School of Art & Design | Undergraduate Level</h5>
                            <p class="card-text">BA (Hons) in Fashion (TOP UP) – London Metropolitan University (UK)</p>
                        </div>
                    </div>
                    <div class="course-card">
                        <img src="./images/pexels-divinetechygirl-1181243.jpg" alt="Nursing Course" class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title">School of Life Science | Undergraduate Level</h5>
                            <p class="card-text">BSc (Hons) in Nursing (TOP UP) – London Metropolitan University (UK)</p>
                        </div>
                    </div>
                    <div class="course-card">
                        <img src="./images/pexels-hillaryfox-1595391.jpg" alt="Biomedical Engineering Course" class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title">School of Life Science | Undergraduate Level</h5>
                            <p class="card-text">BEng (Hons) in Biomedical Engineering (TOP UP) – London Metropolitan University (UK)</p>
                        </div>
                    </div>
                    <div class="course-card">
                        <img src="./images/pexels-shkrabaanthony-5816293.jpg" alt="Business Course" class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title">School of Management & Law | Higher National Diploma Level</h5>
                            <p class="card-text">Level 5 Pearson BTEC HND in Business (Management)</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- All Courses Button -->
    <div class="text-end mt-3">
        <a href="#" class="btn btn-primary">All Courses</a>
    </div>
</div>

<!-- Footer -->
<footer class="bg-dark text-light py-5">
    <div class="container">
        <div class="row">

            <!-- Logo and Branding -->
            <div class="col-md-3">
                <img src="logo.png" alt="ESOFT Logo" class="mb-3" width="200">
                <p class="small">Shaping Lives, Creating Futures.</p>
                <h5 class="text-white mb-3">Follow Us On</h5>
                <div class="d-flex gap-2">
                    <a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
                    <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
                    <a href="#" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>

            <!-- Quick Links -->
            <div class="col-md-3">
                <h5 class="text-white mb-3">Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-light">Home</a></li>
                    <li><a href="#" class="text-light">Student Life</a></li>
                    <li><a href="#" class="text-light">About Us</a></li>
                    <li><a href="#" class="text-light">Contact Us</a></li>
                    <li><a href="#" class="text-light">Careers</a></li>
                    <li><a href="#" class="text-light">News & Events</a></li>
                    <li><a href="#" class="text-light">Blogs</a></li>
                    <li><a href="#" class="text-light">CSR</a></li>
                </ul>
            </div>

            <!-- Important Links -->
            <div class="col-md-3">
                <h5 class="text-white mb-3">Important Links</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-light">Courses</a></li>
                    <li><a href="#" class="text-light">Schools</a></li>
                    <li><a href="#" class="text-light">Transfer Programmes</a></li>
                    <li><a href="#" class="text-light">Privacy Policy</a></li>
                    <li><a href="#" class="text-light">Payment Policy</a></li>
                    <li><a href="#" class="text-light">Refund Policy</a></li>
                    <li><a href="#" class="text-light">Quality Policy</a></li>
                    <li><a href="#" class="text-light">Referrals</a></li>
                </ul>
            </div>

            <!-- Contact Information -->
            <div class="col-md-3">
                <h5 class="text-white mb-3">Contact Us</h5>
                <p class="text-light">
                    <strong>Phone:</strong> +94 117 572 572<br>
                    <strong>Email:</strong> info@esoft.lk<br>
                    <strong>Address:</strong> Head Office (Block E)<br>
                    ESOFT Metro Campus No.03,<br>
                    De Fonseka Place, Colombo 04, Sri Lanka.
                </p>
            </div>

        </div>

        <!-- Copyright Notice -->
        <hr class="my-4">
        <p class="text-center text-light small">
            Copyright © 2025 ESOFT Metro Campus - All Rights Reserved. Concept, Design & Development by Web Lankan in Collaboration with ESOFT Technologies.
        </p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>