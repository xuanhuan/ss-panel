<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#88629e">
<title>删除账户 - <{$site_name}></title>
	<style>
	    .pagination {
			display:inline-block;
			padding-left:0;
			margin:20px 0;
			border-radius:4px
		}
		.pagination>li {
			display:inline
		}
		.pagination>li>a,.pagination>li>span {
			position:relative;
			float:left;
			padding:6px 12px;
			margin-left:-1px;
			line-height:1.42857143;
			color:#337ab7;
			text-decoration:none;
			background-color:#fff;
			border:1px solid #ddd
		}
		.pagination>li:first-child>a,.pagination>li:first-child>span {
			margin-left:0;
			border-top-left-radius:4px;
			border-bottom-left-radius:4px
		}
		.pagination>li:last-child>a,.pagination>li:last-child>span {
			border-top-right-radius:4px;
			border-bottom-right-radius:4px
		}
		.pagination>li>a:focus,.pagination>li>a:hover,.pagination>li>span:focus,.pagination>li>span:hover {
			color:#23527c;
			background-color:#eee;
			border-color:#ddd
		}
		.pagination>.active>a,.pagination>.active>a:focus,.pagination>.active>a:hover,.pagination>.active>span,.pagination>.active>span:focus,.pagination>.active>span:hover {
			z-index:2;
			color:#fff;
			cursor:default;
			background-color:#337ab7;
			border-color:#337ab7
		}
		.pagination>.disabled>a,.pagination>.disabled>a:focus,.pagination>.disabled>a:hover,.pagination>.disabled>span,.pagination>.disabled>span:focus,.pagination>.disabled>span:hover {
			color:#777;
			cursor:not-allowed;
			background-color:#fff;
			border-color:#ddd
		}
		.pagination-lg>li>a,.pagination-lg>li>span {
			padding:10px 16px;
			font-size:18px
		}
		.pagination-lg>li:first-child>a,.pagination-lg>li:first-child>span {
			border-top-left-radius:6px;
			border-bottom-left-radius:6px
		}
		.pagination-lg>li:last-child>a,.pagination-lg>li:last-child>span {
			border-top-right-radius:6px;
			border-bottom-right-radius:6px
		}
		.pagination-sm>li>a,.pagination-sm>li>span {
			padding:5px 10px;
			font-size:12px
		}
		.pagination-sm>li:first-child>a,.pagination-sm>li:first-child>span {
			border-top-left-radius:3px;
			border-bottom-left-radius:3px
		}
		.pagination-sm>li:last-child>a,.pagination-sm>li:last-child>span {
			border-top-right-radius:3px;
			border-bottom-right-radius:3px
		}
		.pager {
			padding-left:0;
			margin:20px 0;
			text-align:center;
			list-style:none
		}
		.pager li {
			display:inline
		}
		.pager li>a,.pager li>span {
			display:inline-block;
			padding:5px 14px;
			background-color:#fff;
			border:1px solid #ddd;
			border-radius:15px
		}
		.pager li>a:focus,.pager li>a:hover {
			text-decoration:none;
			background-color:#eee
		}
		.pager .next>a,.pager .next>span {
			float:right
		}
		.pager .previous>a,.pager .previous>span {
			float:left
		}
		.pager .disabled>a,.pager .disabled>a:focus,.pager .disabled>a:hover,.pager .disabled>span {
			color:#777;
			cursor:not-allowed;
			background-color:#fff
		}

		
		
		
		
		.pagination>li>a,
		.pagination>li>span {
		  border: 1px solid white;
		}
		.pagination>li.active>a {
		  background: #f50057;
		  color: #fff;
		}
		
		.pagination>li>a {
		  background: white;
		  color: #000;
		}
		
		
		.pagination > .active > a, .pagination > .active > a:focus, .pagination > .active > a:hover, .pagination > .active > span, .pagination > .active > span:focus, .pagination > .active > span:hover {
			color: #fff;
			background-color: #000;
			border-color: #000;
		}

		.pagination>.active>span {
		  background-color: #f50057;
		  color: #fff;
		  border-color: #fff;
		}
		
		
		
		.pagination > .disabled > span {
		  border-color: #fff;
		}
		
		
		pre {
			white-space: pre-wrap;
			word-wrap: break-word;
		}
		
		.progress-green .progress-bar {
			background-color: #f0231b;
		}
		
		.progress-green {
			background-color: #000;
		}
		
		.progress-green .progress-bar {
			background-color: #ff0a00;
		}
		
		.page-purple .ui-content-header {
			background-image: url(/templates/materialize/css/images/bg/red.jpg);
		}
		
		.content-heading {
			font-weight: 300;
			color: #fff;
		}
				
	</style>
    <link href="<{$resources_dir}>/css/base.min.css" rel="stylesheet">
	<link href="<{$resources_dir}>/css/project.min.css" rel="stylesheet">
