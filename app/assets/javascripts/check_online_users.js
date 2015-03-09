var myInterval = setInterval(function(){
  checkOnlineUsers()
}, 3000);

function checkOnlineUsers(){
  $.ajax({
    url: '/online_users',
    dataType: 'script',
  })
}
