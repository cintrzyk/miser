@Miser.module 'Components.Form', (Form, App, Backbone, Marionette, $, _) ->

  class Form.Controller extends App.Controllers.Base

    initialize: (options = {}) ->
      @contentView = options.view

      @formLayout = @getFormLayout options.config

      @listenTo @formLayout, 'show', @formContentRegion
      @listenTo @formLayout, 'close', @close
      @listenTo @formLayout, 'form:submit', @formSubmit

    formSubmit: ->
      data = Backbone.Syphon.serialize @formLayout
      model = @contentView.model
      @processFormSubmit data, model

    processFormSubmit: (data, model) ->
      model.save data

    getFormLayout: (options = {}) ->
      config = @getDefaultConfig _.result(@contentView, 'form')

      new Form.FormWrapper
        config: config
        model: @contentView.model

    getDefaultConfig: (config = {}) ->
      _.defaults config,
       className: ''
       focusFirstInput: false
       errors: true
       syncing: true

    formContentRegion: ->
      @show @contentView,
        region: @formLayout.formContentRegion


  App.reqres.setHandler 'form:component', (contentView, options = {}) ->
    throw new Error "No model found inside of form's contentView" unless contentView.model
    formController = new Form.Controller
      view: contentView
      config: options
    formController.formLayout
