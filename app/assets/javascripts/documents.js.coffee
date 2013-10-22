## Word Count
# Creatng the function
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
$('#revealDocInfo').click ->
  $('#docInfo').foundation('reveal', 'open')
  return false
