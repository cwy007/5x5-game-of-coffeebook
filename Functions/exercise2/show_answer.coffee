x = true
showAnswer = (x) ->
  x ?= x
  console.log if x then 'It works!' else 'Nope.'
showAnswer(x)
showAnswer()
