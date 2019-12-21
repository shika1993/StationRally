$(function(){
  var rest = gon.rest_station
  var gone = gon.gone_station
  if (rest == '1' || rest == '2' || rest == '3' || rest == '5' || rest == '10' || rest == '15' || rest == '20' || rest == '30' || rest == '40' || rest == '50' || rest == '60' || rest == '70' || rest == '75' ){
  Swal.fire({ 
  title: gone+'駅 達成記念',
  text: 'おめでとうございます 残り'+rest+'駅です!',
  icon: 'success', 
  showCancelButton: false,
  background: 'white',
  confirmButtonColor: '#99CCFF',
  });
  } else {
  }
});
