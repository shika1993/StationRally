$(function() {
  $('.main__images__picture__delete').click(function(e){
    e.preventDefault(); 
    Swal.fire({
      title: '本当に削除してよろしいですか？',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'OK',
      cancelButtonText: '削除しない',
      closeOnConfirm: false
    });
  });  
}); 

