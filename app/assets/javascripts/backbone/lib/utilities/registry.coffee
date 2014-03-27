@Miser.module 'Utilities', (Utilities, App, Backbone, Marionette, $, _) ->

  _.extend App,

    register: (instance, id) ->
      @_registry ?= {}
      @_registry[id] = instance

    unregister: (instance, id) ->
      delete @_registry[id]

    resetRegistry: ->
      old_count = @getRegistrySize()
      for key, controller of @_registry
        controller.region.close()
      new_count = @getRegistrySize()
      msg = "There were #{old_count} controllers in registry, there are now #{new_count}"
      if new_count > 0 then console.warn msg, @_registry else console.log msg

    getRegistrySize: ->
      _.size @_registry
