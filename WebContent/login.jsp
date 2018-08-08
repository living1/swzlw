<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>失物招领系统</title>
		<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js" ></script>
		<style type="text/css">
			body{background: url(${pageContext.request.contextPath}/images/login-bg.jpg) no-repeat;background-size: cover;font-size: 16px;}
			.form{background: rgba(255,255,255,0.2);width:400px;margin:100px auto;}
			#login_form{display: block;}
			#register_form{display: none;}
			.fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
			input[type="text"],input[type="password"]{padding-left:26px;}
			.checkbox{padding-left:21px;}
		</style>

		<script type="text/javascript">
            function login(){
                var userName=$("#userName").val();
                var password=$("#password").val();
                var roleName=$("#roleName").val();
                if(userName==null||userName==""){
                    alert("用户名不能为空！");
                    return;
                }
                if(password==null||password==""){
                    alert("密码不能为空！");
                    return;
                }
                $("#login_form").submit();

            }
            
            function back(){
            	window.history.back(-1); 
            }
            
            function register(){
            	var userName=$("#userName1").val();
                var trueName=$("#trueName1").val();
                var isSchool=$("#isSchool1").val();
                var institute=$("#institute1").val();
                var email=$("#email1").val();
                var phone=$("#phone1").val();
                var password=$("#password1").val();
                var password2=$("#password2").val();
                if(userName==null||userName==""){
                    alert("用户名不能为空！");
                    return;
                }
                if(password==null||password==""){
                    alert("密码不能为空！");
                    return;
                }
                if(trueName==null||trueName==""){
                    alert("用户名不能为空！");
                    return;
                }
                if(email==null||email==""){
                    alert("密码不能为空！");
                    return;
                }
                if(phone==null||phone==""){
                    alert("用户名不能为空！");
                    return;
                }
               	if(password!=password2){
					alert("系统提示","确认密码输入错误!");
					return ;
				}
                $("#register_form").submit();
            }
		</script>
	</head>
	<body>
	<div class="container">
		<h1 style="text-align:center">失物招领系统</h1>
		<!--登录-->
		<div class="form row">
			<form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="login_form" method=post
				  action="${pageContext.request.contextPath}/user/login.do">
				<h3 class="form-title">登录</h3>
				<div class="col-sm-9 col-md-9">
					<div class="form-group">
						<i class="fa fa-user fa-lg"></i>
						<input class="form-control required" type="text" placeholder="用户名" name="userName" id="userName" value="${user.userName }" autofocus="autofocus" maxlength="20"/>
					</div>
					<div class="form-group">
						<i class="fa fa-lock fa-lg"></i>
						<input class="form-control required" type="password" placeholder="密码" name="password" id="password" value="${user.password }" maxlength="8"/>
					</div>
					<div class="form-group">
						<i class="fa fa-address-card-o fa-lg"></i>
						<select class="form-control required"  id="roleName" name="roleName" autofocus="autofocus" style="color:black" >
							<option value="" style="color:black" >&nbsp;&nbsp;&nbsp;&nbsp;请选择用户类型...</option>
							<option value="系统管理员" style="color:black"   ${'系统管理员'==user.roleName?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;系统管理员</option>
							<option value="普通用户" style="color:black"   ${'普通用户'==user.roleName?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;普通用户</option>
						</select>
					</div>
					<div class="form-group">
						<hr />
						<a href="javascript:;" id="register_btn" class="">注册</a>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-success pull-right" value="Login " onclick="javascript:login();return false;"/>
					</div>
				</div>
			</form>
		</div>

		<!--注册-->
		<div class="form row">
			<form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="register_form"
			method=post action="${pageContext.request.contextPath}/user/register.do">
				<h3 class="form-title">注册</h3>
				<div class="col-sm-9 col-md-9">
					<div class="form-group">
						<i class="fa fa-user fa-lg"></i>
						<input class="form-control required" type="text" placeholder="用户名" id="userName1" name="userName" value="${user.userName }" autofocus="autofocus"/>
					</div>
					<div class="form-group">
						<i class="fa fa-id-card fa-lg"></i>
						<input class="form-control required" type="text" placeholder="真实姓名" id="trueName1" name="trueName" value="${user.password }"/>
					</div>
					<div class="form-group">
						<i class="fa fa-address-card-o fa-lg"></i>
						<select class="form-control required"  id="isSchool1" name="isSchool" autofocus="autofocus" style="color:black" >
							<option value="" style="color:black" >&nbsp;&nbsp;&nbsp;&nbsp;是否本校</option>
							<option value="是" style="color:black"   ${'是'==user.isSchool?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;是</option>
							<option value="否" style="color:black"   ${'否'==user.isSchool?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;否</option>
						</select>
					</div>
					<div class="form-group">
						<i class="fa fa-address-card-o fa-lg"></i>
						<select class="form-control required"  id="institute1" name="institute" autofocus="autofocus" style="color:black" >
							<option value="" style="color:black" >&nbsp;&nbsp;&nbsp;&nbsp;所属学院</option>
							<option value="通信" style="color:black"   ${'光电'==user.institute?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;通信</option>
							<option value="光电" style="color:black"   ${'光电'==user.institute?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;光电</option>
							<option value="经管" style="color:black"   ${'经管'==user.institute?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;经管</option>
							<option value="计算机" style="color:black"   ${'计算机'==user.institute?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;计算机</option>
							<option value="外国语" style="color:black"   ${'外国语'==user.institute?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;外国语</option>
							<option value="生物" style="color:black"   ${'生物'==user.institute?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;生物</option>
							<option value="法学院" style="color:black"   ${'法学院'==user.institute?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;法学院</option>
							<option value="自动化" style="color:black"   ${'自动化'==user.institute?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;自动化</option>
							<option value="体育" style="color:black"   ${'体育'==user.institute?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;体育</option>
							<option value="理学院" style="color:black"   ${'理学院'==user.institute?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;理学院</option>
							<option value="传媒" style="color:black"   ${'传媒'==user.institute?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;传媒</option>
							<option value="软件" style="color:black"   ${'软件'==user.institute?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;软件</option>
							<option value="先进" style="color:black"   ${'先进'==user.institute?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;先进</option>
							<option value="国际" style="color:black"   ${'国际'==user.institute?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;国际</option>
							<option value="国际半导体" style="color:black"   ${'国际半导体'==user.institute?'selected':'' }>&nbsp;&nbsp;&nbsp;&nbsp;国际半导体</option>
						</select>
					</div>
					<div class="form-group">
						<i class="fa fa-envelope fa-lg"></i>
						<input class="form-control eamil" type="text" placeholder="邮箱" id="email1" name="email" value="${user.email }"/>
					</div>
					<div class="form-group">
						<i class="fa fa-phone fa-lg"></i>
						<input class="form-control phone" type="text" placeholder="手机号" id="phone1" name="phone" value="${user.phone }"/>
					</div>
					<div class="form-group">
							<i class="fa fa-lock fa-lg"></i>
							<input class="form-control required" type="password" placeholder="密码" id="password1" name="password" value="${user.password }"/>
					</div>
					<div class="form-group">
							<i class="fa fa-lock fa-lg"></i>
							<input class="form-control required" type="password" placeholder="确认密码" id="password2" name="password2"/>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-success pull-right" value="注册" onclick="javascript:register();return false;"/>
						<!-- <input type="reset" class="btn btn-info pull-left" onclick="javascript:back();return false;"value="返回登录"/> -->
					</div>
				</div>
			</form>
		</div>
		</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js" ></script>
	</body>
</html>
