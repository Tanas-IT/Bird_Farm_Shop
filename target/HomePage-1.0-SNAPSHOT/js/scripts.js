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

$(document).ready(function(){
    $('.row-item').slick({
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
                  slidesToScroll: 1,
                  slidesToShow: 3
                }
              },
            {
                breakpoint: 480,
                settings: {
                  slidesToShow: 1,
                  slidesToScroll: 1,
                  infinite: false,
                }
            },

        ]
    });
    
    $('.img-description').slick({
        infinite: true,
        slidesToShow: 4,
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
                  slidesToScroll: 1,
                  slidesToShow: 3
                }
              },
            {
                breakpoint: 480,
                settings: {
                  slidesToShow: 1,
                  slidesToScroll: 1,
                  infinite: false,
                }
            },

        ]
    });
     // Lấy các phần tử liên quan
  var quantityInput = $("#quantityInput");
  var incrementButton = $(".btn-plus");
  var decrementButton = $(".btn-minus");

  // Xử lý sự kiện khi nhấp vào nút cộng
  incrementButton.click(function() {
    var value = parseInt(quantityInput.val());
    var maxValue = parseInt(quantityInput.attr("max"));
    if (value < maxValue) {
      quantityInput.val(value + 1);
    }
  });

  // Xử lý sự kiện khi nhấp vào nút trừ
  decrementButton.click(function() {
    var value = parseInt(quantityInput.val());
    var minValue = parseInt(quantityInput.attr("min"));
    if (value > minValue) {
      quantityInput.val(value - 1);
    }
  });
  });