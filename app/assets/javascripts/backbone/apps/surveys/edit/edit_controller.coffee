@Miser.module 'SurveysApp.Edit', (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Authenticated

    initialize: (opt) ->
      { survey } = opt

      @layout = @getLayoutView()
      @show @layout

    getLayoutView: ->
      new Edit.Layout
