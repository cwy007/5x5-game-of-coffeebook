{Dictionary} = require './Dictionary'
{Grid} = require './Grid'
{Player} = require './Player'
{OWL2} = require './OWL2'

grid = new Grid
dictionary = new Dictionary OWL2, grid
player = new Player "Chan", dictionary

stdin = process.openStdin()
stdin.setEncoding 'utf8'

inputCallback = null
stdin.on 'data', (input) -> inputCallback input

promptForTile1 = ->
  printGrid()
  console.log "Please enter coordinates for the first tile."
  inputCallback = (input) ->
    try
      {x, y} = strToCoordinates input
    catch e
      console.log e
      return
    promptForTile2 x, y

promptForTile2 = (x1, y1) ->
  console.log "Please enter coordinates for the second tile."
  inputCallback = (input) ->
    try
      {x: x2, y: y2} = strToCoordinates input
    catch e
      console.log e
      return
    if x1 is x2 and y1 is y2
      console.log "The second tile must be different from the first."
    else
      console.log "Swapping (#{x1}, #{y1}) with (#{x2}, #{y2})...\n"
      x1--; x2--; y1--; y2-- # convert 1-based indices to 0-based
      player.makeMove {x1, y1, x2, y2}
      unless dictionary.newWords.length is 0
        console.log """
          You formed the following word(s):
          #{dictionary.newWords.join(', ')}

        """
      console.log "Your score after #{player.moveCount} moves: #{player.score}"
      promptForTile1()

isInteger = (num) ->
  num is Math.round num

strToCoordinates = (input) ->
  halves = input.split ','
  if halves.length is 2
    x = parseFloat halves[0]
    y = parseFloat halves[1]
    if !isInteger(x) or !isInteger(y)
      console.log "Each coordinate must be an integer."
    else if not grid.inRange x - 1, y - 1
      console.log "Each coordinate must be between 1 and #{grid.size}."
    else
      {x, y}
  else
    console.log "Input must be of the form `x, y`."

printGrid = ->
  rowStrings = (' ' + row.join(' | ') for row in grid.rows())
  rowSeparator = ('-' for i in [1...grid.size * 4]).join('')
  console.log '\n' + rowStrings.join("\n#{rowSeparator}\n") + '\n'

console.log "Welcome to 5x5!"
unless dictionary.usedWords.length is 0
  console.log """
    Initiallly used words:
    #{dictionary.usedWords.join(', ')}

  """
console.log "Please choose a tile in the form (x, y)."
promptForTile1()
