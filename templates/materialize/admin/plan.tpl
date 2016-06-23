<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='../source.tpl' }>
<title>计划管理 - <{$site_name}></title>
<{include file='admin/header.tpl' }>
	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">计划管理<small>Manage Plans</small></h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-6">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p>管理员 <{$GetUserName}> 您好 :-)，您正在管理计划套餐类型。</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-sm-12">
					<nav class="tab-nav margin-top-no">
						<ul class="nav nav-justified">
							<li class="active">
								<a class="waves-attach" data-toggle="tab" href="#Plan_A">时间类计划</a>
							</li>
							<li>
								<a class="waves-attach" data-toggle="tab" href="#Plan_B">流量类计划</a>
							</li>
							<li>
								<a class="waves-attach" data-toggle="tab" href="#Plan_C">充值计划</a>
							</li>
							<li>
								<a class="waves-attach" data-toggle="tab" href="#Plan_D">其他计划</a>
							</li>
						</ul>
					</nav>
					<div class="tab-pane fade active in" id="Plan_A">
						<table class="table" title="Plan List">
							<thead>
								<tr>
									<th>计划</th>
									<th>计划id</th>
									<th>计划</th>
									<th>数据</th>
									<th>价格</th>
									<th>购买网址</th>
									<th>操作</th>
								</tr>
							</thead>
							<{foreach $plan_A as $rs}>
								<tr>
									<td><{$rs[ 'plan']}></td>
									<td><{$rs[ 'plan_id']}></td>
									<td><{$rs[ 'type']}></td>
									<td><{$rs[ 'data']}></td>
									<td><{$rs[ 'money']}>元</td>
									<td><{$rs[ 'url']}></td>
									<td>
										<a class="btn btn-brand waves-attach waves-light" href="plan_edit.php?id=<{$rs['id']}>&method=edit">编辑</a>
										<button class="btn btn-brand-accent waves-attach waves-light delete" id="<{$rs['id']}>">删除</button>
									</td>
								</tr>
							<{/foreach}>
						</table>
					</div>
					<div class="tab-pane fade" id="Plan_B">
						<table class="table" title="Plan List">
							<thead>
								<tr>
									<th>计划</th>
									<th>计划id</th>
									<th>计划类型</th>
									<th>数据</th>
									<th>价格</th>
									<th>购买网址</th>
									<th>操作</th>
								</tr>
							</thead>
							<{foreach $plan_B as $rs}>
								<tr>
									<td><{$rs[ 'plan']}></td>
									<td><{$rs[ 'plan_id']}></td>
									<td><{$rs[ 'type']}></td>
									<td><{$rs[ 'data']}></td>
									<td><{$rs[ 'money']}>元</td>
									<td><{$rs[ 'url']}></td>
									<td>
                                        <a class="btn btn-brand waves-attach waves-light" href="plan_edit.php?id=<{$rs['id']}>&method=edit">编辑</a>
										<button class="btn btn-brand-accent waves-attach waves-light delete" id="<{$rs['id']}>">删除</button>
									</td>
								</tr>
							<{/foreach}>
						</table>
					</div>
					<div class="tab-pane fade" id="Plan_C">
						<table class="table" title="Plan List">
							<thead>
								<tr>
									<th>计划</th>
									<th>计划id</th>
									<th>计划类型</th>
									<th>数据</th>
									<th>价格</th>
									<th>购买网址</th>
									<th>操作</th>
								</tr>
							</thead>
							<{foreach $plan_C as $rs}>
								<tr>
									<td><{$rs[ 'plan']}></td>
									<td><{$rs[ 'plan_id']}></td>
									<td><{$rs[ 'type']}></td>
									<td><{$rs[ 'data']}></td>
									<td><{$rs[ 'money']}>元</td>
									<td><{$rs[ 'url']}></td>
									<td>
                                        <a class="btn btn-brand waves-attach waves-light" href="plan_edit.php?id=<{$rs['id']}>&method=edit">编辑</a>
										<button class="btn btn-brand-accent waves-attach waves-light delete" id="<{$rs['id']}>">删除</button>
									</td>
								</tr>
							<{/foreach}>
						</table>
					</div>
					<div class="tab-pane fade" id="Plan_D">
						<table class="table" title="Plan List">
							<thead>
								<tr>
									<th>计划</th>
									<th>计划id</th>
									<th>计划类型</th>
									<th>数据</th>
									<th>价格</th>
									<th>购买网址</th>
									<th>操作</th>
								</tr>
							</thead>
							<{foreach $plan_D as $rs}>
								<tr>
									<td><{$rs[ 'plan']}></td>
									<td><{$rs[ 'plan_id']}></td>
									<td><{$rs[ 'type']}></td>
									<td><{$rs[ 'data']}></td>
									<td><{$rs[ 'money']}>元</td>
									<td><{$rs[ 'url']}></td>
									<td>
                                        <a class="btn btn-brand waves-attach waves-light" href="plan_edit.php?id=<{$rs['id']}>&method=edit">编辑</a>
										<button class="btn btn-brand-accent waves-attach waves-light delete" id="<{$rs['id']}>">删除</button>
									</td>
								</tr>
							<{/foreach}>
						</table>
					</div>
					<div class="col-md-5 col-md-push-1">
						<a href="plan_edit.php?method=add&id=0" class="btn btn-block btn-brand waves-attach waves-light">添加计划</a>
					</div><br/>
					<div class="col-md-5 col-md-push-1">
						<a href="code.php" class="btn btn-block btn-brand waves-attach waves-light">生成兑换码</a></div>
					</div>
				</div>
			</section>
		</div>
	</main>
</body>
</html>
<script>
$('.delete').click(function(){
    id = $(this).attr('id');
    $.get('_plan_edit.php',{'id':id, 'method':'delete'},function(data){
        alert(data['info']);
        window.setTimeout("location.href='plan.php'", 500);
    },'json')
})
</script>
