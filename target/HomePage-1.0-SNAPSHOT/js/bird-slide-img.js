/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('.thumbnail').click(function() {
    var newImageSrc = $(this).attr('src');
    
    // Thay đổi hình ảnh chính
    $('.product__details__pic__item img').attr('src', newImageSrc);
  });