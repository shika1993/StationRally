$(function(){
  $(".user__right__actions").click(function(e){
    var user_name = $("#user_name")
    var user_email = $("#user_email")
    e.preventDefault();
    if (user_name[0].value == "" && user_email[0].value == ""){
      Swal.fire({
        text: '名前とメールアドレス入力してください',
        icon: 'warning', 
        showCancelButton: false,
        background: 'white',
        confirmButtonColor: '#99CCFF',
      });
    }else if (user_name[0].value == ""){
      Swal.fire({
        text: '名前を入力してください',
        icon: 'warning', 
        showCancelButton: false,
        background: 'white',
        confirmButtonColor: '#99CCFF',
      });
    }else if(user_email[0].value == ""){
      Swal.fire({
        text: 'メールアドレスを入力してください',
        icon: 'warning', 
        showCancelButton: false,
        background: 'white',
        confirmButtonColor: '#99CCFF',
      });
    };

  });
});