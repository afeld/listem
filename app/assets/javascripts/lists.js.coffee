$ ->
  setFallback = ($el) ->
    fallback = $el.text()
    $el.data('fallback', fallback)

  $contentEditable = $('[contenteditable="true"]')

  $contentEditable.each (i, el) ->
    setFallback($(el))

  $contentEditable.on 'keydown', (e) ->
    if e.which == 13
      # don't allow newlines
      false

  $contentEditable.on 'blur', (e) ->
    $el = $(e.target)
    text = $el.text()
    fallback = $el.data('fallback')

    if /^\s*$/.test(text)
      # blank
      $el.text(fallback)
    else if text != fallback
      # save
      $.ajax(
        url: location.pathname
        method: 'patch',
        data: {
          list: {
            title: text
          }
        }
      )
      setFallback($el)
