$().ready(function() {
	$("#login_form").validate({
		rules: {
			user: "required",
			password: {
				required: true,
				minlength: 5
			},
		},
		messages: {
			user: "请输入用户名",
			password: {
				required: "请输入密码",
				minlength: jQuery.format("密码不能小于{0}个字 符")
			},
		}
	});
	$("#register_form").validate({
		rules: {
			userName: "required",
			realName: "required",
			email: {
				required: true,
				email: true
			},
			phone: {
				required : true,  
           		minlength : 11,  
            	isMobile : true  
			},
			password: {
				required: true,
				minlength: 5
			},
			comPassword: {
				equalTo: "#register_password"
			},
		},
		messages: {
			userName: "请输入用户名",
			realName: "请输入真实姓名",
			password: {
				required: "请输入密码",
				minlength: jQuery.format("密码不能小于{0}个字 符")
			},
			comPassword: {
				required: "请输入密码",
				equalTo: "两次密码不一样"
			},
			email: {
				required: "请输入邮箱",
				email: "请输入有效邮箱"
			},
			phone: {
				required: "请输入手机号",  
            	minlength: "确认手机不能小于11个字符",  
            	isMobile: "请正确填写您的手机号码" 
			}
		}
	});
});
$(function() {
	$("#register_btn").click(function() {
		$("#register_form").css("display", "block");
		$("#login_form").css("display", "none");
	});
	$("#back_btn").click(function() {
		$("#register_form").css("display", "none");
		$("#login_form").css("display", "block");
	});
});