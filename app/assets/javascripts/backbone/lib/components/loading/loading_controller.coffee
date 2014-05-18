@Miser.module 'Components.Loading', (Loading, App, Backbone, Marionette, $, _) ->

  class Loading.LoadingController extends App.Controllers.Base

    initialize: (options) ->
      { view, config } = options

      _.defaults config,
        entities: @getEntities view
        debug: false
        loading: false

      if config.loading
        loadingView = @getLoadingView()
        @show loadingView
        @showRealView view, loadingView, config

    showRealView: (realView, loadingView, config) ->
      App.execute 'when:fetched', config.entities, =>
        return @realView.close() if @region.currentView isnt loadingView
        @show realView unless config.debug

    getEntities: (view) ->
      # return the entities manually set during configuration, or just pull
      # off the model and collection from the view (if exist)
      _.chain(view).pick('model', 'collection').toArray().compact().value()

    getLoadingView: ->
      new Loading.LoadingView

  App.commands.setHandler 'show:loading', (view, options) ->
    new Loading.LoadingController
      view: view
      region: options.region
      config:
        loading: options.loading
