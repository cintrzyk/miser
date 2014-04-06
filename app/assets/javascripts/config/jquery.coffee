do ($) ->
  $.fn.toggleWrapper = (obj = {}, init) ->
    methods =
      isTransparent: (bg) ->
        /transparent|rgba/.test bg

      setBackgroundColor: (bg) ->
        if @isTransparent(bg) then 'white' else bg

    _.defaults obj,
      className: ''
      backgroundColor: methods.setBackgroundColor @css('backgroundColor')
      zIndex: if @css('zIndex') is 'auto' or 0 then 2000 else (Number) @css('zIndex')

    $offset = @offset()
    $width  = @outerWidth false
    $height = @outerHeight false

    if init
      $('<div>')
        .appendTo('body')
          .addClass(obj.className)
            .attr('data-wrapper', true)
              .css
                width: $width
                height: $height
                top: $offset.top
                left: $offset.left
                position: 'absolute'
                zIndex: obj.zIndex + 1
                backgroundColor: obj.backgroundColor
          .spin
            lines: 13            # The number of lines to draw
            length: 5            # The length of each line
            width: 2             # The line thickness
            radius: 10           # The radius of the inner circle
            corners: 1           # Corner roundness (0..1)
            rotate: 0            # The rotation offset
            direction: 1         # 1: clockwise, -1: counterclockwise
            color: '#000'        # #rgb or #rrggbb or array of colors
            speed: 1.5           # Rounds per second
            trail: 66            # Afterglow percentage
            shadow: false        # Whether to render a shadow
            hwaccel: false       # Whether to use hardware acceleration
            className: 'spinner' # The CSS class to assign to the spinner
            zIndex: 2e9          # The z-index (defaults to 2000000000)
            top: 'auto'          # Top position relative to parent in px
            left: 'auto'         # Left position relative to parent in px
    else
      $('[data-wrapper]').remove()
