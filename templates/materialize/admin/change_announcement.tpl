<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='../source.tpl'}>
<title>修改公告 - <{$site_name}></title>
<{include file='admin/header.tpl'}>
    <main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">修改公告<small>Change Announcement</small></h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-6">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p>管理员<{$GetUserName}>，您好 :-),您正在修改<{$announcement_title}>的的公告</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			    <div class="col-lg-12 col-sm-12">
				    <div class="card">
				        <div class="card-main">
				            <div class="card-inner">
				                <{if $announcement_name!=null}>
				                    <p class="card-heading">修改公告</p>
				                    <div class="form-group form-group-label">
				                        <form role="form" method="post" action="javascript:void(0);">
                                            <{textareaCodemirror name="new_content" id="new_content" class="textarea"}><{$original_content}><{/textareaCodemirror}>
                                            <button class="btn btn-red waves-attach waves-light waves-effect" id="change" type="submit">修改</button>
                                        </form>
                                    </div>
                                <{else}>
                                    <p class="card-heading">没有此公告名称</p>
                                <{/if}>
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
				        <p class="h5 margin-top-sm text-black-hint" id="msg"></p>
			        </div>
			        <div class="modal-footer">
				        <p class="text-right"><button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" type="button">确定</button></p>
			        </div>
		        </div>
	        </div>
        </div>
    </main>
</body>
    <script type="text/javascript" src="<{$resources_dir}>/assets/js/Prompt_message.js"></script>
    <script type="text/javascript" src="<{$public}>/js_aes/aes.js"></script>
    <script type="text/javascript" src="<{$public}>/js_aes/aes-ctr.js"></script>
<script type="text/javascript">
function submit(){
  $(document).ready(function(){
            $.ajax({
                type:"POST",
                url:"_change_announcement.php",
                dataType:"json",
                data:{
                    announcement_name: "<{$announcement_name}>",
                    new_content: $("#new_content").val(),
                    
                },
                success:function(data){
                    if(data.ok){
                        $("#result").modal();
                        $("#msg").html(data.msg);
                        window.setTimeout("location.href='index.php'", 1000);
                    }else{
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error:function(jqXHR){
                        $("#msg").html("发生错误："+jqXHR.status);
                        $("result").modal();
                        // 在控制台输出错误信息
                        console.log(removeHTMLTag(jqXHR.responseText));
                }
            })
    })
}
</script>