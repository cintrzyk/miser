@Miser.module 'Concerns', (Concerns, App, Backbone, Marionette, $, _) ->

  Concerns.DataTable =
    events:
      'mouseenter td.actions a' : 'toggleHighlightRow'
      'mouseleave td.actions a' : 'toggleHighlightRow'

    toggleHighlightRow: (e) ->
      $(e.target).closest('tr').toggleClass 'highlight'

    onRender: ->
      @$('.table-datatable').DataTable @dataTableOptions
      @addSearchPlaceholder()

    dataTableOptions:
      sDom: "<'box-content'<'col-sm-6'f><'col-sm-6 text-right'l><'clearfix'>>rt<'box-content'<'col-sm-6'i><'col-sm-6 text-right'p><'clearfix'>>"
      aoColumnDefs: [{
        bSortable: false
        aTargets:  [ -1 ]
      }]
      oLanguage:
        sSearch: ''
        sLengthMenu: "_MENU_"

    addSearchPlaceholder: ->
      @$('[type=search]').attr 'placeholder', 'Search'

