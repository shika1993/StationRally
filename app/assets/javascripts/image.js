$(function() {
  $('.main__images__picture__delete').click(function(e){
    e.preventDefault(); 
    var a = $(this).parent()[0].innerHTML.split("/")[4];
    Swal.fire({
      text: '削除しますか？',
      icon: 'question', 
      showCancelButton: true,
      background: 'white',
      confirmButtonColor: '#99CCFF',
      cancelButtonColor: 'gray',
      confirmButtonText: 'OK',
      cancelButtonText: '削除しない'
    });
    $('.swal2-confirm').click(function(){
      $.ajax({
        url: '/stations/64/images/'+a,
        type: 'DELETE',
        success: function() {
        },error: function () {
          location.reload();
      }
    });
    });
  });  
});