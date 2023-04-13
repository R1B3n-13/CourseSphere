/*
    Document   : js file for the regestration form modal and the login button.
    Created on : Apr 13, 2023, 6:41:50 AM
    Author     : Sadik Al Barid
 */

// Get the modal element
let regModal = document.querySelector('[id=reg-modal]');

// Get the button that opens the modal
let openRegModalButton = document.querySelector('[id="open-reg-modal"]');

// Get the button that closes the modal
let closeRegModalButton = document.querySelector('[id="close-reg-modal"]');

// Function to open the modal
function openRegModal() {
    regModal.classList.add('is-active');
}

// Function to close the modal
function closeRegModal() {
    regModal.classList.remove('is-active');
}

// Event listener to open the modal when the button is clicked
openRegModalButton.addEventListener('click', openRegModal);

// Event listener to close the modal when the close button is clicked
closeRegModalButton.addEventListener('click', closeRegModal);
