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
        centerMode: true,
        centerPadding: '60px',
        infinite: true,
        slidesToShow: 5,
        slidesToScroll: 1,
        arrows: true,
        prevArrow:"<button type='button' class='slick-prev pull-left slick-arrow'><i class='fa fa-angle-left' aria-hidden='true'></i></button>",
        nextArrow:"<button type='button' class='slick-next pull-right slick-arrow'><i class='fa fa-angle-right' aria-hidden='true'></i></button>",
        responsive: [
            {
                breakpoint: 1024,
                settings: {
                  slidesToShow: 3,
                  slidesToScroll: 1,
                  infinite: true,
                }
            },
            {
                breakpoint: 768,
                settings: {
                  arrows: false,
                  centerMode: true,
                  centerPadding: '40px',
                  slidesToShow: 3
                }
              },
            {
                breakpoint: 480,
                settings: {
                  slidesToShow: 1,
                  infinite: false,
                  arrows: false
                }
            },

        ]
    });
  });

const previous = document.querySelector('.slick-prev');
const next = document.querySelector('.slick-next');
const highlightElements = document.querySelectorAll('.slick-current');

if(previous != null) {
    // Thêm sự kiện click vào button 1
    previous.addEventListener('click', function() {
    
        // Thay đổi thuộc tính CSS của lớp "highlight"
        highlightElements.forEach(function(element) {
        element.style.border = '3px solid #37c5a4';
        });
    });
}
if(next != null) {
    // Thêm sự kiện click vào button 1
    next.addEventListener('click', function() {
  
    // Thay đổi thuộc tính CSS của lớp "highlight"
    highlightElements.forEach(function(element) {
      element.style.border = '3px solid #37c5a4';
    });
  });
}