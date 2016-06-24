<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='source.tpl'}>
<title>兑换码 -<{$site_name}></title>
<{include file='user/header.tpl'}>
<main class="content">
	<div class="content-header ui-content-header">
		<div class="container">
			<h1 class="content-heading">兑换&nbsp;<small>Code</small></h1>
		</div>
	</div>
	<div class="container">
		<section class="content-inner margin-top-no">
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="card margin-bottom-no">
						<div class="card-main">
							<div class="card-inner">
								<p><{$GetUserName}>，您好 :-),您在使用兑换码。</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="ui-card-wrap">
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p class="card-heading"><i class="icon icon-lg">card_membership</i>&nbsp;兑换码</p>
								<div class="form-group form-group-label">
									<label class="floating-label" for="code"><i class="icon icon-lg">send</i>&nbsp;输入您的兑换码</label>
									<input class="form-control" id="code" name="code" maxlength="30" required>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<div class="text-center">
									<p class="card-heading"><i class="icon icon-lg">info_ouline</i>&nbsp;兑换码信息</p>
									<p id="info"></p>
									<{include file='loading.tpl'}>
								</div>
								<button data-toggle="modal" class="btn btn-block btn-brand-accent waves-attach waves-light" id='test'><i class="icon icon-lg">done</i>&nbsp;提交并检查兑换码</button>
								<button data-toggle="modal" class="btn btn-block btn-brand waves-attach waves-light" id='exchange' style="display:none;"><i class="icon icon-lg">done_all</i>&nbsp;兑换</button>
							</div>
						</div>
					</div>
			</div>
		</section>
	</div>
</main>
</body>
<div aria-hidden="true" class="modal modal-va-middle fade" id="result" role="dialog" tabindex="-1">
	<div class="modal-dialog modal-xs">
		<div class="modal-content">
			<div class="modal-inner">
				<p class="h5 margin-top-sm text-black-hint" id="msg"></p>
			</div>
			<div class="modal-footer">
				<p class="text-right">
					<button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" type="button">确定</button>
				</p>
			</div>
		</div>
	</div>
</div>
<{include file='footer.tpl'}>

<script type="text/javascript">
	$(document).ready(function(){
		$("#test").click(function(){
			$("#loading").show();
			$("#test").hide();
			$("#info").html("");
			$.get('_code.php',{method:"test",code:$('#code').val()},
			function(data){
				$("#info").html(data['info']);
				$("#loading").hide();
				if (data['status'] == 'success'){
					$("#exchange").show();
					$("#test").hide();
                		}
                		else{
                			$("#info").html(data['info']);
                			$("#test").show();
                			$("#exchange").hide();
                		}
			},'json')
		})
	})
	$('#exchange').click(function(){
		$("#loading").show();
		$("#info").html(" ");
		$.get('_code.php',{'method':'redeem', code:$('#code').val()},
		function(data){
			$("#info").html(data['info']);
			$("#loading").hide();
			if(data['status'] == 'success'){
				$("#info").html(data['info']);
				$("#test").show();
				$("#exchange").hide();
				document.getElementById("code").value="";
				$("#test").html("提交并检查新的兑换码");
			}
			else{
			$("#info").html(data['info']);
			}
		},'json')
	});
	$('#code').change(function(){
		$("#info").html("");
		$("#loading").hide();
		$("#test").show();
		$("#exchange").hide();
	});
</script>
