<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='source.tpl'}>
<title>登录历史 -<{$site_name}></title>
<{include file='user/header.tpl'}>
    <main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">登录历史&nbsp;<small>Login History</small></h1>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-lg-push-3 col-sm-10 col-sm-push-1">
					<section class="content-inner margin-top-no">
						<div class="card">
							<div class="card-main">
								<div class="card-inner">
									<p>以下展示的为您最近10次登录<{$site_name}>的IP记录</p>
								</div>
							</div>
						</div>
						<h2 class="content-sub-heading"></h2>
						<{if count($datas)!=null}>
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>编号</th>
											<th>登入IP</th>
											<th>登入地点&运营商</th>
											<th>时间</th>
										</tr>
									</thead>
								    <tbody>
								        <{foreach $datas as $data}>
                                            <tr>
                                                <td><{$a++}></td>
                                                <td><{$data[ 'ip']}></td>
                                                <td><{$data['location']}></td>
                                                <td><{date('Y-m-d H:i:s',$data['time'])}></td>
                                            </tr>
                                        <{/foreach}>
									</tbody>
								</table>
							</div>
						<{else}>
							<a class="btn btn-brand-accent waves-attach waves-light">暂时没有匹配的IP地址！</a>
			    	    <{/if}>
					</section>
				</div>
			</div>
		</div>
	</main>
<{include file='../footer.tpl' }>
