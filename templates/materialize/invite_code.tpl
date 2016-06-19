<!DOCTYPE html>
<html lang="zh-CN">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='source.tpl'}>
<title>邀请码 -<{$site_name}></title>
<{include file='header.tpl'}>
	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-lg-push-3 col-sm-10 col-sm-push-1">
						<link href='https://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet' type='text/css'>
						<h1 class="content-heading" style="font-family: Orbitron;"><{$site_name}></h1>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-lg-push-3 col-sm-10 col-sm-push-1">
					<section class="content-inner margin-top-no">
						<div class="card">
							<div class="card-main">
								<div class="card-inner">
								    <{$code_Announcement}>
								</div>
							</div>
						</div>
						<h2 class="content-sub-heading">邀请码</h2>
						<{if count($datas)!=null}>
							<div class="table-responsive">
								<table class="table" title="A basic table">
									<thead>
										<tr>
											<th>编号</th>
											<th>野生喵星人</th>
											<th>状态</th>
										</tr>
									</thead>
							    	<tbody>
										<{foreach $datas as $data}>
											<tr>
												<td><{$a++}></td>
												<td><{$data[ 'code']}></td>
												<td>可用</td>
											</tr>
										<{/foreach}>
									</tbody>
								</table>
							</div>
						    <a class="btn btn-brand waves-attach waves-light" href="/auth/register.php">复制好邀请码了？ 点击注册！</a>
						<{else}>
							<a class="btn btn-brand-accent waves-attach waves-light">没有啦~~再过过就会回来的~</a>
						<{/if}>
					</section>
				</div>
			</div>
		</div>
	</main>
<{include file='footer.tpl' }>