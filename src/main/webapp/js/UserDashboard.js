document.addEventListener('DOMContentLoaded', function() {
    // Initialize sidebar navigation
    initializeSidebar();

    // Initialize course card interactions
    initializeCourseCards();

    // Initialize notice card interactions
    initializeNoticeCards();
});

/**
 * Initialize sidebar navigation functionality
 */
function initializeSidebar() {
    const navLinks = document.querySelectorAll('.sidebar .nav-link');

    // Add click event listeners to all nav links
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            // Prevent default for demo
            e.preventDefault();

            // Remove active class from all links
            navLinks.forEach(l => l.classList.remove('active'));

            // Add active class to clicked link
            this.classList.add('active');

            console.log(`Navigating to: ${this.textContent.trim()}`);
        });
    });
}

/**
 * Initialize course card interactions
 */
function initializeCourseCards() {
    const viewButtons = document.querySelectorAll('.course-card .btn');

    viewButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();

            const courseName = this.closest('.course-card').querySelector('h4').textContent;
            alert(`Viewing course: ${courseName}`);
        });
    });

    // Make entire course card clickable
    const courseCards = document.querySelectorAll('.course-card');
    courseCards.forEach(card => {
        card.addEventListener('click', function() {
            const viewButton = this.querySelector('.btn');
            if (viewButton) {
                viewButton.click();
            }
        });
    });
}

/**
 * Initialize notice card interactions
 */
function initializeNoticeCards() {
    const seeMoreLinks = document.querySelectorAll('.notice-card .see-more');

    seeMoreLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();

            const noticeTitle = this.closest('.notice-card').querySelector('h5').textContent;
            alert(`More details about notice: ${noticeTitle}`);
        });
    });
}

/**
 * Search functionality
 */
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.querySelector('.search-bar input');

    if (searchInput) {
        searchInput.addEventListener('keyup', function(e) {
            if (e.key === 'Enter') {
                const searchTerm = this.value.trim();

                if (searchTerm) {
                    console.log(`Searching for: ${searchTerm}`);
                }
            }
        });
    }
});
