<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='source.tpl'}>
<title>充值喵币 -<{$site_name}></title>
<{include file='user/header.tpl'}>
	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">充值喵币<small>Miao~~~</small></h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p>现在充值喵币更划算哦~</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-sm-12">
					<h2 class="content-sub-heading">喵币商城</h2>
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<{if count($plan_C)!=null}>
									<{foreach $plan_C as $rs}>
										<div class="col-lg-4 col-sm-12">
											<div class="card">
												<aside class="card-side pull-left">
													<span class="card-heading"><i class="icon icon-lg">pets</i></span>
												</aside>
												<div class="card-main">
													<div class="card-inner">
														<p class="card-heading"><{$rs[ 'plan']}>-<{$rs[ 'plan_id']}></p>
														<p>每个包含：喵币<code><{$rs[ 'data']}></code>个</p>
														<p>价格：<{$rs[ 'money']}>元</p>
													</div>
													<div class="card-action">
														<div class="card-action-btn pull-left">
															<div class="dropdown-wrap">
																<div class="dropdown dropdown-inline">
																	<a class="btn btn-flat waves-attach" href="<{$rs['url']}>" target="_blank">
																		<span class="icon icon-lg">payment</span>&nbsp;购买兑换码
																	</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									<{/foreach}>
								<{else}>
						    			<a class="btn btn-brand-accent waves-attach waves-light">无喵币充值信息</a>
								<{/if}>
							</div>
						</div>
					</div>
				</section>
			</div>
		</main>
	</body>
<{include file='../footer.tpl' }></html>
