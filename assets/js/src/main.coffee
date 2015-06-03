'use strict'

$ ->
  el = document.body

  if Times.is 'device', 'desktop'
    $(document.links).filter ->
      @hostname != window.location.hostname
    .attr 'target', '_blank'

  el.dataset.page ?= Times.context()
  el.dataset.device ?= Times.device()
  $(window).on "resize", Times.device()
  $(window).on "orientationchange", Times.device()

  FastClick.attach el unless Times.is 'device', 'desktop'

  if Times.is 'page', 'post'
    postTitle = $('#post-title').text()
    postTitle = postTitle.substring(0, postTitle.length - 1); # delete dot
    shareLink = "http://twitter.com/share?url=" + encodeURIComponent(document.URL)
    shareLink += "&text=" + encodeURIComponent "#{postTitle} »"
    $('#share_twitter').attr('href', shareLink)

  if Times.is 'page', 'error'
    $('#panic-button').click ->
      s = document.createElement 'script'
      s.setAttribute 'src','https://nthitz.github.io/turndownforwhatjs/tdfw.js'
      document.body.appendChild s
