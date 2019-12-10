$(function() {
  $('.main__images__picture__delete').click(function(e){
    e.preventDefault(); 
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
  });  
}); 

