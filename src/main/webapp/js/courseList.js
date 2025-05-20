document.addEventListener('DOMContentLoaded', function() {
    // Add any client-side functionality here
    console.log('Course listing page loaded successfully');

    // Add hover effect for course rows
    const tableRows = document.querySelectorAll('tbody tr');
    tableRows.forEach(row => {
        row.addEventListener('mouseover', function() {
            this.style.backgroundColor = '#f0f8ff';
        });

        row.addEventListener('mouseout', function() {
            this.style.backgroundColor = '';
        });
    });
});