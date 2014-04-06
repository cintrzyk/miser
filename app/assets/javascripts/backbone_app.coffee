#= require js_stack
#= require js_stack/plugins/underscore.string
#= require hamlcoffee

#= require backbone.syphon
#= require_tree ./config
#= require ./backbone/app
#= require ./backbone/main_router

#= require_tree ./backbone/lib/utilities
#= require_tree ./backbone/lib/views
#= require_tree ./backbone/lib/controllers
#= require_tree ./backbone/lib/entities
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
