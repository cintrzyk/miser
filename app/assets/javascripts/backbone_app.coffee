$ ->
  options =
    environment:      gon.environment
    signed_user_data: gon.signed_user_data
    api_endpoint:     gon.api_endpoint
    domain:           gon.domain

  Miser.start options
