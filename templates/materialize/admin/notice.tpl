<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='../source.tpl'}>
<title><{$header}> - <{$site_name}></title>
<{include file='admin/header.tpl'}>
    <main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">修改公告&nbsp<small>Change Announcement</small></h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-6">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p>管理员 <{$GetUserName}> 您好 :-)，您正在<{$header}>。</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			    <div class="col-lg-12 col-sm-12">
				    <div class="card">
				        <div class="card-main">
				            <div class="card-inner">
				                <p class="card-heading"><{$header}></p>
				                <div class="col-lg-6 col-md-6 col-sm-12">
				                    <div class="form-group form-group-label">
                                        <label class="floating-label" for="item">公告代号</label>
                                        <input class="form-control" id="item" type="text" value="<{$item}>">
                                    </div>
                                    <div class="form-group form-group-label">
                                        <label class="floating-label" for="introduction">公告名称</label>
                                        <input class="form-control" id="introduction" type="text" value="<{$introduction}>">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12">
                                    <div class="form-grou p form-group-label">
                                        <label class="floating-label" for="value">公告内容</label>
                                        <textarea class="form-control textarea-autosize" id="value" rows="5" ><{$value}></textarea>
                                    </div>
                                </div>
                                <button class="btn btn-block btn-brand waves-attach waves-light" id="change" type="submit">修改</button>
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
				        <{include file='loading.tpl'}>
				        
			        </div>
			        <div class="modal-footer">
				        <p class="text-right"><button class="btn btn-flat btn-brand-accent waves-attach" data-dismiss="modal" type="button">确定</button></p>
			        </div>
		        </div>
	        </div>
        </div>
    </main>
</body>
<script type="text/javascript">
$("#change").click(function(){
    $('#result').modal();
    $('#loading').show();
    $.post('_notice.php',
        {item:$('#item').val(), 
            'introduction':$('#introduction').val(),
            'value':$('#value').val()
        },
    function(data){
        $('#loading').hide();
        if(data['code'])
            $("#msg").html(data['info']);
        else
            $("#msg").html(data['info']);
        },'json'
        );
})
</script>
