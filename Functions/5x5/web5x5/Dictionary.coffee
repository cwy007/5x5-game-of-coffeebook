# 4个实例属性：originalWordList, grid, wordList, minWordLength, usedWords,
# 5个实例方法：setGrid, markUsed, isWord, isNewWord, wordsThroughTile
tileValues =
  A: 1, B: 3, C: 3, D: 2, E: 1, F: 4, G: 2, H: 4, I: 1, J: 8, K: 5, L: 1
  M: 3, N: 1, O: 1, P: 3, Q: 10, R: 1, S: 1, T: 1, U: 1, V: 4, W: 4, X: 8
  Y: 4, Z: 10

class Dictionary
  constructor: (@originalWordList, grid) ->     # 构造函数
    @setGrid grid if grid?

  setGrid: (@grid) ->     # 初始化时用的
    @wordList = @originalWordList.slice(0)                                   # 复制单词列表
    @wordList = (word for word in @wordList when word.length <= @grid.size)  # 过滤单词列表
    @minWordLength = Math.min.apply Math, (w.length for w in @wordList)      # 确定最短的单词长度
    @usedWords = []                                                          # 初始化this.usedWords
    for x in [0...@grid.size]
      for y in [0...@grid.size]
        @markUsed word for word in @wordsThroughTile x, y         # NOTE: 游戏开始，将grid中出现的有效字进行标记

  markUsed: (str) ->                                              # 指明某个单词是否被用过
    if str in @usedWords
      false
    else
      @usedWords.push str
      true

  isWord: (str) -> str in @wordList                                # str 是否合法
  isNewWord: (str) -> str in @wordList and str not in @usedWords   # str 是否可用

  wordsThroughTile: (x, y) ->                                # 通过特定坐标的words
    strings = []
    for length in [@minWordLength..@grid.size]     # 确定字符的长度
      range = length - 1                           # 从起点起，移动的长度
      addTiles = (func) ->
        strings.push (func(i) for i in [0..range]).join ''  # 添加一个字串到strings数组中
      for offset in [0...length]                            # offset坐标某侧移动的距离，字串的起点
        # Vertical                                          # 此处的grid为行数组
        if @grid.inRange(x - offset, y) and @grid.inRange(x - offset + range, y)   # 特定长度字符的起点与终点有效性检测
          addTiles (i) => @grid.tiles[x - offset + i][y]                      # 组合字串
        # Horizontal
        if @grid.inRange(x, y - offset) and @grid.inRange(x, y - offset + range)
          addTiles (i) => @grid.tiles[x][y - offset + i]
        # Diagonal(upper-left to lower-right)
        if @grid.inRange(x - offset, y - offset) and @grid.inRange(x - offset + range, y - offset + range)
          addTiles (i) => @grid.tiles[x - offset + i][y - offset + i]
        # Diagonal (lower-left to upper-right)
        if @grid.inRange(x - offset, y + offset) and @grid.inRange(x - offset + range, y + offset - range)
          addTiles (i) => @grid.tiles[x - offset + i][y + offset - i]
    str for str in strings when @isWord str

  scoreMove: (swapCoordinates) ->
    {x1, x2, y1, y2} = swapCoordinates
    words = @wordsThroughTile(x1, y1).concat @wordsThroughTile(x2, y2)
    moveScore = multiplier = 0
    @newWords = []
    for word in words when word not in @usedWords and word not in @newWords
      multiplier++
      moveScore += tileValues[letter] for letter in word
      @newWords.push word
    @usedWords = @usedWords.concat @newWords
    moveScore *= multiplier
    {moveScore, @newWords}

# 类的全局化
root = exports ? window
root.Dictionary = Dictionary
