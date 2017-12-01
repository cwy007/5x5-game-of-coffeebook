age = 99
reincarnate = -> age = 0
reincarnate()
console.log "I am #{age} years old"

singCountdown = (count) ->
  singBottleCount = (specifyLocation) ->
    locationStr = if specifyLocation then 'on the wall' else ''
    bottleStr = if count is 1 then 'bottle' else 'bottles'
    console.log "#{count} #{bottleStr} of beer #{locationStr}"
  singDecrement = ->
    console.log "Take one down, pass it around"
    count--
  singBottleCount true; singBottleCount false
  singDecrement(); singBottleCount true
  if count isnt 0 then singCountdown count

obj = null
initializeObj = ->
  obj = 222  # create object with superpowers
window.onload = initializeObj
