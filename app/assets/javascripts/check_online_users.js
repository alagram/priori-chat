var myInterval = setInterval(function(){
  checkOnlineUsers()
}, 30000);

function checkOnlineUsers(){
  $.ajax({
    url: '/online_users',
    dataType: 'script',
  })
}
