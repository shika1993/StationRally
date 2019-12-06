$(function() {
  $('.main__images__picture__delete').click(function(){
    if(!confirm('削除してよろしいですか？')){
        return false;
    }else{ return true;
    }
  })
});