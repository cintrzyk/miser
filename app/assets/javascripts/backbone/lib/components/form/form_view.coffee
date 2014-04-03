@Miser.module 'Components.Form', (Form, App, Backbone, Marionette, $, _) ->

  class Form.FormWrapper extends App.Views.Layout
    template: 'form/form'
    tagName: 'form'
    regions:
      formContentRegion: '#form-content-region'

    className: ->
      @options.config.className

    initialize: ->
      { @config } = @options

    attributes: ->
      'autocomplete': 'off'
      'data-type': @getFormDataType()

    triggers:
      'submit' : 'form:submit'

    modelEvents:
      'change:_errors' : 'changeErrors'
      'sync:start'     : 'syncStart'
      'sync:stop'      : 'syncStop'

    onShow: ->
      _.defer =>
        @focusFirstInput() if @config.focusFirstInput

    focusFirstInput: ->
      @$(':text:visible:enabled:first').focus()

    getFormDataType: ->
      if @model.isNew() then 'new' else 'edit'

    changeErrors: (model, errors, options) ->
      if @config.errors
        if _.isEmpty(errors) then @removeErrors() else @addErrors errors

    addErrors: (errors = {}) ->
      for name, array of errors
        @addError name, array[0]

    addError: (name, error) ->
      $el = @$("[name='#{name}']:first")
      $span = $('<span>').addClass 'fa fa-times form-control-feedback'
      $help = $('<span>').addClass('help-block').text error

      $el.closest('.form-group').addClass 'has-error has-feedback'
      $el.after [$span, $help]

    removeErrors: ->
      @$('.has-error.has-feedback').removeClass('has-error has-feedback').find('.help-block,.form-control-feedback').remove()

    syncStart: (model) ->
      @addOpacityWrapper() if @config.syncing

    syncStop: (model) ->
      @addOpacityWrapper(false) if @config.syncing
