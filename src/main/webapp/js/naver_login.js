var naver_id_login = new naver_id_login("YOUR_CLIENT_ID", "YOUR_CALLBACK_URL");
var state = naver_id_login.getUniqState();
naver_id_login.setButton("white", 3, 65);
naver_id_login.setDomain("YOUR_SERVICE_URL");
naver_id_login.setState(state);
naver_id_login.setPopup();
naver_id_login.init_naver_id_login();