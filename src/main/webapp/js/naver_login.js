var naver_id_login = new naver_id_login("Av8dACAdbqwealRRwJLk", "http://localhost:8080/proj/User/Login.hst");
var state = naver_id_login.getUniqState();
naver_id_login.setButton("green", 1, 60);
naver_id_login.setDomain("http://localhost:8080");
naver_id_login.setState(state);
naver_id_login.setPopup();
naver_id_login.init_naver_id_login();