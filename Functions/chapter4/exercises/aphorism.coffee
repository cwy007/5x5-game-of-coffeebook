root = global ? window
root.aphorism = 'Fool me 8 or more times, shame on me'

do restoreOldAphorism = ->
  aphorism = 'Fool me once, shame on you'  # 局部变量
  console.log aphorism
  console.log aphorism

console.log aphorism  # 全局变量
