
  function checkLoginState() {               // Called when a person is finished with the Login Button.
    FB.getLoginStatus(function(response) {   // See the onlogin handler
    	FB.login(function(response) {
  		  if (response.status === 'connected') {
  			testAPI();
  		  } 
  		  else {
  			  console.log('로그인 에러'); 
  		  }
  		},{scope: 'public_profile, email'});
    });
  }

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '273273647151212',
      cookie     : true,                     // Enable cookies to allow the server to access the session.
      xfbml      : true,                     // Parse social plugins on this webpage.
      version    : 'v7.0'           // Use this Graph API version for this call.
    });
  }

  function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
	    FB.api('/me',{fields: 'email'}, function(response) {
	      console.log(response);
	      
	      document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.name + '!';
	    })
  }