$(function() {
  $('.main__images__picture__delete').click(function(e){
    e.preventDefault(); 
    var station_id = $(this)[0].baseURI.split("/")[4];
    var image_id = $(this).parent()[0].innerHTML.split("/")[4];
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
        url: '/stations/'+station_id+'/images/'+image_id,
        type: 'DELETE',
        success: function() {
        },error: function () {
          location.reload();
      }
    });
    });
  });  
});