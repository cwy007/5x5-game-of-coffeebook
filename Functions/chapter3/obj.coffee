obj = new Object()

objj = {}

arr = []
arr[{toString: -> '1'}]

console.log ('practice' for i in [1..3]).join(', ')

for x in arr
  do (x) ->
    setTimeout (-> console.log x), 0

decimate = (army) ->
  execute(soldier) for soldier in army by 10

animate = (startTime, endTime, framesPerSecond) ->
  for pos in [startTime..endTime] by 1 / framesPerSecond
    addFrame pos 
