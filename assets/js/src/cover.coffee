'use strict'

$ ->
  el = document.body
  isOpen = location.hash is '#open'

  _animate = ->
    setTimeout(->
      $('.cover').addClass 'animated'
    , 1000)

  _expand = (options = {})->
    method = if options.toggle is 'hide' then 'addClass' else 'toggleClass'
    $('.cover')[method] 'expanded'
    $('.link-item')[method] 'expanded'
    Times.search.form options.form if options.form?

  $('#blog-button').click ->
    return $("#menu-button").trigger("click") unless Times.is 'device', 'desktop'
    _expand(hide: 'toggle', form: 'toggle')

  $("#menu-button").click ->
    $('.cover').toggleClass 'expanded'
    $('.main').toggleClass 'expanded'
    $('#menu-button').toggleClass 'expanded'

  if (Times.is 'device', 'desktop') and (Times.is 'page', 'home')
    _animate()
    _expand(aside: 'hide', form: 'hide') if !isOpen
