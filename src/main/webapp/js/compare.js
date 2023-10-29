/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('.thumbnail').click(function () {
    var newImageSrc = $(this).attr('src');
    // Thay đổi hình ảnh chính
    $('.product__details__pic__item img').attr('src', newImageSrc);
});
function adjustStyles() {
    var imgBird = document.getElementsByClassName("card-img-resize");
    var btnAdd = document.getElementsByClassName("btn-add");
    if (window.innerWidth < 1118) {
        for (var img of imgBird) {
            img.style.width = "260px";
            img.style.height = "200px";
        }
        for (btn of btnAdd) {
            btn.style.marginBottom = "10px";
        }
    } else {
        for (var img of imgBird) {
            img.style.width = "450px";
            img.style.height = "300px";
        }
    }
}

// Gọi hàm adjustStyles khi trang web được tải và khi kích thước màn hình thay đổi.
window.onload = adjustStyles;
window.onresize = adjustStyles;

var count = 0;
var flag = 0;
var inputField1 = document.getElementById("birdID1");
var inputField2 = document.getElementById("birdID2");
function compare(birdID, birdType) {
    var bird = document.getElementById(birdID);
    var selectedBirdType = birdType;
    var birdImage = bird.querySelector('#img-' + birdID).getAttribute('src');
    var birdName = bird.querySelector('#name-' + birdID).textContent;
    var compareLinkProduct = document.querySelectorAll('.formsg');
    var addedToCompare = false;
    var isSameSpecies = Array.from(compareLinkProduct).some(function (existingElement) {
        var existingBirdType = existingElement.dataset.birdType;
        flag++;
        return existingBirdType === selectedBirdType;
    });
    if (flag == 2 && !isSameSpecies) {
        isSameSpecies = true;
    }
    compareLinkProduct.forEach(function (divElement) {
        var imgElement = divElement.querySelector('img');
        var h6Element = divElement.querySelector('h6');
        if (!addedToCompare && (!imgElement || !h6Element) && isSameSpecies) {
            divElement.innerHTML = '<img id="compareImg-' + birdID + '" style="display: block;width: 100px; height: 80px;" src="' + birdImage + '" alt="">\n\
                                    <h6 id="compareName-' + birdID + '">' + birdName + '</h6>'
                    + '<span id="removeCompare-' + birdID + '" style="cursor: pointer;position: absolute;top: 1%;left: 95%" class="remove-ic-compare" onclick="removeCompare(\'' + birdID + '\')">'
                    + '<i class="fa-solid fa-xmark" style="color: #000000;"></i></span>';

            if (!inputField1.value) {
                inputField1.value = birdID;
            } else {
                inputField2.value = birdID;
            }
            addedToCompare = true;
            count++;
            divElement.dataset.birdType = selectedBirdType;
        }
    });
    if (count == 2) {
        var closeCompare = document.querySelector('.doss');
        closeCompare.style.backgroundColor = '#2f80ed';
        closeCompare.style.color = '#ffff';
    }
    if (!addedToCompare) {
        var btnCompare = document.querySelector('#btn-compare_' + birdID);
        if (btnCompare.textContent.trim() === 'So sánh') {
            event.preventDefault();
            // Tạo phần tử thông báo
            var notification = document.querySelector('#notification');
            if (!isSameSpecies) {
                notification.textContent = 'Không thể so sánh hai chim khác loại';
            } else {
                notification.textContent = 'Ô so sánh đã đầy. Không thể thêm chim so sánh.';
            }
            notification.style.display = 'block';
            // Hiển thị thông báo giữa màn hình
            var body = document.querySelector('body');
            body.appendChild(notification);
            setTimeout(function () {
                notification.style.display = 'none';
            }, 3000); // Xóa thông báo sau 3 giây (có thể điều chỉnh thời gian tùy ý)
        }
    }

    // Biến để theo dõi trạng thái hiện tại của từng nút
    var isAddedToCompare = bird.dataset.isAddedToCompare === 'true';
    var formCompare = document.querySelector('.stickCompare');
    var btnCompare = document.querySelector('#btn-compare_' + birdID);
    if (!isAddedToCompare) {
        formCompare.style.display = 'block';
        if (addedToCompare) {
            event.preventDefault();
            // Nếu chưa được thêm vào so sánh, thay đổi văn bản và trạng thái
            btnCompare.innerHTML = '<i class="text-primary bi bi-plus-circle"></i> Đã thêm so sánh';
            isAddedToCompare = true;
        } else {
            event.preventDefault();
        }
    } else {
        event.preventDefault();
        // Nếu đã được thêm vào so sánh, trả về văn bản ban đầu và trạng thái
        btnCompare.innerHTML = '<i class="text-primary bi bi-plus-circle"></i> So sánh';
        compareLinkProduct.forEach(function (divElement) {
            var imgElement = divElement.querySelector('#compareImg-' + birdID);
            var h6Element = divElement.querySelector('#compareName-' + birdID);
            if (imgElement || h6Element) {
                imgElement.remove();
                h6Element.remove();
                divElement.innerHTML = '<i class="icImageCompareNew"></i>' +
                        '<p>Thêm sản phẩm</p>';
                return;
            }
        });
        isAddedToCompare = false;
    }

    // Lưu trạng thái vào thuộc tính data để sử dụng sau này
//    bird.dataset.isAddedToCompare = isAddedToCompare;
}
function clearCompare(event) {
    event.preventDefault();
    var formCompare = document.querySelector('.stickCompare');
    var pillCompare = document.querySelector('.popup-button');
    formCompare.style.display = 'none';
    pillCompare.style.display = 'block';
}
function showCompare() {
    event.preventDefault();
    var formCompare = document.querySelector('.stickCompare');
    var pillCompare = document.querySelector('.popup-button');
    formCompare.style.display = 'block';
    pillCompare.style.display = 'none';
}
function RemoveAllIdCompare() {
    var btnCompares = document.querySelectorAll('.btn-compare');
    var formCompare = document.querySelector('.stickCompare');
    var compareLinkProduct = document.querySelectorAll('.formsg');
    btnCompares.forEach(function (btnCompare) {
        btnCompare.innerHTML = '<i class="text-primary bi bi-plus-circle"></i> So sánh';

    });
    compareLinkProduct.forEach(function (divElement) {
        divElement.innerHTML = '<i class="icImageCompareNew"></i>' +
                '<p>Thêm sản phẩm</p>';
        divElement.dataset.birdType = "";
        divElement.dataset.isAddedToCompare = false;
    });
    event.preventDefault();
    flag = 0;
    inputField1.value = null;
    inputField2.value = null;
    formCompare.style.display = 'none';
}
function removeCompare(bird) {
    var compareLinkProduct = document.querySelectorAll('.formsg');
    var btnCompare = document.querySelector('#btn-compare_' + bird);

    btnCompare.innerHTML = '<i class="text-primary bi bi-plus-circle"></i> So sánh';
    compareLinkProduct.forEach(function (divElement) {
        var imgElement = divElement.querySelector('#compareImg-' + bird);
        var h6Element = divElement.querySelector('#compareName-' + bird);
        if (imgElement || h6Element) {
            imgElement.remove();
            h6Element.remove();
            divElement.innerHTML = '<i class="icImageCompareNew"></i>' +
                    '<p>Thêm sản phẩm</p>';
            divElement.dataset.isAddedToCompare = false;
            return;
        }
    });
    var count = 0;
    compareLinkProduct.forEach(function (divElement) {
        var buttonRemove = divElement.querySelectorAll('.remove-ic-compare');
        if (buttonRemove.length == 0) {
            count++;
        }
    });
    if (count == 2) {
        var formCompare = document.querySelector('.stickCompare');
        compareLinkProduct.forEach(function (divElement) {
            divElement.dataset.birdType = "";
        });
        inputField1.value = null;
        inputField2.value = null;
        flag = 0;
        formCompare.style.display = 'none';
    }
}
function checkCheckbox() {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    var isChecked = false;
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            isChecked = true;
            break;
        }
    }
 
    var notification = document.getElementById('notification');
    if (!isChecked) {
        notification.style.display = 'block'; // Hiển thị thông báo
        setTimeout(function () {
            notification.style.display = 'none'; // Ẩn thông báo sau 3 giây (3000 milliseconds)
        }, 3000);
        return false; // Chặn việc gửi form
    }
    return true; // Cho phép gửi form
}

