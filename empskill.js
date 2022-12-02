$(function(){ // jQuery for handling onclick event
    document.getElementById('updateLink').onclick =
        function () {
            //alert($("#addLink").href);
            document.getElementById('updateLink').href = '<%=request.getContextPath()%>/update';
        };
});

$(function(){ // jQuery for handling onclick event
    document.getElementById('insertLink').onclick =
        function () {
            //alert($("#addLink").href);
            document.getElementById('insertLink').href = '<%=request.getContextPath()%>/insert';
        };
});

$(function(){ // jQuery for handling onclick event
    document.getElementById('deleteLink').onclick =
        function () {
            //alert($("#addLink").href);
            document.getElementById('deleteLink').href = '<%=request.getContextPath()%>/delete';
        };
});