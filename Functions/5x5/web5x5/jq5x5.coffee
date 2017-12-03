grid = dictionary = currPlayer = player1 = player2 = selectedCoordinates = null

newGame = ->
  grid = new Grid
  dictionary = new Dictionary OWL2, grid
  currPlayer = player1 = new Player "Player 1", dictionary
  player2 = new Player "Player 2", dictionary
  drawTiles()

  player1.num = 1
  player2.num = 2
  for player in [player1, player2]
    $("#p#{player.num}name").html player.name
    $("#p#{player.num}score").html 0
  showMessage "firstTile"

drawTiles = ->
  gridHtml = ""
  for x in [0...grid.tiles.length]
    gridHtml += "<ul>"
    for y in [0...grid.tiles.length]
      gridHtml += "<li id=\"tile#{x}_#{y}\">#{grid.tiles[x][y]}</li>"
    gridHtml += "</ul>"
  $("#grid").html gridHtml

showMessage = do ->
  messages =
    firstTile: ", please select your first tile."
    secondTile: ", please select your second tile."

  (message) ->
    $("#message").html "<b>#{currPlayer.name}</b>#{messages[message]}"

selectTile = (x, y) ->
  if selectedCoordinates is null
    selectedCoordinates = {x1: x, y1: y}
    showMessage "secondTile"
  else
    selectedCoordinates.x2 = x
    selectedCoordinates.y2 = y
    $("#grid li").removeClass "selected"
    doMove()

doMove = ->
  {moveScore, newWords} = currPlayer.makeMove selectedCoordinates

  notice = if moveScore is 0
             "#{currPlayer.name} formed no words this turn."
           else
             """
             #{currPlayer.name} formed the following #{newWords.length} words:<br>
             <b>#{newWords.join(', ')}</b><br>
             earning <b>#{moveScore / newWords.length}x#{newWords.length} =
             #{moveScore} points!
             """
  $notice = $("<p class=\"notice\">#{notice}</p>")
  showThenFade $notice

  $("#p#{currPlayer.num}score").html currPlayer.score
  drawTiles()

  endTurn()

showThenFade = ($elem) ->
  $elem.insertAfter $("#grid")
  animationTarget = opacity: 0, height: 0, padding: 0
  $elem.delay(5000).animate animationTarget, 500, -> $elem.remove()

endTurn = ->
  currPlayer = if currPlayer is player1 then player2 else player1
  selectedCoordinates = null
  showMessage "firstTile"

tileClick = ->
  $tile = $(@)
  if $tile.hasClass "selected"
    # undo
    selectedCoordinates = null
    $tile.removeClass "selected"
    showMessage "firstTile"
  else
    $tile.addClass "selected"
    [x, y] = @id.match(/(\d+)_(\d+)/)[1..]
    selectTile x, y

$ ->
  newGame()
  $("#grid li").live "click", tileClick
