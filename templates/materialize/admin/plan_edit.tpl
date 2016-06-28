<!DOCTYPE html>
<html lang="zh-cn">
<meta charset="UTF-8">
<meta content="IE=edge" http-equiv="X-UA-Compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
<meta name="theme-color" content="#293696">
<{include file='../source.tpl'}>
<title>编辑计划 - <{$site_name}></title>
<{include file='admin/header.tpl'}>
	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">编辑计划&nbsp<small>Edit Plan</small></h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="row">
					<div class="col-lg-12 col-md-6">
						<div class="card margin-bottom-no">
							<div class="card-main">
								<div class="card-inner">
									<p>管理员 <{$GetUserName}> 您好 :-)，您正在<{$submit}><{$title}>。</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-12 col-sm-12">
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p class="card-heading"><{$submit}><{$title}>信息</p>
								<form role="form" method="post" action="javascript:void(0);">
									<div class="col-lg-6 col-sm-6">
										<div class="form-group form-group-label">
											<label class="floating-label" for="plan"> 套餐种类</label>
											<select class="form-control" id="plan">
												<option value="A">时间计划</option>
												<option value="B">流量计划</option>
												<option value="C">充值计划</option>
												<option value="D">其他计划</option>
												<option value="E">E</option>
											</select>
										</div>
										<div class="form-group form-group-label" id="plan_id_div">
											<label class="floating-label" for="plan_id">套餐编号</label>
											<input class="form-control " id="plan_id" type="text">
										</div>
										<div class="form-group form-group-label">
											<label class="floating-label" for="plan_type">套餐类型</label>
											<select class="form-control" id="plan_type">
												<option value="null">请选择</option>
												<option value="Tc">普通流量</option>
												<option value="Ta">搞基流量</option>
												<option value="Cc">普通周期</option>
												<option value="Ca">高级周期</option>
												<option value="M">钱</option>
											</select>
										</div>
									</div>
									<div class="col-lg-6 col-sm-6">
										<div class="form-group form-group-label">
											<label class="floating-label" for="plan_type_amount" id="data_label">请先选择套餐类型</label>
											<input class="form-control" id="plan_type_amount" type="text">
										</div>
										<div class="form-group form-group-label">
											<label class="floating-label" for="plan_price">价格</label>
											<input class="form-control" id="plan_price" type="text">
										</div>
										<div class="form-group form-group-label">
											<label class="floating-label" for="plan_url">购买网址</label>
											<input class="form-control" id="plan_url" type="text">
										</div>
									</div>
									<button class="btn btn-block btn-brand-accent waves-attach waves-light edit" type="submit"><{$submit}></button>
								</form>
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
						<p class="h5 margin-top-sm text-black-hint" id="info"></p>
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
method = '<{$method}>';
plan = "<{$rs['plan']}>";
plan_id = "<{$rs['plan_id']}>";
plan_type = "<{$rs['type']}>";
url = "<{$rs['url']}>";
price = "<{$rs['money']}>";
data = "<{$rs['data']}>";
$(document).ready(function(){
    if (method == 'edit'){
        $('#plan').val(plan);
        $('#plan_id').val(plan_id);
        $("#plan_id").parent().addClass("control-highlight");
        $('#plan_type').val(plan_type);
        update_data(plan_type);
        $('#plan_type_amount').val(data);
        $("#plan_type_amount").parent().addClass("control-highlight");
        $('#plan_price').val(price);
        $('#plan_price').parent().addClass("control-highlight");
        $('#plan_url').val(url);
        $("#plan_url").parent().addClass("control-highlight");
    }
    })

$('#plan_type').change(function(){
    update_data($(this).val());
})

$(document).ready(function(){
        $('.edit').click(function(){
            id =<{$rs['id']}>;
            if ($('#plan_price').val()>1000){
                $("#result").modal();
                $("#info").html('卖这么贵鬼买！(val>1000)');
            }
            else if($('#plan_price').val()<0){
                $("#result").modal();
                $("#info").html('诶呦，这么乐意亏本？(val<0)');
            }
            else
                $.get('_plan_edit.php',{'id':id, 'method':method,plan:$('#plan').val(),plan_id:$('#plan_id').val(),type:$('#plan_type').val(),data:$('#plan_type_amount').val(),money:$('#plan_price').val(),url:$('#plan_url').val()},
                function(data){
                    $("#result").modal();
                    $("#info").html(data['info']);
                    if(data['code'])
                        window.setTimeout("location.href='plan.php'", 1000);
            },'json')

    })})
function update_data(plan_type){
    switch(plan_type){
        case 'Ta': $('#data_label').html("包含高级流量（GB）");break;
        case 'Tc': $('#data_label').html("包含普通流量（GB）");break;
        case 'Cc': $('#data_label').html("普通节点时长（日）");break;
        case 'Ca': $('#data_label').html("高级节点时长（日）");break;
        case 'M': $('#data_label').html("人民币");break;
    }
}
</script>
