@Miser.module 'SidebarApp.Show', (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template:  'sidebar/show/layout'
    tagName:   'ul'
    className: 'nav main-menu'
    events:
      'click a' : 'linkClicked'

    onRender: ->
      @makeActiveLink()

    makeActiveLink: ->
      url = window.location.hash
      url = '#dashboard' if _.isEmpty url
      $link = @$("a[href='#{url}']")
      $link.closest('li.dropdown').find('a.dropdown-toggle').trigger 'click'
      $link.trigger 'click'

    linkClicked: (e) ->
      $link = @$(e.target).closest 'a'
      $parents = $link.parents 'li'
      $li = $link.closest 'li.dropdown'
      $another_items = @$('li').not $parents
      $another_items.find('a').removeClass 'active active-parent'

      if $link.hasClass('dropdown-toggle') || $link.closest('li').find('ul').length == 0
        $link.addClass 'active-parent'
        current = $link.next()
        if current.is ':visible'
          $li.find('ul.dropdown-menu').slideUp 'fast'
          $li.find('ul.dropdown-menu a').removeClass 'active'
        else
          $another_items.find('ul.dropdown-menu').slideUp 'fast'
          current.slideDown('fast')
      else
        if $li.find('a.dropdown-toggle').hasClass 'active-parent'
          pre = $link.closest 'ul.dropdown-menu'
          pre.find('li.dropdown').not($link.closest('li')).find('ul.dropdown-menu').slideUp 'fast'

      if $link.hasClass('active') == false
        $link.parents('ul.dropdown-menu').find('a').removeClass 'active'
        $link.addClass 'active'

      if $link.hasClass('dropdown-toggle')
        e.preventDefault()
