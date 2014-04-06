@Miser.module 'Entities', (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Model extends Backbone.Model
    destroy: (options = {}) ->
      _.defaults options,
        wait: true

      @set _destroy: true
      super options

    isDestroyed: ->
      @get '_destroy'

    save: (data, options = {}) ->
      isNew = @isNew()

      _.defaults options,
        wait: true
        success:  _.bind @saveSuccess, @, isNew, options.collection, options.callback
        error:    _.bind @saveError, @

      @unset '_errors'
      super data, options

    saveSuccess: (isNew, collection, callback) =>
      if isNew
        collection?.add @
        collection?.trigger 'model:created', @
        @trigger 'created', @
      else
        collection ?= @collection ## if model has collection property defined, use that if no collection option exists
        collection?.trigger 'model:updated', @
        @trigger 'updated', @

      callback?()

    saveError: (model, xhr, options) =>
      json_response = $.parseJSON(xhr.responseText)
      if msg = json_response?.msg
        App.msg msg.text,
          type: msg.type
      @set _errors: json_response?.errors unless /500|404/.test xhr.status

    sync: (method, entity, options = {}) ->
      methods =
        beforeSend: ->
          @trigger 'sync:start', @
        complete: ->
          @trigger 'sync:stop', @
        buildURL: ->
          url = @url()
          return url if _.string.startsWith url, 'http://'
          api_endpoint = App.request 'get:api_endpoint'
          "http://#{api_endpoint}#{url}"

      _.defaults options,
        beforeSend: _.bind(methods.beforeSend, entity)
        complete:   _.bind(methods.complete,   entity)
        url:        _.bind(methods.buildURL,   entity)()

      sync = super(method, entity, options)
      if !entity._fetch and method is 'read'
        entity._fetch = sync
