## Word Count
# Creatng the function
$ ->
  wordCount = ->
    txtVal = $('.documentArea').val()
    words = txtVal.trim().replace(/\s+/g, ' ').split(' ').length
    chars = txtVal.length
    words = 0 if chars is 0
    if words == 1
      $('#counter').html(words + ' word')
    else
      $('#counter').html(words + ' words')

  # Calling the function initially
  wordCount()

  # Binding the function to 'word-adding' events in the .documentArea
  $('.documentArea').on 'keyup propertychange paste', ->
    wordCount()

## Doc Info Modal
$ ->
  $('#revealDocInfo').click ->
    $('#docInfo').foundation('reveal', 'open')
    return false

## Always start at bottom of document
$ ->
  textarea = $('.documentArea');
  $(textarea).scrollTop($(textarea)[0].scrollHeight)

## Keyboard shortcuts
$ ->
  # Markdown guide
  toggle = false
  $('.documentArea').keydown (e) ->
    if ((e.ctrlKey) && (e.which == 77))
      if toggle == false
        $('.markdown-guide').css 'opacity', '.9'
        toggle = true
      else
        $('.markdown-guide').css 'opacity', '0'
        toggle = false
  # Save
  $('.documentArea').keydown (e) ->
    if ((e.ctrlKey) && (e.which == 83))
      $('form').submit()
  # Info
  $('.documentArea').keydown (e) ->
    if ((e.ctrlKey) && (e.which == 73))
      $('#docInfo').foundation('reveal', 'open')
      return false

