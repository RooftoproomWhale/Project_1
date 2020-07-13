Kakao.init('c0e6cc61e58211222f29b50be0f8c221')
	console.log(Kakao.isInitialized());
  function loginWithKakao() {
    Kakao.Auth.login({
      	success: function(authObj) {
        kakaoTestApi();
      },
      fail: function(err) {
        alert(JSON.stringify(err))
      },
    })
  }
  
  function kakaoTestApi(){
	  Kakao.API.request({
		    url: '/v2/user/me',
		    success: function(response) {
		        console.log(response);
		        console.log(response['kakao_account']['email']);
		        let param = {};
			      param.name = response['properties']['nickname'];
			      param.email = response['kakao_account']['email'];
			      param.userEmail = response['kakao_account']['email'];
			      param.mem_email = response['kakao_account']['email'];
			      param.gender = response['kakao_account']['gender'];
			      param.pwd = response['id'];
			      param.mem_pwd = response['id'];
			      param.tel = '010-1234-5678';
			      param.role = 'ROLE_MEM';
			      param.enable = 1;
			      param.age = response['kakao_account']['age_range'].substring(0,2);
			      console.log(param.age);
			      param.weight = null;
			      param.height = null;
			      
			      $.ajax({
						url:'./snsInsert.hst',
						data:param,
						type:'post',
						success:function(data){
							console.log(data);
							location.replace("/proj/Home/ToHomePage.hst");
						},
						error:function(e){console.log('에러:',e)}
					});
		    },
		    fail: function(error) {
		        console.log(error);
		    }
		});
  }