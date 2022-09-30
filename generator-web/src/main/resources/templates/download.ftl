<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>基于SQL生成Java和Mybatis代码</title>
    <meta name="keywords" content="sql生成dao,mybatis,service,entity,controller代码">
    <#import "common/common-import.ftl" as netCommon>
    <@netCommon.commonStyle />
    <@netCommon.commonScript />
<script>
    $(function () {
        var ddlSqlArea = CodeMirror.fromTextArea(document.getElementById("ddlSqlArea"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-sql",
            lineWrapping:false,
            readOnly:false,
            foldGutter: true,
            //keyMap:"sublime",
            gutters:["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        ddlSqlArea.setSize('auto','auto');
        // controller_ide
        var genCodeArea = CodeMirror.fromTextArea(document.getElementById("genCodeArea"), {
            lineNumbers: true,
            matchBrackets: true,
            mode: "text/x-java",
            lineWrapping:true,
            readOnly:false,
            foldGutter: true,
            //keyMap:"sublime",
            gutters:["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
        });
        genCodeArea.setSize('auto','auto');
        var codeData;
        // 使用：var jsonObj = $("#formId").serializeObject();
        $.fn.serializeObject = function()
        {
            var o = {};
            var a = this.serializeArray();
            $.each(a, function() {
                if (o[this.name]) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }
                    o[this.name].push(this.value || '');
                } else {
                    o[this.name] = this.value || '';
                }
            });
            return o;
        };
        $('#btnGenCode').click(function ()  {
            var jsonData = {
                "tableSql": ddlSqlArea.getValue(),
                "packageName":$("#packageName").val(),
                "returnUtil":$("#returnUtil").val(),
                "authorName":$("#authorName").val(),
                "dataType":$("#dataType").val(),
                "tinyintTransType":$("#tinyintTransType").val(),
                "nameCaseType":$("#nameCaseType").val(),
                "className":$("#className").val(),
                "daoSuffix":$("#daoSuffix").val(),
                "swagger":$("#isSwagger").val()
            };
            $.ajax({
                type: 'POST',
                url: base_url + "/genCode",
                data:(JSON.stringify(jsonData)),
                dataType: "json",
                contentType: "application/json",
                success: function (data) {
                    if (data.code === 200) {
                        codeData = data.data;
                        genCodeArea.setValue(codeData.model);
                        genCodeArea.setSize('auto', 'auto');
                        $.toast({
                          text : "代码生成成功",showHideTransition : 'slide',
                          bgColor : 'blue',textColor : '#eee',allowToastClose : false,hideAfter : 1000,
                          stack : 5,textAlign : 'left',position : 'mid-center'
                        });
                    } else {
                        $.toast({
                          text : "代码生成失败:"+data.msg,showHideTransition : 'slide',
                          bgColor : 'blue',textColor : 'red',allowToastClose : false,
                          hideAfter : 3000,stack : 5,textAlign : 'left', position : 'mid-center'
                        });
                    }
                }
            });
            return false;
        });

        $('.generator').bind('click', function () {
            if (!$.isEmptyObject(codeData)) {
                var id = this.id;
                genCodeArea.setValue(codeData[id]);
                genCodeArea.setSize('auto', 'auto');
            }
        });
        $('#btnCopy').on('click', function(){
            if(!$.isEmptyObject(genCodeArea.getValue())&&!$.isEmptyObject(navigator)&&!$.isEmptyObject(navigator.clipboard)){
                navigator.clipboard.writeText(genCodeArea.getValue());
                    $.toast({
                          text : "复制成功",showHideTransition : 'slide',
                          bgColor : 'blue',textColor : '#eee',allowToastClose : false,hideAfter : 1000,
                          stack : 5,textAlign : 'left',position : 'mid-center'
                    });
            }
        });
        $('#btnDownload').on('click', function(){
            var jsonData = {
                "tableSql": ddlSqlArea.getValue(),
                "packageName":$("#packageName").val(),
                "returnUtil":$("#returnUtil").val(),
                "authorName":$("#authorName").val(),
                "dataType":$("#dataType").val(),
                "tinyintTransType":$("#tinyintTransType").val(),
                "nameCaseType":$("#nameCaseType").val(),
                "className":$("#className").val(),
                "daoSuffix":$("#daoSuffix").val(),
                "swagger":$("#isSwagger").val()
            };
            var tableSql = ddlSqlArea.getValue();
            var packageName = $("#packageName").val();
            var returnUtil = $("#returnUtil").val();
            var authorName = $("#authorName").val();
            var dataType = $("#dataType").val();
            var tinyintTransType = $("#tinyintTransType").val();
            var nameCaseType = $("#nameCaseType").val();
            var className = $("#className").val();
            var daoSuffix = $("#daoSuffix").val();
            var swagger = $("#isSwagger").val();
            var url = base_url + "/getCodeFile?packageName="+packageName+"&returnUtil="+returnUtil+"&authorName="+authorName+"&dataType="+dataType
                        +"&tinyintTransType="+tinyintTransType
                        +"&nameCaseType="+nameCaseType+"&daoSuffix="+daoSuffix+"&swagger="+swagger+"&tableSql="+tableSql+"&className="+className;
            window.open(url)
        });
    });
</script>
</head>
<body style="background-color: #e9ecef">
<div class="jumbotron">
    <div class="container">
        <h3>Spring Boot Code Generator</h3>
        <hr>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">authorName</span>
            </div>
            <input type="text" class="form-control" id="authorName" name="authorName" value="shixing">
            <div class="input-group-prepend">
                <span class="input-group-text">返回封装类</span>
            </div>
            <input type="text" class="form-control" id="returnUtil" name="returnUtil" value="WrapperResponse">
            <div class="input-group-prepend">
                <span class="input-group-text">包名路径</span>
            </div>
            <input type="text" class="form-control" id="packageName" name="packageName" value="cn.hsa.cps">
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">入参数据类型</span>
            </div>
            <select type="text" class="form-control" id="dataType"
                    name="dataType">
                <option value="sql">sql</option>
            </select>
            <div class="input-group-prepend">
                <span class="input-group-text">tinyint转换类型</span>
            </div>
            <select type="text" class="form-control" id="tinyintTransType"
                    name="tinyintTransType">
                <option value="Integer">Integer</option>
                <option value="int">int</option>
                <option value="boolean">boolean</option>
                <option value="Boolean">Boolean</option>
                <option value="String">String</option>
            </select>
            <div class="input-group-prepend">
                <span class="input-group-text">命名转换规则</span>
            </div>
            <select type="text" class="form-control" id="nameCaseType" name="nameCaseType">
                <option value="CamelCase">驼峰</option>
            </select>
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">自定义类名</span>
            </div>
            <input type="text" class="form-control" id="className" name="className" value="" placeholder="默认表名">
            <div class="input-group-prepend">
                <span class="input-group-text">dao接口类后缀</span>
            </div>
            <select type="text" class="form-control" id="daoSuffix"
                    name="tinyintTransType">
                <option value="DAO">**DAO</option>
            </select>
            <div class="input-group-prepend">
                <span class="input-group-text">swagger-ui</span>
            </div>
            <select type="text" class="form-control" id="isSwagger" name="isSwagger">
                <option value="false">关闭</option>
                <option value="true">开启</option>
            </select>
        </div>
        <textarea id="ddlSqlArea" placeholder="请输入表结构信息..." class="form-control btn-lg" style="height: 250px;">
CREATE TABLE 'userinfo' (
  'user_id' int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  'username' varchar(255) NOT NULL COMMENT '用户名',
  'addtime' datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY ('user_id')
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息'
        </textarea><br>
        <p>
            <button class="btn btn-info" id="btnGenCode" role="button" data-toggle="popover" data-content="">开始生成</button>
            <button class="btn btn-info" id="btnCopy">一键复制</button>
            <button class="btn btn-info" id="btnDownload">下载文件</button>
        </p>
        <hr>
        <div class="row" style="margin-top: 10px;">
        <div class="btn-toolbar" role="toolbar">
            <div class="btn-group">
                <button type="button" class="btn btn-secondary btn-sm generator" id="model">model(set/get)</button>
                <button type="button" class="btn btn-secondary btn-sm generator" id="do">DO</button>
                <button type="button" class="btn btn-secondary btn-sm generator" id="dto">DTO</button>
            </div>
            <div class="btn-group">
                 <button type="button" class="btn btn-success btn-sm generator" id="mybatis">mybatis</button>
                 <button type="button" class="btn btn-success btn-sm generator" id="mapper">mapper</button>
            </div>
            <div class="btn-group">
                 <button type="button" class="btn btn-info btn-sm generator" id="service">service</button>
                 <button type="button" class="btn btn-info btn-sm generator" id="serviceImpl">serviceImpl</button>
                 <button type="button" class="btn btn-info btn-sm generator" id="bo">BO</button>
                 <button type="button" class="btn btn-info btn-sm generator" id="boImpl">BOImpl</button>
            </div>
            <div class="btn-group">
                 <button type="button" class="btn btn-warning btn-sm generator" id="controller">controller</button>
                 <button type="button" class="btn btn-warning btn-sm generator" id="swagger-ui">swagger-ui</button>
            </div>
            <div class="btn-group">
                 <button type="button" class="btn btn-dark btn-sm generator" id="util">util</button>
            </div>
        </div>
        <hr>
    </div>
    <div class="row" style="margin-top: 10px;">
         <textarea id="genCodeArea" class="form-control btn-lg" ></textarea>
    </div>
</div>
</body>
</html>
