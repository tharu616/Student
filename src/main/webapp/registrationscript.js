document.getElementById('registrationForm').addEventListener('submit', function (e) {
    let isValid = true;

    // Reset all error messages
    const inputs = this.querySelectorAll('.form-control, .form-select, .form-check-input');
    inputs.forEach(input => {
        input.classList.remove('is-invalid');
    });

    // Validate Full Name
    const fullName = document.getElementById('fullName');
    if (!fullName.value.trim()) {
        fullName.classList.add('is-invalid');
        isValid = false;
    }

    // Validate O/L Index
    const olIndex = document.getElementById('olIndex');
    if (!olIndex.value.trim() || !/^\d{9}[vV]$/.test(olIndex.value)) {
        olIndex.classList.add('is-invalid');
        isValid = false;
    }

    // Validate NIC
    const nicNumber = document.getElementById('nicNumber');
    if (!nicNumber.value.trim() || !/^(\d{9}[vV]|\d{12})$/.test(nicNumber.value)) {
        nicNumber.classList.add('is-invalid');
        isValid = false;
    }

    // Validate Email
    const email = document.getElementById('email');
    if (!email.value.trim() || !/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/.test(email.value)) {
        email.classList.add('is-invalid');
        isValid = false;
    }

    // Validate Password
    const password = document.getElementById('password');
    if (!password.value || password.value.length < 6) {
        password.classList.add('is-invalid');
        isValid = false;
    }

    // Validate Birthday
    const birthday = document.getElementById('birthday');
    if (!birthday.value) {
        birthday.classList.add('is-invalid');
        isValid = false;
    }

    // Validate Gender
    const genderInputs = document.querySelectorAll('input[name="gender"]');
    let genderSelected = Array.from(genderInputs).some(input => input.checked);
    if (!genderSelected) {
        genderInputs.forEach(input => input.classList.add('is-invalid'));
        isValid = false;
    }

    // Validate Terms
    const terms = document.getElementById('terms');
    if (!terms.checked) {
        terms.classList.add('is-invalid');
        isValid = false;
    }

    if (!isValid) {
        e.preventDefault();
    }
});