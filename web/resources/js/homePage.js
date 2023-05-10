
// Function to add event listenr in navbar hamburger menu
document.addEventListener('DOMContentLoaded', () => {

    // Get all "navbar-burger" elements
    const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

    // Add a click event on each of them
    $navbarBurgers.forEach(el => {
        el.addEventListener('click', () => {

            // Get the target from the "data-target" attribute
            const target = el.dataset.target;
            const $target = document.getElementById(target);

            // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
            el.classList.toggle('is-active');
            $target.classList.toggle('is-active');
        });
    });
});

// Function to add event listenr in navbar dropdown menu
document.addEventListener('DOMContentLoaded', function () {
    // Select all dropdown elements
    let dropdowns = document.querySelectorAll('.dropdown');

    // Attach event listener to each dropdown
    dropdowns.forEach(function (dropdown) {
        // Handle the click event on each dropdown
        dropdown.addEventListener('click', function (event) {
            // Prevent the event from bubbling up to parent elements
            event.stopPropagation();

            // Toggle the 'is-active' class to show/hide the dropdown
            dropdown.classList.toggle('is-active');
        });
    });
});

// Function to add event listenr in create course menu item
document.addEventListener('DOMContentLoaded', function () {
    // Get the button that opens the form
    let openCourseForm = document.querySelector('[id="open-course-form"]');

    // Get the button that closes the form
    let closeCourseForm = document.querySelector('[id="close-course-form"]');

    // Get the new corse form modal element
    let courseForm = document.querySelector('[id=course-form]');

    // Function to open the fomr
    function openCourseFormFunc() {
        courseForm.classList.add('is-active');
    }

    // Function to close the form
    function closeCourseFormFunc() {
        courseForm.classList.remove('is-active');
    }

    // Event listener to open the form when the button is clicked
    openCourseForm.addEventListener('click', openCourseFormFunc);

    // Event listener to close the form when the close button is clicked
    closeCourseForm.addEventListener('click', closeCourseFormFunc);
});

