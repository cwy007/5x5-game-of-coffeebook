setName1 = (name) -> @name = name
setName2 = (@name) ->    # no code required!

callback = (message) => @voicemail.push message

ringFireAlarm = (isDrill = true) ->
  # it's pretty much always a drill
  # isDrill = true unless isDrill?
  # isDrill ?= true

refine = (wheat, chaff...) ->
  console.log "The best: #{wheat}"
  console.log "The rest: #{chaff.join(', ')}"

refine 'great', 'not bad', 'so-so', 'meh'

sandwich = (beginning, middle..., end) ->
  # ...

stdin.on 'data', (input) ->
