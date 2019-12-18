$(function() {
  $('.user__right__delete').click(function(e){
    e.preventDefault();
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
          Swal.fire({
            text: '写真の削除に失敗しました',
            icon: 'warning', 
            showCancelButton: false,
            background: 'white',
            confirmButtonColor: '#99CCFF',
          });
        },error: function () {
          location.href = "/";
        }  
      });
    });
  });  
});