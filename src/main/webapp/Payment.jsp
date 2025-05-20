<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="com.Student.Registration.model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StudyGate - Payment</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        .payment-card {
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        .card-header {
            background: #3498db;
            color: white;
        }
        .nav-link.active {
            background: #e3f2fd !important;
        }
        .bank-details {
            background: #f8f9fa;
            border-radius: 10px;
        }
        .form-control:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 0.25rem rgba(52,152,219,0.25);
        }
    </style>
</head>
<body class="bg-light">

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="fas fa-graduation-cap"></i> StudyGate
        </a>
    </div>
</nav>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card payment-card">
                <div class="card-header">
                    <h4 class="mb-0"><i class="fas fa-credit-card"></i> Course Payment</h4>
                </div>

                <div class="card-body">
                    <!-- Course Details -->
                    <div class="alert alert-info">
                        <%
                            String courseCode = (String) session.getAttribute("courseCode");
                            String courseName = (String) session.getAttribute("courseName");
                            String courseFee = (String) session.getAttribute("courseFee");
                        %>
                        <h5>Course: <%= courseName %></h5>
                        <p class="mb-0">Fee: Rs. <%= courseFee %></p>
                    </div>

                    <!-- Payment Tabs -->
                    <ul class="nav nav-tabs mb-4" id="paymentTabs">
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" href="#card">
                                <i class="fab fa-cc-visa"></i> Card
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" href="#bank">
                                <i class="fas fa-university"></i> Bank Transfer
                            </a>
                        </li>
                    </ul>

                    <!-- Tab Content -->
                    <div class="tab-content">
                        <!-- Card Payment -->
                        <div class="tab-pane show active" id="card">
                            <form id="paymentForm">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label>Full Name</label>
                                        <input type="text" name="studentName" class="form-control" required>
                                    </div>

                                    <div class="col-md-6 mb-3">
                                        <label>Email</label>
                                        <input type="email" name="studentEmail" class="form-control" required>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label>Card Number</label>
                                    <div class="input-group">
                                        <input type="text" name="cardNumber" class="form-control"
                                               placeholder="4242 4242 4242 4242" required>
                                        <span class="input-group-text">
                                            <i class="fab fa-cc-visa"></i>
                                            <i class="fab fa-cc-mastercard"></i>
                                        </span>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <label>Expiry</label>
                                        <input type="text" name="cardExpiry" class="form-control"
                                               placeholder="MM/YY" required>
                                    </div>

                                    <div class="col-md-4 mb-3">
                                        <label>CVV</label>
                                        <input type="text" name="cardCvv" class="form-control" required>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <!-- Bank Transfer -->
                        <div class="tab-pane" id="bank">
                            <div class="bank-details p-4 mb-4">
                                <h5><i class="fas fa-university"></i> Bank Details</h5>
                                <p class="mb-1">Bank: Commercial Bank</p>
                                <p class="mb-1">Account: 123-456-789</p>
                                <p class="mb-0">Reference: <%= courseCode %></p>
                            </div>
                            <div class="alert alert-warning">
                                <i class="fas fa-exclamation-circle"></i>
                                Please include your student ID in payment reference
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-footer bg-white">
                    <button class="btn btn-primary w-100" onclick="processPayment()">
                        <i class="fas fa-lock"></i> Confirm Payment
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    function processPayment() {
        const formData = new FormData(document.getElementById('paymentForm'));
        formData.append('courseName', '<%= courseName %>');
        formData.append('courseCode', '<%= courseCode %>');
        formData.append('courseFee', '<%= courseFee %>');

        fetch('ProcessPayment', {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                if(data.status === 'success') {
                    window.location.href = 'payment-success.jsp?txn=' + data.transactionId;
                } else {
                    alert('Payment Failed: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Payment processing error');
            });
    }
</script>

</body>
</html>
