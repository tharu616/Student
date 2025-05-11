document.querySelector("form").addEventListener("submit", function (e) {
    let isValid = true;

    // Get form fields
    const email = document.getElementById("email");
    const password = document.getElementById("password");

    // Reset previous errors
    document.querySelectorAll(".is-invalid").forEach(el => el.classList.remove("is-invalid"));

    // Validate Email
    if (!email.value.trim()) {
        email.classList.add("is-invalid");
        isValid = false;
    }

    // Validate Password
    if (!password.value || password.value.length < 6) {
        password.classList.add("is-invalid");
        isValid = false;
    }

    // Prevent form submission if invalid
    if (!isValid) {
        e.preventDefault();
        alert("Please correct the highlighted fields.");
    }
});