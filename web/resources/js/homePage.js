
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
    // querySelector - it returns the element within the document that matches the specified selector
    let dropdown = document.querySelector('.dropdown');

    //addEventListener - attaches an event handler to the specified element.
    dropdown.addEventListener('click', function (event) {

        //event.stopPropagation() - it stops the bubbling of an event to parent elements, by preventing parent event handlers from being executed
        event.stopPropagation();

        //classList.toggle - it toggles between adding and removing a class name from an element
        dropdown.classList.toggle('is-active');
    });
});


