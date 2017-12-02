# 4个实例属性: name, dictionary, score, moveCount
# 2个实例方法：setDictionary，makeMove
class Player
  constructor: (@name, dictionary) ->
    @setDictionary dictionary if dictionary?

  setDictionary: (@dictionary) ->
    @score = 0
    @moveCount = 0

  makeMove: (swapCoordinates) ->        # 移动方式
    @dictionary.grid.swap swapCoordinates
    @moveCount++
    result = @dictionary.scoreMove swapCoordinates   # NOTE: scoreMove, moveScore
    @score += result.moveScore

root = exports ? window
root.Player = Player
