objContains = (obj, match) ->
  for k, v of obj
    if v is match
      return true
  false 
