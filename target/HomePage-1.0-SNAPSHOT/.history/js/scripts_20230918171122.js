function handleButtonClick(clickedButton) {
    // Toggle the active state of the clicked anchor tag
    const buttons = document.querySelectorAll('.nav-link');
    buttons.forEach((button,index) => {
        if(index === 2) {
            button.classList.remove('active-dropdown');
            button.classList.remove('rotate');
        } else {
            button.classList.remove('active');
        }
    });
    clickedButton.classList.add('active');
    }
function DropdownClick(clickedButton) {
        // Toggle the active state of the clicked anchor tag
        const buttons = document.querySelectorAll('.nav-link');
        buttons.forEach(button => {
            button.classList.remove('active');
        });
        if(clickedButton.classList.contains('active-dropdown')) {
            clickedButton.classList.remove('active-dropdown');
            clickedButton.classList.remove('rotate');
        } else {
            clickedButton.classList.add('active-dropdown');
            clickedButton.style.display = "block";
            clickedButton.classList.add('rotate');
        }

        // Sự kiện click bên ngoài dropdown để đóng dropdown
        document.addEventListener("click", function(event) {
            var allDropdowns = document.querySelectorAll('.dropdown-menu-style');
            allDropdowns.forEach(function(dropdown) {
                if (!clickedButton.contains(event.target)) {
                    clickedButton.classList.remove('active-dropdown');
                    clickedButton.classList.remove('rotate');
                }
            });
        });
}
$(document).ready(function(){
    $('.row').slick({
     
    });
  });