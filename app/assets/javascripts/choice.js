$(function() {
  $('.postform__commentform__input__picture__btn').on('change', function(e) {
      // 1枚だけ表示する
    var file = e.target.files[0];

      // ファイルのブラウザ上でのURLを取得する
    var blobUrl = window.URL.createObjectURL(file);

      // img要素に表示
    $('#choice-picture').attr('src', blobUrl);
  });
});