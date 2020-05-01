let xhr = new XMLHttpRequest();

let main_login = function() {
	$('#btn_main_login').click(function() {

		let c = $('#login_modal_form').serialize();
		$.post('/link-page/login_check.jsp', c, function(data) {
			let a = data.split("/?");
			
			
			if (data.indexOf("true") >= 0) {
				$('#btnLogin').toggle();
				$('#btnSign').toggle()
				$('#logout-span').toggle();
				$('#logout-span2').toggle();
				$('#login-Modal').modal('hide');
				$('nav#navbar_bot').css("display", "none"); // 로그인시 navbar 없애기
				var mId = $('#main_login_email').val();
				sessionStorage.setItem('mId', mId);
	
			} else {
				$('#b_f').trigger("click");
			}
		})
	})
}

let login_btn_attr = function() {

	$('#main_login_email').keyup(function(key) {

		var mail = $('#main_login_email').val();
		var pwd = $('#main_login_pwd').val()
		if (mail == "" || pwd == "" || !email_check(mail)) {

			$('#btn_main_login').attr('disabled', 'disabled');
		}

		if (mail != "" && pwd != "" && email_check(mail)) {
			$('#btn_main_login').removeAttr('disabled');
			if (key.keyCode == 13) {
				$('#btn_main_login').trigger('click');
			}
		}
	})

	$('#main_login_pwd').keyup(function(key) {

		var mail = $('#main_login_email').val();
		var pwd = $('#main_login_pwd').val()
		if (mail == "" || pwd == "" || !email_check(mail)) {

			$('#btn_main_login').attr('disabled', 'disabled');
		}

		if (mail != "" && pwd != "" && email_check(mail)) {
			$('#btn_main_login').removeAttr('disabled');

			if (key.keyCode == 13) {
				$('#btn_main_login').trigger('click');
			}
		}

	})

}

let join_btn_attr = function(key) {

	$('#main_join_email').keyup(
			function() {
				var email = $('#main_join_email').val();
				var name = $('#main_join_name').val();
				var pwd = $('#main_join_pwd').val();
				var phone = $('#main_join_phone').val();

				if (email == "" || pwd == "" || name == "" || phone == ""
						|| !email_check(email) || !name_check(name)
						|| !phone_check(phone)) {
					$('#btn_modal_join_sb').attr('disabled', 'disabled');
				}

				if (email != "" && pwd != "" && name != "" && phone != ""
						&& email_check(email) && name_check(name)
						&& phone_check(phone)) {
					$('#btn_modal_join_sb').removeAttr('disabled');
					if (key.keyCode == 13) {
						$('#btn_modal_join_sb').trigger('click');
					}
				}
			})

	$('#main_join_name').keyup(
			function() {
				var email = $('#main_join_email').val();
				var name = $('#main_join_name').val();
				var pwd = $('#main_join_pwd').val();
				var phone = $('#main_join_phone').val();

				if (email == "" || pwd == "" || name == "" || phone == ""
						|| !email_check(email) || !name_check(name)
						|| !phone_check(phone)) {
					$('#btn_modal_join_sb').attr('disabled', 'disabled');
				}
				if (email != "" && pwd != "" && name != "" && phone != ""
						&& email_check(email) && name_check(name)
						&& phone_check(phone)) {
					$('#btn_modal_join_sb').removeAttr('disabled');
					if (key.keyCode == 13) {
						$('#btn_modal_join_sb').trigger('click');
					}
				}

			})
	$('#main_join_phone').keyup(
			function(key) {
				var email = $('#main_join_email').val();
				var name = $('#main_join_name').val();
				var pwd = $('#main_join_pwd').val();
				var phone = $('#main_join_phone').val();

				if (email == "" || pwd == "" || name == "" || phone == ""
						|| !email_check(email) || !name_check(name)
						|| !phone_check(phone)) {
					$('#btn_modal_join_sb').attr('disabled', 'disabled');
				}
				if (email != "" && pwd != "" && name != "" && phone != ""
						&& email_check(email) && name_check(name)
						&& phone_check(phone)) {
					$('#btn_modal_join_sb').removeAttr('disabled');
					if (key.keyCode == 13) {
						$('#btn_modal_join_sb').trigger('click');
					}
				}

			})
	$('#main_join_pwd').keyup(
			function(key) {
				var email = $('#main_join_email').val();
				var name = $('#main_join_name').val();
				var pwd = $('#main_join_pwd').val();
				var phone = $('#main_join_phone').val();

				if (email == "" || pwd == "" || name == "" || phone == ""
						|| !email_check(email) || !name_check(name)
						|| !phone_check(phone)) {
					$('#btn_modal_join_sb').attr('disabled', 'disabled');
				}
				if (email != "" && pwd != "" && name != "" && phone != ""
						&& email_check(email) && name_check(name)
						&& phone_check(phone)) {
					$('#btn_modal_join_sb').removeAttr('disabled');
					if (key.keyCode == 13) {
						$('#btn_modal_join_sb').trigger('click');
					}
				}

			})

}

