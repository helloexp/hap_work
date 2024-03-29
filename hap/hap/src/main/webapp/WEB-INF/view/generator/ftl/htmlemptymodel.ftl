${'<#include "../include/header.html">'}
<script type="text/javascript">
    var viewModel = kendo.observable({
        model: {},
        createFunction: function () {
            $('#Grid').data('kendoGrid').addRow();
        },
        saveFunction: function () {
            $('#Grid').data('kendoGrid').saveChanges();
        },
        queryResource: function (e) {
            $('#Grid').data('kendoGrid').dataSource.page(1);
        }
    });
</script>
${'<body>'}
<div id="page-content">
    <div class="pull-left" id="toolbar-btn" style="padding-bottom:10px;">
        <span class="btn btn-primary k-grid-add" style="float:left;margin-right:5px;" data-bind="click:createFunction">${'<@spring.message "hap.new"/>'}</span>
        <span class="btn btn-success k-grid-save-changes" data-bind="click:saveFunction" style="float:left;margin-right:5px;">${'<@spring.message "hap.save"/>'}</span>
        <span onclick="deleteData()" class="btn btn-danger" style="float:left;">${'<@spring.message "hap.delete"/>'}</span>
    </div>
    <script>kendo.bind($('#toolbar-btn'), viewModel);</script>
    <div class="pull-right" id="query-form" style="padding-bottom:10px;">
    <#list columnsInfo as infos>
        <#if infos.tableColumnsName?ends_with("Code")||infos.tableColumnsName?ends_with("Name")||infos.tableColumnsName?ends_with("Type")>
            <input type="text" data-role="maskedtextbox" style="float:left;width:150px;margin-right:5px;" placeholder='${'<@spring.message '}"${dtoName}.${infos.tableColumnsName}"/>'
                   data-bind="value:model.${infos.tableColumnsName}" class="k-textbox">
        </#if>
    </#list>
    <#--</#list>
        <#list 1..4 as i>
            <input type="text"  data-role="maskedtextbox" style="float:left;width:150px;margin-right:5px;" placeholder='${'<@spring.message '}"${dtoName}.${columnsInfo[i].tableColumnsName}"/>' data-bind="value:model.${columnsInfo[i].tableColumnsName}" class="k-textbox">
        </#list>-->
        <span class="btn btn-primary" style="float:left;width:70px" data-bind="click:queryResource" type="submit">${'<@spring.message "hap.query"/>'}</span>
        <div style="clear:both"></div>
    </div>
    <script>kendo.bind($('#query-form'), viewModel);</script>
    <div style="clear:both">
        <div id="Grid"></div>
    </div>
</div>

<script type="text/javascript">

    var BaseUrl = _basePath;
    dataSource = new kendo.data.DataSource({
        transport: {
            read: {
                url: BaseUrl + "${queryUrl}",
                type: "POST",
                dataType: "json"
            },
            update: {
                url: BaseUrl + "${submitUrl}",
                type: "POST",
                contentType: "application/json"
            },
            destroy: {
                url: BaseUrl + "${removeUrl}",
                type: "POST",
                contentType: "application/json"
            },
            create: {
                url: BaseUrl + "${submitUrl}",
                type: "POST",
                contentType: "application/json"
            },
            parameterMap: function (options, type) {
                if (type !== "read" && options.models) {
                    var datas = Hap.prepareSubmitParameter(options, type)
                    return kendo.stringify(datas);
                } else if (type === "read") {
                    return Hap.prepareQueryParameter(viewModel.model.toJSON(), options)
                }
            }
        },
        batch: true,
        serverPaging: true,
        pageSize: 10,
        schema: {
            data: 'rows',
            total: 'total',
            model: {
                id: "${columnsInfo[0].tableColumnsName}",
                fields: {}
            }
        }
    });

    $("#Grid").kendoGrid({
        dataSource: dataSource,
        height: '100%',
        resizable: true,
        scrollable: true,
        navigatable: false,
        selectable: 'multiple, rowbox',
        pageable: {
            pageSizes: [5, 10, 20, 50],
            refresh: true,
            buttonCount: 5
        },
        columns: [
        <#list columnsInfo as infos>
            {
                field: "${infos.tableColumnsName}",
                title: '${'<@spring.message'} "${dtoName}.${infos.tableColumnsName}"/>',
                width: 120
            },
        </#list>],
        editable: true
    });

    function deleteData() {

        Hap.deleteGridSelection({
            grid: $('#Grid')
        });

    }

    Hap.autoResizeGrid("#Grid");


</script>
${'</body>'}
${'</html>'}