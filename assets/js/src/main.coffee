'use strict'

$ ->
  el = document.body

  if Uno.is 'device', 'desktop'
    $(document.links).filter ->
      @hostname != window.location.hostname
    .attr 'target', '_blank'

  el.dataset.page ?= Uno.context()
  el.dataset.device ?= Uno.device()
  $(window).on "resize", Uno.device()
  $(window).on "orientationchange", Uno.device()

  FastClick.attach el unless Uno.is 'device', 'desktop'

  if Uno.is 'page', 'post'
    postTitle = $('#post-title').text()
    postTitle = postTitle.substring(0, postTitle.length - 1); # delete dot
    shareLink = "http://twitter.com/share?url=" + encodeURIComponent(document.URL)
    shareLink += "&text=" + encodeURIComponent "#{postTitle} »"
    $('#share_twitter').attr('href', shareLink)

  if Uno.is 'page', 'error'
    $('#panic-button').click ->
      s = document.createElement 'script'
      s.setAttribute 'src','https://nthitz.github.io/turndownforwhatjs/tdfw.js'
      document.body.appendChild s
