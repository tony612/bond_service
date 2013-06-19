/* [ ---- Gebo Admin Panel - datatables ---- ] */

$(document).ready(function() {
  if ($('#schools-index-table').size() > 0) {
    // horizontal scroll
    gebo_datatables.schools_index_table();
  }
});

gebo_datatables = {
  schools_index_table: function() {
    var schoolTable = $('#schools-index-table').dataTable({
      "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
      "sScrollX": "100%",
      "sScrollY": "500px",
      //"sScrollXInner": '300%',
      "sPaginationType": "bootstrap",
      "bScrollCollapse": false,
      "iDisplayLength": 25,
      "bFilter": false,
      "bLengthChange": false,
      "bPaginate": false
    });
    new FixedColumns(schoolTable, {"iLeftColumns": 2, "iRightColumns": 1, "iLeftWidth": 200});
  }
};
