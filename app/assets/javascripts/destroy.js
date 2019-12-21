$(function() {
  $('.user__right__delete').click(function(e){
    e.preventDefault();
    Swal.fire({
      title: '本当に退会しますか？',  
      html: '投稿した写真などの情報が<br>全て削除されます',
      icon:'warning', 
      showCancelButton: true,
      background: 'white',
      confirmButtonColor: '#cc0000',
      cancelButtonColor: 'gray',
      confirmButtonText: 'OK',
      confirmButtonColor: '#cc0000',
      cancelButtonText: '退会しない'
    });
    $('.swal2-confirm').click(function(){
      $.ajax({
        url: '/users/',
        type: 'DELETE', 
        dataType: 'json',
        success: function() {
          location.href = "/";
        },error: function () {
          location.href = "/";
        }  
      });
    });
  });  
});

