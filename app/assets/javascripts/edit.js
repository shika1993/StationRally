$(function(){
  $(".user__right__actions").click(function(e){
    var user_name = $("#user_name")
    var user_email = $("#user_email")
    if (user_name[0].value == "" || user_email[0].value == ""){
      e.preventDefault();
      Swal.fire({
        text: '未入力項目があります',
        icon: 'warning', 
        showCancelButton: false,
        background: 'white',
        confirmButtonColor: '#99CCFF',
      });
    }else{
      document.location.href = "/";
    };

  });
});