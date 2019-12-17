$(function() {
  $('.user__right__delete').click(function(e){
    e.preventDefault(); 
    var station_id = $(this)[0].baseURI.split("/")[4];
    var image_id = $(this).parent()[0].innerHTML.split("/")[4];
    Swal.fire({
      title: '退会しますか？',  
      text: '投稿した写真などの情報が全て削除されます',
      icon: 'question', 
      showCancelButton: true,
      background: 'white',
      confirmButtonColor: '#99CCFF',
      cancelButtonColor: 'gray',
      confirmButtonText: 'OK',
      cancelButtonText: '退会しない'
    });
    $('.swal2-confirm').click(function(){
      $.ajax({
        url: '/users/',
        type: 'DELETE', 
        dataType: 'json',
        success: function() {
          document.location.href = "/";
        }
      });
    });
  });  
});