$(function(){
  var rest = gon.rest_station
  if ( rest == '30' || rest == '40' || rest == '50' || rest == '60' || rest == '70'){
    Swal.fire({ 
      title: '残り'+rest+'駅!',
      text: '全駅制覇目指して頑張りましょう！',
      imageUrl: 'https://shikanai1993.s3-ap-northeast-1.amazonaws.com/uploads/image/picture/images_V1/star1.png',
      imageWidth: 50,
      imageHeight: 50,
      imageAlt: 'おめでとうございます！',
      showCancelButton: false,  
      background: 'white',
      confirmButtonColor: '#99CCFF',
      backdrop : ''
    });
  } if (rest == '75'){
    Swal.fire({   
      title: '㊗︎初投稿！',
      text: '全駅制覇目指して頑張りましょう！',
      imageUrl: 'https://shikanai1993.s3-ap-northeast-1.amazonaws.com/uploads/image/picture/images_V1/star1.png',
      imageWidth: 50,
      imageHeight: 50,
      imageAlt: 'おめでとうございます！',
      showCancelButton: false,
      background: 'white',
      confirmButtonColor: '#99CCFF',
      backdrop : 'rgba(255,211,13,0.2)'
    });
  } 
  if ( rest == '1' || rest == '2' || rest == '3' || rest == '5' || rest == '10' || rest == '15' || rest == '20'){
    Swal.fire({ 
      title: '残り'+rest+'駅！',
      text: '全駅制覇まであと少しです！',
      imageUrl: 'https://shikanai1993.s3-ap-northeast-1.amazonaws.com/uploads/image/picture/images_V1/star1.png',
      imageWidth: 50,
      imageHeight: 50,
      imageAlt: 'おめでとうございます！',
      showCancelButton: false,
      background: 'white',
      confirmButtonColor: '#99CCFF',
      backdrop : 'rgba(255,120,253,0.2)'
    });
  }
  if (rest == '0'){
    Swal.fire({ 
      title: '全駅制覇！',
      text: 'おめでとうございます！全ての駅を制覇しました！',
      imageUrl: 'https://shikanai1993.s3-ap-northeast-1.amazonaws.com/uploads/image/picture/images_V1/star1.png',
      imageWidth: 50,
      imageHeight: 50,
      imageAlt: 'おめでとうございます！',
      showCancelButton: false,
      background: 'white',
      confirmButtonColor: '#99CCFF',
      backdrop : 'rgba(255,211,13,0.2)'
    });
  } 
  else {
  }
})