let modal_hide = function() {
	$('#login-Modal').modal('hide');
}

let modal_hide2 = function() {
	$('#join-Modal').modal('hide');
}

let main_join = function() {
	$('#btn_modal_join_sb').click(function() {

		let c = $('#join_modal_form').serialize();

		$.post('/link-page/join_check.jsp', c, function(data) {
			console.log(data);
			if (Number(data) > 0) { // 성공
				$('#btnLogin').toggle();
				$('#btnSign').toggle()
				$('#logout-span').toggle();
				$('#logout-span2').toggle();
				$('#join-Modal').modal('hide');
				var mId = $('#main_join_email').val();
				sessionStorage.setItem('mId', mId);
			} else { // 중복 이메일 존재할 시
				$('#j_f').trigger("click");
			}
		})

	})
}

let btn_logout_yes = function() {
	sessionStorage.removeItem("mId");
	$('#logout-modal').modal('hide');
	$('#logout-span2').hide();
	$('#logout-span').hide();
	location.href = "/";
}

let btn_logout_after = function() {
	$(document).on("click", "#logout_yes", function(event) {
		$('#btnLogin').show()
		$('#btnSign').show()
		$('#logout-span').hide()
		$('#logout-span2').hide()
	});
}

let login_form_check = function() {

	$('#main_login_email')
			.blur(
					function() { // 입력창에 포커스 제거된 경우

						var email = $(this).val();

						if (email == '')
							return; // 입력 안한경우는 검사 안함

						if (!email_check(email)) {

							$(this).addClass("email_n");
							let str = '<span style="font-size: 12px;color: red;font-weight: bold;" id="email_check_p">이메일 형식을 확인해 주세요!</span>'
							$('#email_text').html(str);
						}

						if (email_check(email) || email == "") {
							$(this).removeClass("email_n")
							$('#email_check_p').hide();

						}

					})

}
let findPwd_form_check = function() {

	$('#find_pwd_email')
			.blur(
					function() { // 입력창에 포커스 제거된 경우

						var email = $(this).val();

						if (email == '')
							return; // 입력 안한경우는 검사 안함

						if (!email_check(email)) {

							$(this).addClass("email_n");
							let str = '<span style="font-size: 12px;color: red;font-weight: bold;" id="email_check_find">이메일 형식을 확인해 주세요!</span>'
							$('#email_text3').html(str);
						}

						if (email_check(email) || email == "") {
							$(this).removeClass("email_n")
							$('#email_check_find').hide();

						}

					})

}

let join_form_check = function() {
	$('#main_join_name')
			.blur(
					function() {
						var name = $(this).val();

						if (name == '')
							return;

						if (!name_check(name)) {

							$(this).addClass("email_n");
							let str = '<span style="font-size: 12px;color: red;font-weight: bold;" id="n_ck">이름 형식을 확인해 주세요!</span>'
							$('#name_text').html(str);
						}

						if (name_check(name) || name == "") {

							$(this).removeClass("email_n")
							$('#n_ck').hide();
						}
					})

	$('#main_join_phone')
			.blur(
					function() {

						var phone = $(this).val();

						if (phone == '')
							return;
						if (!phone_check(phone)) {
							$(this).addClass("email_n");
							let str = '<span style="font-size: 12px;color: red;font-weight: bold;" id="p_ck">11자리 숫자만 입력해 주세요!</span>'
							$('#phone_text').html(str);

						}

						if (phone_check(phone) || phone == "") {
							$(this).removeClass("email_n")
							$('#p_ck').hide();
						}
					})

	$('#main_join_email')
			.blur(
					function() {

						var email = $(this).val();
						if (email == '')
							return;
						if (!email_check(email)) {
							$(this).addClass("email_n");
							let str = '<span style="font-size: 12px;color: red;font-weight: bold;"id="e_ck" >이메일 형식을 확인해 주세요!</span>'
							$('#email_text2').html(str);

						}
						if (email_check(email) || email == "") {
							$(this).removeClass("email_n")
							$('#e_ck').hide();
						}
					})

}

function email_check(email) {

	var regex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	return (email != '' && regex.test(email));
}

function name_check(name) {
	var regex = /^[가-힣]+$/;
	return (name != '' && regex.test(name));
}

function phone_check(phone) {
	var regex = /^[0-9]{11}$/;
	return (phone != '' && regex.test(phone));
}

let find_pwd = function() { // 비밀번호 찾기
	$('#btn_find_pwd_send').click(function() {

		let c = $('#pwdFind_modal_form').serialize();

		$.post('/link-page/find_pwd.jsp', c, function(data) {

			let str = $.trim(data);
			$('#find_result_text').html(str);
			$('#f_r').trigger("click");

		})

		// $('#pwdFind_modal_form').attr('action','send_mail.he').submit();

	})
}

let top_button = function() {

	if (sessionStorage.getItem("mId") == null) {
		console.log("test");
		$('#logout-span2').hide();
		$('#logout-span').hide();

	} else {
		$('#btnLogin').hide();
		$('#btnSign').hide();

	}
}