$(document).ready(function() {
    // Initialize unread notice count
    updateNotificationCount();

    // Mark notice as read
    $('.notice-mark-read').on('click', function() {
        const noticeId = $(this).data('id');
        const noticeCard = $(this).closest('.notice-card');

        // Toggle read/unread state
        noticeCard.toggleClass('notice-unread');

        // Update notification badge count
        updateNotificationCount();

        // Visual feedback
        if (noticeCard.hasClass('notice-unread')) {
            $(this).html('<i class="far fa-check-circle"></i> Mark as read');
            showToast('Notice marked as unread');
        } else {
            $(this).html('<i class="fas fa-check-circle"></i> Marked as read');
            showToast('Notice marked as read');

            // Change button style temporarily
            $(this).css('color', 'var(--primary-color)');
            setTimeout(() => {
                $(this).css('color', '');
                $(this).html('<i class="far fa-check-circle"></i> Mark as read');
            }, 2000);
        }

        // In a real application, you would make an AJAX call to update the read status
        // $.ajax({
        //     url: 'NoticeReadServlet',
        //     method: 'POST',
        //     data: {
        //         noticeId: noticeId,
        //         read: !noticeCard.hasClass('notice-unread')
        //     }
        // });
    });

    // Search functionality
    $('.search-input').on('input', function() {
        const searchTerm = $(this).val().toLowerCase();

        $('.notice-card').each(function() {
            const noticeTitle = $(this).find('.notice-title').text().toLowerCase();
            const noticeContent = $(this).find('.notice-body').text().toLowerCase();

            if (noticeTitle.includes(searchTerm) || noticeContent.includes(searchTerm)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });

    // Initialize current date
    const options = { year: 'numeric', month: 'long', day: 'numeric' };
    const today = new Date();
    $('.current-date').text(today.toLocaleDateString('en-US', options));

    // Update notification badge count
    function updateNotificationCount() {
        const unreadCount = $('.notice-unread').length;

        if (unreadCount > 0) {
            $('.notification-badge').text(unreadCount).show();
        } else {
            $('.notification-badge').hide();
        }
    }

    // Create and show toast notification
    function showToast(message) {
        // Remove existing toasts
        $('.toast-notification').remove();

        // Create new toast
        const toast = $(`
            <div class="toast-notification">
                <div class="toast-content">
                    <i class="fas fa-bell"></i>
                    <span>${message}</span>
                </div>
            </div>
        `);

        // Add toast to body
        $('body').append(toast);

        // Show and then hide toast
        setTimeout(() => {
            toast.addClass('show');

            setTimeout(() => {
                toast.removeClass('show');
                setTimeout(() => {
                    toast.remove();
                }, 300);
            }, 2000);
        }, 10);
    }
});
