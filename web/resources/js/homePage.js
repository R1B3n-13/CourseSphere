/*
 Document   : js file for the home and different pages.
 Created on : May 12, 2023, 4:32:50 PM
 Author     : Sadik Al Barid
 */

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
    let openCourseForm = document.querySelector('#open-course-form');

    // Get the button that closes the form
    let closeCourseForm = document.querySelector('#close-course-form');

    // Get the new corse form modal element
    let courseForm = document.querySelector('#course-form');

    // Function to open the form
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

// Function to add event listenr in course card
document.addEventListener('DOMContentLoaded', function () {
    // Get the button that opens the card
    let openCourseCard = Array.prototype.slice.call(document.querySelectorAll('.open-course-card'), 0);

    // Get the button that closes the card
    let closeCourseCard = document.querySelector('#close-course-card');

    // Get the corse card modal element
    let courseCard = document.querySelector('#course-card');

    // Function to open the card
    function openCourseCardFunc() {
        courseCard.classList.add('is-active');
    }

    // Function to close the card
    function closeCourseCardFunc() {
        courseCard.classList.remove('is-active');
    }

    // Event listener to open the card when the button is clicked
    openCourseCard.forEach(el => {
        el.addEventListener('click', openCourseCardFunc);
    });

    // Event listener to close the card when the close button is clicked
    closeCourseCard.addEventListener('click', closeCourseCardFunc);
});

// This function executes as soon as the dom loads
$(document).ready(function () {
    // Use select2 for the teacher select option
    $('#teacher-select').select2({
        placeholder: '-- Assign a teacher --',
        width: "100%"
    });

    let section = $("#data").data("param1");
    // Change the URL without reloading the page
    history.replaceState(null, "", "/" + window.location.pathname.split('/')[1] + "/" + section);
});

function shareCourseData(title, subject, teacher) {
    document.getElementById("course-card-title").innerHTML = title + "&nbsp;&nbsp;&nbsp;- " + subject;
}

