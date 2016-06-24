<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='source.tpl'}>
<title>我的信息 -<{$site_name}></title>
<{include file='user/header.tpl'}>
    <main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">我的信息&nbsp;<small>My Information</small></h1>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-lg-push-3 col-sm-10 col-sm-push-1">
					<section class="content-inner margin-top-no">
						<div class="card">
							<div class="card-main">
								<div class="card-inner">
								    <div class="text-center">
								        <p>昵称：<{$GetUserName}></p>
								        <p>邮箱：<{$user_email}></p>
								        <p>注册时间：<{$RegDate}></p>
								        <p>套餐：<span class="label label-brand-accent"><{$get_plan}></span></p>
								        <p>喵币余额：<{$get_money}>个</p>
								    </div>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-main">
								<div class="card-inner">
                                    <a class="btn btn-block btn-brand-accent waves-attach waves-light"  data-toggle="modal" href="#kill"><i class="icon icon-lg">delete</i>&nbsp;删除我的账户</a>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</main>
</body>
<div aria-hidden="true" class="modal fade" id="kill" role="dialog" tabindex="-1">
    <div class="modal-dialog modal-full">
		<div class="modal-content">
			<iframe class="iframe-seamless" src="kill.php" title="kill" scrolling="no"></iframe>
		</div>
	</div>
</div>
<{include file='footer.tpl'}><{* 以上继承内容到父模板header.tpl 中的 contents *}>

</html>

<script>
    $(document).ready(function(){
        $("#checkin").click(function(){
            $.ajax({
                type:"GET",
                url:"_checkin.php",
                dataType:"json",
                success:function(data){
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
                },
                error:function(jqXHR){
                    alert("发生错误："+jqXHR.status);
                }
            })
        })
    })
</script>
