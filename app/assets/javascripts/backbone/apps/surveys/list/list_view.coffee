@Miser.module 'SurveysApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: 'surveys/list/layout'
    className: 'col-xs-12 col-sm-12'
    regions:
      contentRegion: '.content-region'

  class List.Item extends App.Views.ItemView
    template: 'surveys/list/item'
    tagName: 'tr'

  class List.Empty extends App.Views.ItemView
    template: 'surveys/list/empty'
    tagName: 'tr'

  class List.Content extends App.Views.CompositeView
    template: 'surveys/list/templates/list'
    itemView: List.Item
    emptyView: List.Empty
    itemViewContainer: 'tbody'
