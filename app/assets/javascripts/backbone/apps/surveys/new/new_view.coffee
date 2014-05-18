@Miser.module 'SurveysApp.New', (New, App, Backbone, Marionette, $, _) ->

  class New.Layout extends App.Views.Layout
    template: 'surveys/new/layout'
    className: 'col-xs-12 col-sm-12'
    regions:
      formRegion:     '.form-region'
      progressRegion: '.progress-region'

  class New.Form extends App.Views.ItemView
    template: 'surveys/new/form'
    className: 'box'

  class New.Progress extends App.Views.ItemView
    template: 'surveys/new/progress'
