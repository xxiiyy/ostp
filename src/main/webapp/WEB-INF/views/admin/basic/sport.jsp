<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>基础数据管理</title>
<base href="<%=basePath%>">
<jsp:include page="../head.jsp"></jsp:include>
</head>

<body>

	<!--将这一部分1转化成iframe-->
	<div class="main-content" style="margin-left: 0px; margin-bottom: 0px;">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

			<ul class="breadcrumb">
				<li><i class="icon-folder-open-alt"> 基础数据管理</i> <a href="#"></a>
				</li>
				<li class="active">户外运动</li>
			</ul>
			<!-- .breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					户外运动 <small> <i class="icon-double-angle-right"></i> 查看
					</small>
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->
					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->

							<div class="row">

								<div class="col-xs-12">

									<div class="row">
										<div class="col-sm-6">
											<div class="dataTables_info" id="sample-table-2_info">
												<div class="btn-group">
													<button class="btn btn-info green" data-toggle="modal"
														data-target="#sportAdd">
														<i class="icon-edit bigger-125"></i> <a href="#"
															class="green"> <i class="icon-double-angle-right"></i>
															添加文档
														</a>
													</button>
													<input type="hidden" id="id" />
												</div>
											</div>
										</div>
										<div class="col-sm-6"></div>
									</div>

									<div class="table-header">户外运动信息</div>

									<div class="table-responsive">
										<table id="sample-table-2"
											class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>序号</th>
													<th>户外运动类型</th>
													<th>名称</th>
													<th>关键词</th>
													<th>备注</th>
													<th>创建人</th>
													<th>创建时间</th>
													<th>更新人</th>
													<th>更新时间</th>
													<th class="hidden-480">操作</th>

												</tr>
											</thead>

											<tbody>
												<c:forEach items="${basicSportList}" var="item"
													varStatus="status">
													<tr>
														<input type="hidden" class="ace" value="${item.sportid}"/>
														<td>${status.index + 1}</td>
														<td class="sporttypename">${item.sporttypename}</td>
														<td class="sportname">${item.sportname}</td>
														<td class="sportkeywords">${item.sportkeywords}</td>
														<td class="sportnote">${item.sportnote}</td>
														<td class="createBy">${item.createBy}</td>
														<td class="createDate"><fmt:formatDate value="${item.createDate}"
																pattern="yyyy-MM-dd" /></td>
														<td class="updateBy">${item.updateBy}</td>
														<td class="updateDate"><fmt:formatDate value="${item.updateDate}"
																pattern="yyyy-MM-dd" /></td>
														<td>
															<div
																class="visible-md visible-lg hidden-sm hidden-xs action-buttons">

																<a class="green" data-toggle="modal" data-target="#sportUpdate" id="${status.index}"> <i
																	class="icon-pencil bigger-130"></i> 编辑
																</a> 
																<a class="red delete_a" 
																	data-id="${item.sportid}" >
																	<i class="icon-trash bigger-130"></i> 删除
																</a>
															</div>

															<div class="visible-xs visible-sm hidden-md hidden-lg">
																<div class="inline position-relative">
																	<button
																		class="btn btn-minier btn-yellow dropdown-toggle"
																		data-toggle="dropdown">
																		<i class="icon-caret-down icon-only bigger-120"></i>
																	</button>

																	<ul
																		class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
																		<li><a href="#" class="tooltip-info"
																			data-rel="tooltip" title="View"> <span
																				class="blue"> <i
																					class="icon-zoom-in bigger-120"></i>
																			</span>
																		</a></li>

																		<li><a href="#" class="tooltip-success"
																			data-rel="tooltip" title="Edit"> <span
																				class="green"> <i
																					class="icon-edit bigger-120"></i>
																			</span>
																		</a></li>

																		<li><a href="#" class="tooltip-error"
																			data-rel="tooltip" title="Delete"> <span
																				class="red"> <i class="icon-trash bigger-120"></i>
																			</span>
																		</a></li>
																	</ul>
																</div>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>

							</div>

						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->

					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->

			</div>
			<!-- /.row -->
		</div>
		<!-- /.page-content -->
	</div>
	<!-- /.main-content -->

	<div id="sportAdd" class="modal fade in" tabindex="-1"
		aria-hidden="false" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header no-padding">
					<div class="table-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="white">×</span>
						</button>
						添加
					</div>
				</div>

				<div class="modal-body no-padding">
					<form id="sportform" class="clearfix form-actions">
						<div class="row">
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">户外运动类型</label>
									<select class="" id="sporttypeid">
										<c:forEach items="${sportTypeList}" var="sporttype">
											<option value="${sporttype.sporttypeid}">${sporttype.sporttypename}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<br />
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">户外运动</label>
									<div class="col-sm-9">
										<input type="text" id="sportname" placeholder="tilte"
											class="form-control" required="required" oninvalid="setCustomValidity('请输入户外运动名称')" oninput="setCustomValidity('')">
									</div>
								</div>
							</div>
							<br />
							<div class="col-xs-12" style="margin-top: 20px;">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">关键词</label>

									<div class="col-sm-9">
										<input type="text" id="sportkeywords"
											class="form-control">
									</div>
								</div>
							</div>
							<br />
							
							<div class="col-xs-12" style="margin-top: 20px;">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">备注</label>

									<div class="col-sm-9">
										<textarea id="sportnote" class="form-control" style="min-height: 200px;"></textarea>
									</div>
								</div>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="form-actions">
								<div class="text-center">
									<button class="btn btn-primary" type="submit">
										<i class="icon-ok bigger-110"></i> 保存
									</button>

									&nbsp; &nbsp; &nbsp;
									<button class="btn btn-info" type="reset">
										<i class="icon-undo bigger-110"></i> 重置
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<div id="sportUpdate" class="modal fade in" tabindex="-1"
		aria-hidden="false" style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header no-padding">
					<div class="table-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="white">×</span>
						</button>
						编辑
					</div>
				</div>

				<div class="modal-body no-padding">
					<form id="sportform2" class="clearfix form-actions">
						<div class="row">
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">户外运动类型</label>
									<select class="" id="sporttypeid2">
										<c:forEach items="${sportTypeList}" var="sporttype">
											<option value="${sporttype.sporttypeid}">${sporttype.sporttypename}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<br />
							<div class="col-xs-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">户外运动</label>
									<div class="col-sm-9">
										<input type="text" id="sportname2" placeholder="tilte"
											class="form-control" required="required" oninvalid="setCustomValidity('请输入户外运动名称')" oninput="setCustomValidity('')">
									</div>
								</div>
							</div>
							<br />
							<div class="col-xs-12" style="margin-top: 20px;">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">关键词</label>

									<div class="col-sm-9">
										<input type="text" id="sportkeywords2" placeholder="keywords"
											class="form-control">
									</div>
								</div>
							</div>
							<br />
							
							<div class="col-xs-12" style="margin-top: 20px;">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1">备注</label>

									<div class="col-sm-9">
										<textarea id="sportnote2" class="form-control" style="min-height: 200px;"></textarea>
									</div>
								</div>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="form-actions">
								<div class="text-center">
									<button class="btn btn-primary" type="submit">
										<i class="icon-ok bigger-110"></i> 保存
									</button>

									&nbsp; &nbsp; &nbsp;
									<button class="btn btn-info" type="reset">
										<i class="icon-undo bigger-110"></i> 重置
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<script>
		$(function() {
			sportform.initial();
			//查询记录
			sportUpdate.initial();
		});

		var sportform = {

			initial : function initial() {
				this.bindSubmitForm();
			},

			bindSubmitForm : function bindSubmitForm() {
				var form = $("form#sportform");
				form.submit(function() {
					var result=sportform.check();
					if (result) {
						var data = new Object();
						data.sporttypeid = $("#sporttypeid").val();
						data.sportname = $("#sportname").val();
						data.sportkeywords = $("#sportkeywords").val();
						data.sportnote = $("#sportnote").val();
						jQuery.ajax({
							headers : {
								'Accept' : 'application/json',
								'Content-Type' : 'application/json'
							},
							type : "POST",
							url : "/ostp/admin/outdoorSport-add",
							data : JSON.stringify(data),
							success : function(message, tst, jqXHR) {

								if (message.result == "success") {
									 return dialog.success(message.messageInfo,"/ostp/admin/outdoorSport-list");
								} else {
									return dialog.success(message.messageInfo,"/ostp/admin/outdoorSport-list");
									
								}
								//location.href="/ostp/admin/outdoorSport-list";
							}
						});
						//$("#submit1").attr("data-dismiss","modal");
					}
					return false;
				});
			},
			check:function check(){
				var isOk=true;
				$(".sportname").each(function(){
				    if($(this).text()==$("#sportname").val())
				    {
				    	layer.alert('该类型已存在，请从新输入', {
				    		  skin: 'layui-layer-molv' //样式类名
				    		  ,closeBtn: 0
				    		});
				    	isOk=false;
				    }
				  });
				return isOk;
			}
		};
		var sportUpdate = {

				initial : function initial() {
					this.bindSubmitForm();
				},

				bindSubmitForm : function bindSubmitForm() {
					var form = $("form#sportform2");

					form.submit(function() {
						if (true) {
							var data = new Object();
							data.sportid= $("input#id").val();
							data.sporttypeid = $("#sporttypeid2").val();
							data.sportname = $("#sportname2").val();
							data.sportkeywords = $("#sportkeywords2").val();
							data.sportnote = $("#sportnote2").val();
							jQuery.ajax({
								headers : {
									'Accept' : 'application/json',
									'Content-Type' : 'application/json'
								},
								type : "POST",
								url : "/ostp/admin/outdoorSport-update",
								data : JSON.stringify(data),
								success : function(message, tst, jqXHR) {
									
									var close_btn = $("#close_btn2");
									close_btn.click();
									if (message.result == "success") {										
										return dialog.success(message.messageInfo,"/ostp/admin/outdoorSport-list");
									} else {
										return dialog.error(message.messageInfo);
									}
								}
							});
							//$("#submit1").attr("data-dismiss","modal");
						}
						return false;
					});
				}

			};
		
	$("a.green").click(function(){
		var index = $(this).attr("id");
		var sporttypeid = $("td.sporttypeid").eq(index).text();
		var sportname = $("td.sportname").eq(index).text();
		var sportkeywords = $("td.sportkeywords").eq(index).text();
		var sportnote = $("td.sportnote").eq(index).text();
		var sportid = $("input.ace").eq(index).val();
		
		$("input#sporttypeid2").val(sporttypeid);
		$("input#sportname2").val(sportname);
		$("input#sportkeywords2").val(sportkeywords);
		$("textarea#sportnote2").val(sportnote);
		$("input#id").val(sportid);
		
	});
	var SCOPE={
			'del_url':'/ostp/admin/outdoorSport-del',
			'index_url':'/ostp/admin/outdoorSport-list',
	}
	</script>
<script src="resources/js/myjs/info.js"></script>
	<jsp:include page="../foot.jsp"></jsp:include>


</body>
</html>
