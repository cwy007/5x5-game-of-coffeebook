fs = require 'fs'                            # 引用库 fs
owl2 = fs.readFileSync 'OWL2.txt', 'utf8'    # 读取文件OWL2.txt产生字串owl2

GRID_SIZE = 5                                # 网格大小
MIN_WORD_LENGTH = 2                          # 最小有效字长度

wordList = owl2.match /^(\w+)/mg             # 过滤出单词
wordList = (word for word in wordList when word.length <= GRID_SIZE) # 过滤出符合网格尺寸的单词

isWord = (str) ->                            # 字串有效性判断
  str in wordList

inRange = (x, y) ->                          # 坐标有效性判断
  0 <= x < GRID_SIZE and 0 <= y < GRID_SIZE

isInteger = (num) ->                         # 判断输入的数字是否为整数
  num is Math.round(num)

# Probabilities are taken from Scrabble, except that there are no blanks.
# See http://www.hasbro.com/scrabble/en_us/saqGeneral.cfm
tileCounts =                                 # 不同字母相对权重，出现的概率
  A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9, J: 1, K: 1, L: 4
  M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6, U: 4, V: 2, W: 2, X: 1
  Y: 2, Z: 1
totalTiles = 0
totalTiles += count for letter, count of tileCounts

# JavaScript hashes are unordered, so we need to make our own key array:
alphabet = (letter for letter of tileCounts).sort()  # [A, B, .. , Z]

randomLetter = ->                             # 随机产生一个字母
  randomNumber = Math.ceil Math.random() * totalTiles
  x = 1
  for letter in alphabet
    x += tileCounts[letter]
    return letter if x > randomNumber

# grid is a 2D array: grid[col][row], where 0, 0 is the upper-left corner

grid = for x in [0...GRID_SIZE]               # 此处的grid为列数组
  for y in [0...GRID_SIZE]                    # grid[col][row]
    randomLetter()

printGrid = ->                                # printGrid在终端画出网格grid
  # Transpose the grid so we can draw rows
  rows = for x in [0...GRID_SIZE]             # 将列数组转为行数组 [这里面是不同的行[这里是不同的列]，[这里是不同的列]，[这里是不同的列]，[这里是不同的列]，[这里是不同的列]，[这里是不同的列]]
    for y in [0...GRID_SIZE]                  # rows[row][col]
      grid[y][x]
  rowStrings = (' ' + row.join(' | ') for row in rows)
  rowSeparator = ('-' for i in [1...GRID_SIZE * 4]).join('')
  console.log '\n' + rowStrings.join("\n#{rowSeparator}\n") + '\n'

# Each letter has the same point value as in Scrabble.
tileValues =
  A: 1, B: 3, C: 3, D: 2, E: 1, F: 4, G: 2, H: 4, I: 1, J: 8, K: 5, L: 1
  M: 3, N: 1, O: 1, P: 3, Q: 10, R: 1, S: 1, T: 1, U: 1, V: 4, W: 4, X: 8,
  Y: 4, Z: 10

moveCount = 0     # 游戏步骤记录
score = 0         # 游戏得分
usedWords = []    # 已经出现过的word

scoreMove = (grid, swapCoordinates) ->
  {x1, y1, x2, y2} = swapCoordinates
  words = wordsThroughTile(grid, x1, y1).concat wordsThroughTile(grid, x2, y2)
  moveScore = multiplier = 0                              # 初始化
  newWords = []                                           # 初始化
  for word in words when word not in usedWords and word not in newWords
    multiplier++                                          # new word 的数量
    moveScore += tileValues[letter] for letter in word    # 累加每个word对应的score
    newWords.push word                                    # 更新newWords数组
  usedWords = usedWords.concat newWords                   # 用newWords更新usedWords
  moveScore *= multiplier                                 # 一次坐标字母交换，生成的新字越多，分数变动moveScore的愈多
  {moveScore, newWords}

wordsThroughTile = (grid, x, y) ->                         # 通过特定坐标的words
  strings = []
  for length in [MIN_WORD_LENGTH..GRID_SIZE]              # 确定字符的长度
    range = length - 1                                    # 从起点起，移动的长度
    addTiles = (func) ->
      strings.push (func(i) for i in [0..range]).join ''  # 添加一个字串到strings数组中
    for offset in [0...length]                            # offset坐标某侧移动的距离，字串的起点
      # Vertical                                          # 此处的grid为行数组
      if inRange(x - offset, y) and inRange(x - offset + range, y)   # 特定长度字符的起点与终点有效性检测
        addTiles (i) -> grid[x - offset + i][y]                      # 组合字串
      # Horizontal
      if inRange(x, y - offset) and inRange(x, y - offset + range)
        addTiles (i) -> grid[x][y - offset + i]
      # Diagonal(upper-left to lower-right)
      if inRange(x - offset, y - offset) and inRange(x - offset + range, y - offset + range)
        addTiles (i) -> grid[x - offset + i][y - offset + i]
      # Diagonal (lower-left to upper-right)
      if inRange(x - offset, y + offset) and inRange(x - offset + range, y + offset - range)
        addTiles (i) -> grid[x - offset + i][y + offset - i]
  str for str in strings when isWord str

# CMD-LINE IO
console.log "Welcome to 5x5!"                              # (1)
for x in [0...GRID_SIZE]
  for y in [0...GRID_SIZE]
    scoreMove grid, {x1: x, x2: x, y1: y, y2: y}
unless usedWords.length is 0                               # (2)
  # 输出多行字串，字串定界符 """
  console.log """
    Initially used words:
    #{usedWords.join(', ')}
  """
console.log "Please choose a tile in the form (x, y)."      # (3)

stdin = process.openStdin()
stdin.setEncoding 'utf8'

inputCallback = null
stdin.on 'data', (input) -> inputCallback input              # NOTE: 绑定事件

promptForTile1 = ->
  printGrid()
  console.log "Please enter coordinates for the first tile."  # stdin.on 'data', (input) -> inputCallback input
  inputCallback = (input) ->                                  # 事件处理，输入回调
    try
      {x, y} = strToCoordinates input
      console.log {x, y}
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
      console.log "Swapping (#{x1}, #{y1}) with (#{x2}, #{y2})..."
      x1--; x2--; y1--; y2--; # convert 1-based indices to 0-based
      [grid[x1][y1], grid[x2][y2]] = [grid[x2][y2], grid[x1][y1]]
      {moveScore, newWords} = scoreMove grid, {x1, y1, x2, y2}
      unless moveScore is 0
        console.log """
          You formed the following word(s):
          #{newWords.join(', ')}

        """
        score += moveScore   # 更新分数score
      moveCount++            # 移动的次数，记录游戏的步骤，输入一对坐标(x1,y1),(x2,y2)为移动一次（也可以说调用一次 promptForTile2(x1,y1)
      console.log "Your score after #{moveCount} moves: #{score}"
      promptForTile1()

strToCoordinates = (input) ->   # command-line 输入的都为字串
  halves = input.split(',')     # str：input 转为 array of strings：halves
  if halves.length is 2
    x = parseFloat halves[0]    # str to num
    y = parseFloat halves[1]
    if !isInteger(x) or !isInteger(y)    # 整数判断
      console.log "Each coordinate must be an integer."
    else if not inRange x-1, y-1         # 范围判断：起点（0，0）变为（1，1）
      console.log "Each coordinate must be between 1 and #{GRID_SIZE}"
    else
      {x, y}
  else
    console.log 'Input must be of the form `x, y`.'

promptForTile1()                                          # (4)
