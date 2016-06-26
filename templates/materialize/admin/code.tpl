<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='../source.tpl'}>
<title>兑换码生成 - <{$site_name}></title>
<{include file='admin/header.tpl'}>
    <main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">兑换码生成器<small>Redeem Code Generator</small></h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					
					<div class="col-lg-12 col-md-6">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p>管理员<{$GetUserName}>，您好 :-),您正在尝试生成兑换码。</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-sm-12">
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<div class="col-lg-6 col-md-12 col-sm-12">
									<p class="card-heading"></p>
									<div class="form-group form-group-label">
										<p>兑换码使用量：<{$used}>/65535</p>
										<div class="progress">
											<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <{$used/655.36}>%;"></div>
											<span class="sr-only">123</span>
										</div>
									</div>
									<div class="form-group form-group-label">
										<p>计划类型：</p>
										<div class="from-group">
											<div class="radiobtn radiobtn-adv checkbox-inline">
												<label for="plan_A">
													<input class="access-hide plan" id="plan_A" name="plan" type="radio" value="A">时间类
													<span class="radiobtn-circle"></span><span class="radiobtn-circle-check"></span>
												</label>
											</div>
											<div class="radiobtn radiobtn-adv checkbox-inline">
												<label for="plan_B">
													<input class="access-hide plan" id="plan_B" name="plan" type="radio" value="B">流量类
													<span class="radiobtn-circle"></span><span class="radiobtn-circle-check"></span>
												</label>
											</div>
											<div class="radiobtn radiobtn-adv checkbox-inline">
												<label for="plan_C">
													<input class="access-hide plan" id="plan_C" name="plan" type="radio" value="C">充值类
													<span class="radiobtn-circle"></span><span class="radiobtn-circle-check"></span>
												</label>
											</div>
											<div class="radiobtn radiobtn-adv checkbox-inline">
												<label for="plan_D">
													<input class="access-hide plan" id="plan_D" name="plan" type="radio" value="D">
													<span class="radiobtn-circle"></span><span class="radiobtn-circle-check"></span>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group form-group-label">
										<p>即将生成的套餐信息：</p>
										<p id="plan_info">未完成全部选择</p>
									</div>
								</div>
								<div class="col-lg-6 col-md-12 col-sm-12">
									<div class="form-group form-group-label">
										<label class="floating-label" for="plan_id">计划编号</label>
										<select class="form-control" id="plan_id">
											<option value="null">请先选择计划类型</option>
										</select>
									</div>
									<div class="form-group form-group-label">
										<label class="floating-label" for="amount">请选择生成数量</label>
										<select class="form-control" id="amount">
											<option value="NULL"></option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="5">5</option>
											<option value="10">10</option>
											<option value="20">20</option>
											<option value="50">50</option>
											<option value="custom">自定义</option>
										</select>
										<input type="text" class="form-control inline" placeholder="请输自定义的入数量 1-100" style="display:none" id="amount_input">
									</div>
									<div class="form-group form-group-label">
										<p>到期时间：</p>
										<label class="floating-label" for="code_end_time"></label>
										<input class="form-control" id="code_end_time" type="text"  onclick="$('#plan_end_time').pickdate();" value="">
									</div><br/>
								</div>
								<button class="btn btn-block btn-brand waves-attach waves-light" id='generate'>生成</button>
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
    function get_plan_info(id){
        $.get('_code.php',{'method':'get_plan_info', 'id':id}, function(data){
            if(data.length != 0)
                $('#plan_info').html(data['info']);
            else
            $('#plan_info').html('选择的计划不存在！');
        },'json')
    }
    function get_plan_id(plan){
        $.get('_code.php',{'plan':plan,'method':'get_plan_list'},function(data){
        //先清空内容
            $('#plan_id').empty();
        //返回内容为空
            if (data.length == 0){
                $('#plan_id').append("<option value='null'>该计划无内容</option>");
                $('#plan_id').parent().addClass("control-focus");
                }
            else{
                $('#plan_id').append("<option value='null'>共"+data.length+"个编号</option>");
                $('#plan_id').parent().addClass("control-focus");
                $('#amount').parent().addClass("control-focus");
                for(var i = 0; i < data.length; i++){
                    $('#plan_id').append("<option value='"+data[i]['id']+"'>"+data[i]['plan_id']+"</option>");
                    
                }
            }
        },'json');
    }
    $('#plan_id').change(function(){
        get_plan_info($(this).val());
    })
    $('.plan').change(function(){
        var selectedvalue = $("input[name='plan']:checked").val();
        get_plan_id(selectedvalue);
    })
    $("#amount").change(function () {
        if($(this).val() == 'custom')
            $('#amount_input').show(500);
        else
            $('#amount_input').hide(500);   
    });
    $('#generate').click(function(){
        id = $('#plan_id').val();
        amount = $('#amount').val();
        if(amount == 'custom')
            amount = $('#amount_input').val();
            if(id == 'null'){
                alert('您选择了无效的计划，请重新选择');
            }
            else if(amount<1||amount>100)
                alert('无效的数量，兑换码数量应设置为一个在1-100之间的值');
            else
            {
                window.location.href='_code.php?method=generate&id='+id+'&amount='+amount+'&time=0';
        }
    });
</script>
<script>
    $('#code_end_time').pickdate({
    cancel: '取消',
    closeOnCancel: false,
    closeOnSelect: false,
    container: '',
    firstDay: 1,
    format: 'yyyy-mm-dd', // escape any formatting characters with an exclamation mark
    formatSubmit: 'yyyy-mm-dd',
    ok: '确认',
    selectMonths: true,
    selectYears: 5,
    today: '今天'
});
</script>
