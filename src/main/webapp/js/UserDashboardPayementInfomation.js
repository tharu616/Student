document.addEventListener('DOMContentLoaded', function() {
    // Initialize Bootstrap tooltips
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    const tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });

    // Toggle sidebar on small screens
    const sidebarToggler = document.querySelector('.sidebar-toggler');
    if (sidebarToggler) {
        sidebarToggler.addEventListener('click', function() {
            document.querySelector('.sidebar').classList.toggle('collapsed');
            document.querySelector('.main-content').classList.toggle('expanded');
        });
    }

    // Active navigation item
    const navLinks = document.querySelectorAll('.nav-link');
    navLinks.forEach(link => {
        if (link.getAttribute('href') === window.location.pathname.split('/').pop()) {
            link.closest('.nav-item').classList.add('active');
        }
    });

    // Dropdown functionality
    const dropdownItems = document.querySelectorAll('.dropdown-item');
    dropdownItems.forEach(item => {
        item.addEventListener('click', function(e) {
            e.preventDefault();
            const dropdownToggle = this.closest('.dropdown').querySelector('.dropdown-toggle');
            dropdownToggle.textContent = this.textContent;

            // Here you would typically fetch new data based on the selected filter
            // For demo purposes, we'll just log it
            console.log(`Selected: ${this.textContent}`);
        });
    });

    // "Pay Now" button click event
    const payNowButtons = document.querySelectorAll('.btn-primary');
    payNowButtons.forEach(button => {
        button.addEventListener('click', function() {
            // In a real application, this would open a payment modal or redirect to a payment page
            alert('This would redirect to the payment gateway in a real application.');
        });
    });

    // Logout functionality
    const logoutBtn = document.getElementById('logout-btn');
    if (logoutBtn) {
        logoutBtn.addEventListener('click', function(e) {
            e.preventDefault();
            // In a real application, this would handle the logout process
            if (confirm('Are you sure you want to logout?')) {
                alert('Logged out successfully!');
                // Redirect to login page in a real application
                // window.location.href = 'login.html';
            }
        });
    }

    // Responsive behavior
    function handleResponsive() {
        if (window.innerWidth < 768) {
            document.querySelector('.sidebar')?.classList.add('collapsed');
            document.querySelector('.main-content')?.classList.add('expanded');
        } else {
            document.querySelector('.sidebar')?.classList.remove('collapsed');
            document.querySelector('.main-content')?.classList.remove('expanded');
        }
    }

    // Call on load
    handleResponsive();

    // Call on resize
    window.addEventListener('resize', handleResponsive);
});