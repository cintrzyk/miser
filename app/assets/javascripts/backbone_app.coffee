#= require js_stack
#= require hamlcoffee

#= require js_stack/plugins/underscore.string
#= require backbone.syphon
#= require ./backbone/app

#= require_tree ./backbone/lib/utilities
#= require_tree ./backbone/lib/views
#= require_tree ./backbone/lib/controllers
#= require_tree ./backbone/lib/components

#= require_tree ./backbone/entities
#= require_tree ./backbone/apps
#= require_self

$ ->
  options =
    environment:      gon.environment
    signed_user_data: gon.signed_user_data
    api_endpoint:     gon.api_endpoint
    domain:           gon.domain

  Miser.start options
