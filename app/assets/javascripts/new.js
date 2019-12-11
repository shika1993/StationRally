$(function(){
  $(".user__right__actions").click(function(e){
    var user_email = $("#user_email");
    var user_password = $("#user_password");
    if (user_email[0].value == "" || user_password[0].value == ""){
      e.preventDefault();
      Swal.fire({
        text: '未入力項目があります',
        icon: 'warning', 
        showCancelButton: false,
        background: 'white',
        confirmButtonColor: '#99CCFF',
      });
    };
  });
});