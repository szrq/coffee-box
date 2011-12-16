$ ->
  # highlight codes
  $('pre code').each (i, e) ->
    hljs.highlightBlock e, '    '

  # hide comments in index page
  if window.location.pathname is '/'
    $('.comments').hide()
    # toggle comments
    $('.comments-info').toggle (->
      $(this)
        .data('original-text', $(this).text())
        .hide()
        .text('hide comments')
        .fadeIn()
        .next()
        .slideDown()
      false), (->
      $(this)
        .hide()
        .text($(this).data('original-text'))
        .fadeIn()
        .next()
        .slideUp()
      false)

  # open external links in new tabs
  $('a').attr 'target', ->
    @host is location.host ? '_self' : '_blank'
