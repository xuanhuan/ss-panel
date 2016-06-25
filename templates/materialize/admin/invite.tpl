<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='../source.tpl'}>
<title>发放邀请码 - <{$site_name}></title>
<{include file='admin/header.tpl'}>
    <main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">发放邀请码<small> Generate Invite Code</small></h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p>管理员 <{$GetUserName}> 您好 :-)，您正在尝试发放邀请码。</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-sm-12">
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p class="card-heading">邀请码发放</p>
								<div class="form-group form-group-label">
									<label class="floating-label" for="code_sub">邀请码前缀</label>
									<input class="form-control" id="code_sub" type="text">
								</div>
								<div class="form-group form-group-label">
									<label class="floating-label" for="code_type">邀请码类别 0 为公开，其他数字为对应用户的 UID。</label>
									<input class="form-control" id="code_type" type="text">
								</div>
								<div class="form-group form-group-label">
									<label class="floating-label" for="code_num">邀请码数量（要生成的邀请码数量）</label>
									<input class="form-control" id="code_num" type="text">
								</div>
								<a class="btn btn-block btn-brand waves-attach waves-light" data-toggle="modal" href="#result">发放</a>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<div aria-hidden="true" class="modal modal-va-middle fade" id="result" role="dialog" tabindex="-1">
			<div class="modal-dialog modal-xs">
				<div class="modal-content">
					<div class="modal-inner">
						<p class="h5 margin-top-sm text-black-hint" id="msg">该操作不可撤销，是否继续？</p>
					</div>
					<div class="modal-footer">
						<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">取消</a><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" id="subinvite" type="submit">确认发放</a></p>
					</div>
				</div>
			</div>
		</div>
		<div aria-hidden="true" class="modal modal-va-middle fade" id="result_yes" role="dialog" tabindex="-1">
			<div class="modal-dialog modal-xs">
				<div class="modal-content">
					<div class="modal-heading">
						<p class="modal-title">发放成功！</p>
					</div>
					<div class="modal-inner">
						<p class="h5 margin-top-sm text-black-hint" id="msg"></p>
					</div>
					<div class="modal-footer">
						<p class="text-right"><a href="../invite_code.php" class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">查看邀请码</a><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">返回</a></p>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
<script type="text/javascript" src="<{$resources_dir}>/assets/js/Prompt_message.js"></script>
<script type="text/javascript">
  _Prompt_ss_msg();
</script>
<script type="text/javascript">
    $(document).ready(function(){
        $("#subinvite").click(function(){
            $.ajax({
                type:"POST",
                url:"invite_add_do.php",
                dataType:"json",
                data:{
                    code_sub: $("#code_sub").val(),
                    code_type: $("#code_type").val(),
                    code_num: $("#code_num").val(),
                },
                success:function(data){
                    if(data.ok){
                        $("#result_yes").modal();
                        $("#msg").html(data.msg);
                    }else{
                        $("#result_yes").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error:function(jqXHR){
                    alert("发生错误："+jqXHR.status);
                }
            })
        })
    })
</script>
