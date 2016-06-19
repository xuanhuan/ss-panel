<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='admin/source.tpl'}>
<title>云管理 -<{$site_name}></title>
<{include file='admin/header.tpl'}>
	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">节点云管理<small>ServerManager</small></h1>
			</div>
		</div>
		<div class="container">
		    <section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-6">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p>管理员<{$GetUserName}>，您好 :-),您正在管理节点</p></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-sm-12">
						<table class="table" title="Plan List">
							<thead>
								<tr>
									<th>节点ID</th>
									<th>节点名称</th>
									<th>地址</th>
				    				<th>状态</th>
									<th>负载</th>
									<th>CPU</th>
									<th>内存</th>
									<th>上行</th>
									<th>下行</th>
									<th>在线人数</th>
									<th>在线时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<{foreach $node as $rs}>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td>
										<a class="btn btn-brand waves-attach waves-light" href="">发送指令</a>
									</td>
								</tr>
							<{/foreach}>
				        </table>
				    </div>
				</div>
			</section>
        </div>
	</main>
</body>
<script></script>