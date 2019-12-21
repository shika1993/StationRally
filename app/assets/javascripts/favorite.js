$(function(){

  $('.button_to').on("click" , function(e) {
    e.preventDefault();
    var station_id = this.action.split("/")[4]
    var image_id = this.action.split("/")[6]
    $.ajax({
      url: '/stations/'+station_id+'/images/'+image_id+"/favorites",
      type: 'POST', 
      dataType: 'json'
    })
    .done(function(){
      location.reload();
    })
    .fail(function() {
      Swal.fire({
        text: 'お気に入り登録に失敗しました',
        icon: 'warning', 
        showCancelButton: false,
        background: 'white',
        confirmButtonColor: '#99CCFF',
      });
    });

  });

});