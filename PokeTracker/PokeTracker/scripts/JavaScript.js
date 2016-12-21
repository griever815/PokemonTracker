/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
function openNav() {
    document.getElementById("mySidenav").style.width = "150px";
    document.getElementById("main").style.marginLeft = "150px";
}

/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
}



// When the user clicks on the button, open the modal 
function openModal(imgName) {
    var imgPath = "images/" + imgName;
    var modal = document.getElementById('myModal');
    document.getElementById('modalImage').src = imgPath;
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
function closeModal() {
    var modal = document.getElementById('myModal');
   modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    var modal = document.getElementById('myModal');
    if (event.target == modal) {
        modal.style.display = "none";
    }
}