# (1)
clearArray = (arr) ->
  arr.splice 0, arr.length
  # arr
  return

# (2)
run = (func, args...) -> func.apply this, args...

# (3)

return abortMission warning if warning?
return abortMission(warning) if warning?
if warning? then return abortMission warning
if warning? then return abortMission(warning)

return abortMission(warning if warning?)

# （6）
xInContext = ->
  console.log @x
what = {x: 'quantum entanglement'}

xInContext.call what 
