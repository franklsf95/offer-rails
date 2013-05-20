#= require dataTables/jquery.dataTables
#= require dataTables/jquery.dataTables.bootstrap
$ ->
  $('#datatable').dataTable
    iDisplayLength: 50
    sDom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>"
    sPaginationType: 'bootstrap'
