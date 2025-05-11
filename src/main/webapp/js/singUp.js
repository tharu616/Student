document.getElementById('registrationForm').addEventListener('submit', function (e) {
    let isValid = true;

    // Reset errors
    const inputs = this.querySelectorAll('.form-control');
    inputs.forEach(input => input.classList.remove('is-invalid'));

    // Validate Full Name
    const name = document.getElementById('userName');
    if (!name.value.trim()) {
        name.classList.add('is-invalid');
        isValid = false;
    }

    // Validate Email
    const email = document.getElementById('email');
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!email.value.trim() || !emailPattern.test(email.value)) {
        email.classList.add('is-invalid');
        isValid = false;
    }

    // Validate Password
    const password = document.getElementById('password');
    if (!password.value || password.value.length < 6) {
        password.classList.add('is-invalid');
        isValid = false;
    }

    if (!isValid) {
        e.preventDefault();
    }
});