<body class="page-purple">
    <main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-lg-push-3 col-sm-10 col-sm-push-1">
						<h1 class="content-heading">删除账户&nbsp;<small>Delete MyAccount</small></h1>
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
									<p>如果你需要从我们的数据库移除账户信息，请在此输入密码并确认。</p>
									<p>此过程不可逆！</p>
                                    <p>点击删除按钮后无后续确认，请谨慎操作。</p>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-main">
								<div class="card-inner">
                                    <div class="form-group form-group-label">
                                        <label class="floating-label" for="pwd"><i class="icon icon-lg">visibility_off</i>&nbsp;输入账户密码</label>
                                        <input class="form-control" id="pwd" type="password" name="pwd" maxlength="30" required>
                                    </div>
						            <a href="#kill_final" data-toggle="modal" class="btn btn-block btn-brand-accent waves-attach waves-light"><i class="icon icon-lg">delete_forever</i>&nbsp;删除我的账户</a>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</main>
</body>
<div aria-hidden="true" class="modal modal-va-middle fade" id="kill_final" role="dialog" tabindex="-1">
		<div class="modal-dialog modal-xs">
			<div class="modal-content">
				<div class="modal-heading">
					<p class="modal-title">最后确认</p>
				</div>
				<div class="modal-inner">
					<p class="h5 margin-top-sm text-black-hint">我自愿删除本账户，非他人所为，账户信息在删除后将不可恢复。<br>如出现问题，<{$site_name}>将不承担任何责任。</p>
				</div>
				<div class="modal-footer">
					<p class="text-right"><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal">保留账户</a><a class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" id="removeme" type="submit">我确认删除</a></p>
				</div>
			</div>
		</div>
</div>
<div aria-hidden="true" class="modal modal-va-middle fade" id="result" role="dialog" tabindex="-1">
    <div class="modal-dialog modal-xs">
        <div class="modal-content">
            <div class="modal-inner">
                <div class="text-center">
				    <p class="h5 margin-top-sm text-black-hint" id="msg"></p>
				</div>
            </div>
            <div class="modal-footer">
                <div class="text-center">
				    <p class="text-right"><button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" type="button">确定</button></p>
			    </div>
            </div>
        </div>
    </div>
</div>
	<script src="<{$resources_dir}>/js/jquery.min.js"></script>
	<script src="<{$resources_dir}>/js/base.min.js"></script>
	<script src="<{$resources_dir}>/js/project.min.js"></script>
	<script type="text/javascript" src="<{$resources_dir}>/asset/js/Prompt_message.js"></script>
	<script type="text/javascript">
    $(document).ready(function(){
        $("#removeme").click(function(){
            $.ajax({
                type:"POST",
                url:"_kill.php",
                dataType:"json",
                data:{
                    pwd: $("#pwd").val()
                },
                success:function(data){
                    if(data.ok){
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }else{
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error:function(jqXHR){
                    $("#result").modal();
                    $("#msg").html("发生错误："+jqXHR.status);
                }
            })
        })
    })
</script>
</html>
