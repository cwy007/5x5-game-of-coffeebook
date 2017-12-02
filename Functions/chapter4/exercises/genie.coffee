Genie = ->
Genie::wishesLeft = 3

Genie::grantWish = ->
  if @wishesLeft > 0
    console.log 'Your wish is granted!'
    @wishesLeft--
