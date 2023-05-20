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

    if (openCourseForm !== null) {
        // Event listener to open the form when the button is clicked
        openCourseForm.addEventListener('click', openCourseFormFunc);

        // Event listener to close the form when the close button is clicked
        closeCourseForm.addEventListener('click', closeCourseFormFunc);
    }
});

// Function to add event listenr in join course menu item
document.addEventListener('DOMContentLoaded', function () {
    // Get the button that opens the form
    let openEnrollForm = document.querySelector('#open-enroll-form');

    // Get the button that closes the form
    let closeEnrollForm = document.querySelector('#close-enroll-form');

    // Get the join corse form modal element
    let joinForm = document.querySelector('#enroll-form');

    // Function to open the form
    function openEnrollFormFunc() {
        joinForm.classList.add('is-active');
    }

    // Function to close the form
    function closeEnrollFormFunc() {
        joinForm.classList.remove('is-active');
    }

    if (openEnrollForm !== null) {
        // Event listener to open the form when the button is clicked
        openEnrollForm.addEventListener('click', openEnrollFormFunc);

        // Event listener to close the form when the close button is clicked
        closeEnrollForm.addEventListener('click', closeEnrollFormFunc);
    }
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

    // Use select2 for the course select option
    $('#course-select').select2({
        placeholder: '-- Select a course --',
        width: "100%"
    });

    // Change the URL without reloading the page
    let section = $("#data").data("param1");
    history.replaceState(null, "", "/" + window.location.pathname.split('/')[1] + "/" + section);
});

// Function to share course data to the course modal
function shareCourseData(id, title, subject, teacher, teacher_uname, teacher_mail) {
    // Change the corresponding fields in the course modal
    document.getElementById("course-card-title").innerHTML = title + "&nbsp;&nbsp;&nbsp;- " + subject;
    document.getElementById("instructor-uname").innerHTML = teacher_uname;
    document.getElementById("instructor-name").innerHTML = teacher;
    document.getElementById("instructor-mail").innerHTML = teacher_mail;

    // Send the course id to the course modal
    $.ajax({
        url: "protected/courseModal.jsp",
        data: {
            course_id: id
        },
        success: function (response) {
            // Replace the student table content with the updated data
            $('#student-table').html(response);
            console.log(response);
        },
        error: function () {
            alert('Failed to fetch updated data.');
        }
    });
}

// Function to toggle between course modal tabs
function toggleTabs(evt, tabName) {
    let i, alltabs, tablinks;
    // Get all the tab contents and hide them
    alltabs = document.getElementsByClassName("tab-content");
    for (i = 0; i < alltabs.length; i++) {
        alltabs[i].style.display = "none";
    }

    // Remove is-active class from all the tabs
    tablinks = document.getElementsByClassName("tab");
    for (i = 0; i < alltabs.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" is-active", "");
    }

    // Show the clicked tab and add is-active class 
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " is-active";
}

