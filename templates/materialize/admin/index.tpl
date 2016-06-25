<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='../source.tpl'}>
<title>管理中心 - <{$site_name}></title>
<{include file='admin/header.tpl'}>
<main class="content">
	<div class="content-header ui-content-header">
		<div class="container">
			<h1 class="content-heading">管理中心<small>Admin Center</small></h1>
		</div>
	</div>
	<div class="container">
		<section class="content-inner margin-top-no">
			<div class="row">
				<div class="col-lg-12 col-md-6">
					<div class="card margin-bottom-no">
						<div class="card-main">
							<div class="card-inner">
								<p>管理员 <{$GetUserName}> 您好 :-)，欢迎来到 <{$site_name}> 管理中心。</p></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-sm-12">
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p class="card-heading">概览</p>
								<div class="col-lg-6 col-sm-6">
									<div class="card">
										<div class="card-main">
											<div class="card-inner">
												<p class="card-heading">节点信息</p>
												<h1><{$node_count}> 个</h1>
											</div>
											<div class="card-action">
												<div class="form-group">
													<div class="row">
														<div class="col-md-10 col-md-push-1">
															<a href="node.php" class="btn btn-block btn-brand waves-attach waves-light">查看</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-6 col-sm-6">
										<div class="card">
											<div class="card-main">
												<div class="card-inner">
													<p class="card-heading">用户信息</p>
													<h1><{$all_user}> 名</h1>
												</div>
												<div class="card-action">
													<div class="form-group">
														<div class="row">
															<div class="col-md-10 col-md-push-1">
																<a href="user.php" class="btn btn-block btn-brand waves-attach waves-light">查看</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</main>
</body>
<script type="text/javascript">
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
</html>

