var myInterval = setInterval(function(){
  checkOnlineUsers()
}, 15000);

function checkOnlineUsers(){
  $.ajax({
    url: '/online_users',
    dataType: 'script',
  })
}
