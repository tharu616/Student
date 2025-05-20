document.querySelector("form").addEventListener("submit", function (e) {
    let isValid = true;

    // Reset existing errors
    const errors = document.querySelectorAll(".error-message");
    errors.forEach(error => error.remove());

    /**
     * Helper function to show error message
     */
    function showError(inputId, message) {
        const inputElement = document.getElementById(inputId);
        const errorDiv = document.createElement("div");
        errorDiv.className = "text-danger error-message mt-1";
        errorDiv.innerText = message;
        inputElement.after(errorDiv);
        isValid = false;
    }

    /**
     * Validate Full Name
     */
    const fullName = document.getElementById("fullName").value.trim();
    if (!fullName) {
        showError("fullName", "Full name is required.");
    } else if (!/^[A-Za-z\s]{2,}$/. test(fullName)) {
        showError("fullName", "Please enter a valid full name (letters and spaces only).");
    }

    /**
     * Validate NIC Number
     */
    const nicNumber = document.getElementById("nicNumber").value.trim();
    if (!nicNumber) {
        showError("nicNumber", "NIC number is required.");
    } else if (!/^(\d{9}[vVxX]|\d{12})$/.test(nicNumber)) {
        showError("nicNumber", "Please enter a valid NIC number (e.g., 990123456V or 200123456789).");
    }

    /**
     * Validate Email
     */
    const email = document.getElementById("email").value.trim();
    if (!email) {
        showError("email", "Email address is required.");
    } else if (!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
        showError("email", "Please enter a valid email address.");
    }

    /**
     * Validate Password
     */
    const password = document.getElementById("password").value.trim();
    if (!password) {
        showError("password", "Password is required.");
    } else if (password.length < 6) {
        showError("password", "Password must be at least 6 characters long.");
    }

    /**
     * Validate Date of Birth
     */
    const dob = document.getElementById("birthday").value;
    if (!dob) {
        showError("birthday", "Date of birth is required.");
    } else {
        const dobDate = new Date(dob);
        const today = new Date();
        if (dobDate >= today) {
            showError("birthday", "Date of birth must be in the past.");
        }
    }

    /**
     * Validate Gender (Radio buttons)
     */
    const genderSelected = document.querySelector('input[name="gender"]:checked');
    if (!genderSelected) {
        showError("male", "Please select your gender.");
    }

    /**
     * Validate Mobile Number
     */
    const mobileNumber = document.getElementById("mobileNumber").value.trim();
    if (!mobileNumber) {
        showError("mobileNumber", "Mobile number is required.");
    } else if (!/^(\+94|0)?7\d{8}$/.test(mobileNumber)) {
        showError("mobileNumber", "Please enter a valid Sri Lankan mobile number.");
    }

    /**
     * Validate WhatsApp Number
     */
    const whatsAppNumber = document.getElementById("whatsAppNumber").value.trim();
    if (!whatsAppNumber) {
        showError("whatsAppNumber", "WhatsApp number is required.");
    } else if (!/^(\+94|0)?7\d{8}$/.test(whatsAppNumber)) {
        showError("whatsAppNumber", "Please enter a valid Sri Lankan WhatsApp number.");
    }

    /**
     * Validate Permanent Address
     */
    const permanentAddress = document.getElementById("permanentAddress").value.trim();
    if (!permanentAddress) {
        showError("permanentAddress", "Permanent address is required.");
    }

    /**
     * Validate District / Province
     */
    const districtOrProvince = document.getElementById("districtOrProvince").value.trim();
    if (!districtOrProvince) {
        showError("districtOrProvince", "District or Province is required.");
    }

    /**
     * Validate Postal Code
     */
    const postalCode = document.getElementById("postalCode").value.trim();
    if (!postalCode) {
        showError("postalCode", "Postal code is required.");
    } else if (!/^\d{5}$/.test(postalCode)) {
        showError("postalCode", "Postal code must be 5 digits.");
    }

    /**
     * Validate Index Number
     */
    const indexNumber = document.getElementById("indexNumber").value.trim();
    if (!indexNumber) {
        showError("indexNumber", "Index number is required.");
    } else if (!/^\d{8}$/.test(indexNumber)) {
        showError("indexNumber", "Index number must be 8 digits.");
    }

    /**
     * Validate Year of Completion
     */
    const yearOfCompletion = document.getElementById("yearOfCompletion").value.trim();
    if (!yearOfCompletion) {
        showError("yearOfCompletion", "Year of completion is required.");
    } else if (!/^\d{4}$/.test(yearOfCompletion) || yearOfCompletion < 1900 || yearOfCompletion > new Date().getFullYear()) {
        showError("yearOfCompletion", "Enter a valid year (e.g., 2025).");
    }

    /**
     * Validate Parent Full Name
     */
    const parentName = document.getElementById("parentName").value.trim();
    if (!parentName) {
        showError("parentName", "Parent's full name is required.");
    } else if (!/^[A-Za-z\s]{2,}$/.test(parentName)) {
        showError("parentName", "Please enter a valid parent name.");
    }

    /**
     * Validate Parent Contact Number
     */
    const parentContactNumber = document.getElementById("parentContactNumber").value.trim();
    if (!parentContactNumber) {
        showError("parentContactNumber", "Parent contact number is required.");
    } else if (!/^(\+94|0)?7\d{8}$/.test(parentContactNumber)) {
        showError("parentContactNumber", "Please enter a valid Sri Lankan phone number.");
    }

    /**
     * Validate Parent Email
     */
    const parentEmail = document.getElementById("parentEmail").value.trim();
    if (!parentEmail) {
        showError("parentEmail", "Parent email is required.");
    } else if (!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(parentEmail)) {
        showError("parentEmail", "Please enter a valid parent email address.");
    }

    /**
     * Validate File Upload
     */
    const certificatesInput = document.getElementById("certificates");
    if (!certificatesInput.files.length) {
        showError("certificates", "Please upload your certificates.");
    }

    /**
     * Validate Terms and Conditions
     */
    const terms = document.getElementById("terms").checked;
    if (!terms) {
        showError("terms", "You must agree to the terms and conditions.");
    }

    /**
     * Prevent form submission if invalid
     */
    if (!isValid) {
        e.preventDefault();
        alert("Please correct the highlighted fields.");
    }
});