@Miser.module 'SurveysApp.Edit', (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Layout extends App.Views.Layout
    template: 'surveys/edit/layout'
    regions:
      surveyRegion:      '.survey-region'
      newQuestionRegion: '.new-question-region'
      questionsRegion:   '.questions-region'

  class Edit.Survey extends App.Views.ItemView
    template: 'surveys/edit/survey'
    form:
      className: 'form-horizontal'
      focusFirstInput: true

  class Edit.NewQuestion extends App.Views.ItemView
    template: 'surveys/edit/new_question'

  class Edit.Question extends App.Views.ItemView
    template: 'surveys/edit/question'
    tagName: 'li'

  class Edit.Empty extends App.Views.ItemView
    template: 'surveys/edit/empty'
    tagName: 'li'

  class Edit.Questions extends App.Views.CompositeView
    template: 'surveys/edit/questions'
    itemView: Edit.Question
    emptyView: Edit.Empty
    itemViewContainer: 'ul'
