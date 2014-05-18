@Miser.module 'SurveysApp.New', (New, App, Backbone, Marionette, $, _) ->

  class New.Layout extends App.Views.Layout
    template: 'surveys/new/layout'
    regions:
      formRegion:     '.form-region'
      progressRegion: '.progress-region'

  class New.Form extends App.Views.ItemView
    template: 'surveys/new/form'
    form:
      className: 'form-horizontal'
      focusFirstInput: true

  class New.Progress extends App.Views.ItemView
    template: 'surveys/new/progress'
