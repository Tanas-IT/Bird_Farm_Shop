function showDetails(id) {
    // Ẩn tất cả các chi tiết hóa đơn
    var details = document.getElementsByClassName("invoice-details");

    for (var i = 0; i < details.length; i++) {
        details[i].classList.remove("active");
    }

    // Hiển thị chi tiết hóa đơn tương ứng với id được truyền vào
    var detail = document.getElementById("details-" + id);
    detail.classList.add("active");
}

function hideDetails(id) {
    // Ẩn chi tiết hóa đơn tương ứng với id được truyền vào
    var detail = document.getElementById("details-" + id);
    detail.classList.remove("active");
}