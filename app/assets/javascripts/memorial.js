$(function(){
  var point = gon.memorial_point
  Swal.fire({ 
  title: point+'ぽいんと記念',
  text: 'おめでとうございます '+point+'ポイント達成です!',
  icon: 'success', 
  showCancelButton: false,
  background: 'white',
  confirmButtonColor: '#99CCFF',
  });
});