function pairing(birdID, birdType) {
    var bird = document.getElementById(birdID);
    var selectedBirdType = birdType;
    var birdImage = bird.querySelector('#img-' + birdID).getAttribute('src');
    var birdName = bird.querySelector('#name-' + birdID).textContent;
    var compareLinkProduct = document.querySelectorAll('.formsg');
    var addedToCompare = false;
    var isSameSpecies = Array.from(compareLinkProduct).some(function (existingElement) {
        var existingBirdType = existingElement.dataset.birdType;
        flag++;
        return existingBirdType === selectedBirdType;
    });
    if (flag == 2 && !isSameSpecies) {
        isSameSpecies = true;
    }
    compareLinkProduct.forEach(function (divElement) {
        var imgElement = divElement.querySelector('img');
        var h6Element = divElement.querySelector('h6');
        if (!addedToCompare && (!imgElement || !h6Element) && isSameSpecies) {
            divElement.innerHTML = '<img id="compareImg-' + birdID + '" style="display: block;width: 100px; height: 80px;" src="' + birdImage + '" alt="">\n\
                                    <h6 id="compareName-' + birdID + '">' + birdName + '</h6>'
                    + '<span id="removeCompare-' + birdID + '" style="cursor: pointer;position: absolute;top: 1%;left: 95%" class="remove-ic-compare" onclick="removeCompare(\'' + birdID + '\')">'
                    + '<i class="fa-solid fa-xmark" style="color: #000000;"></i></span>';

            if (!inputField1.value) {
                inputField1.value = birdID;
            } else {
                inputField2.value = birdID;
            }
            addedToCompare = true;
            count++;
            divElement.dataset.birdType = selectedBirdType;
        }
    });
    if (count == 2) {
        var closeCompare = document.querySelector('.doss');
        closeCompare.style.backgroundColor = '#2f80ed';
        closeCompare.style.color = '#ffff';
    }
    if (!addedToCompare) {
        var btnCompare = document.querySelector('#btn-compare_' + birdID);
        if (btnCompare.textContent.trim() === 'So sánh') {
            event.preventDefault();
            // Tạo phần tử thông báo
            var notification = document.querySelector('#notification');
            if (!isSameSpecies) {
                notification.textContent = 'Không thể so sánh hai chim khác loại';
            } else {
                notification.textContent = 'Ô so sánh đã đầy. Không thể thêm chim so sánh.';
            }
            notification.style.display = 'block';
            // Hiển thị thông báo giữa màn hình
            var body = document.querySelector('body');
            body.appendChild(notification);
            setTimeout(function () {
                notification.style.display = 'none';
            }, 3000); // Xóa thông báo sau 3 giây (có thể điều chỉnh thời gian tùy ý)
        }
    }
}


