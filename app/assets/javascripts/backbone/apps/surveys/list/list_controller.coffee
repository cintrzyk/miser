@Miser.module 'SurveysApp.List', (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Authenticated

    initialize: ->
      surveys = App.request 'surveys:entities'

      @layout = @getLayoutView()

      @listenTo @layout, 'show', ->
        @contentRegion surveys

      @show @layout

    getLayoutView: ->
      new List.Layout

    getHeaderView: ->
      new List.Header

    getContentView: (surveys) ->
      new List.Content
        collection: surveys

    contentRegion: (surveys) ->
      view = @getContentView surveys
      @show view,
        loading: true
        region: @layout.contentRegion
