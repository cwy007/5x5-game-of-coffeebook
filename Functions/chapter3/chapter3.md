list comprehension
字面量 {}

[]
{}
JSON is a subset of javascript.
all functions are objects in js.
function(){}

string, integer, number
basic class is not object in javascript

点标记法  .
方括号   []
对象属性
obj.x
[]
转化为字符串

```coffee
symbols['+']
father = {
  name: 'John',
  daughter: {
    name: 'Jill'
  },
  son: {
    name: 'Jack'
  }
}

symbols = {
  '+': 'plus',
  '-': 'minus'
}

javascript object

father =
  name: 'John'
  daughter:
    name: 'Jill'
  son:
    name: 'Jack'

fellowship = wizard: 'Gandalf', hobbits: ['Frodo', 'Pippin', 'Sam']
```

函数接收 hash配置 作为最后一个参数时

drawSprite x, y, invert: true

吸收操作符 a?.b

a = b ? c
a = b?.property ? c

cats?['Garfield']?.eat?() if lasagna?

有序
[]
object
Array 原型

```coffee
mcFlys = ['George', 'Lorraine', 'Marty']

mcFlys = new Array()
mcFlys[0] = 'George'
mcFlys[1] = 'Lorraine'
mcFlys[2] = 'Marty'

```

prototype.js
flatten
each

对象迭代格式
数组迭代格式
枚举

for key, value of object
  # do things with key and value

value = object[key]

对象自身的属性
object.hasOwnProperty(key)

从原型继承过来的属性
与同类共享的属性

```CoffeeScript
for own sword of Kahless

for sword of Kahless
  continue unless Kahless.hasOwnProperty(sword)

for value in array
  # do something with the value

for key, func of obj when typeof func is 'function'
  func()

bid

highestBid = 0
for bid of entries when bid > highestBid
  highestBid = bid

单行代码
语法糖

for name, occupation of murderMysteryCharacters
  break if occupation is 'butler'
console.log "#{name} did it!"

countdown = [10..0]
for num in countdown
  break if abortLaunch()
if num is 0
  console.log 'We have liftoff!'
else
  console.log "Launch aborted with #{num} seconds left"
```

key of object
x in arr

arguments
jQuery

```CoffeeScript
makeHay() while sunShines()
makeHay() until sunSets()

until
while not

unless
if not

工具函数
```
while true
break
return

```coffee
loop
  console.log 'Home'
  break if @flag is true
  console.log 'Sweet'
  @flag = true

后缀修饰从句
缩进形式

a = 0
loop break if ++a > 999
console.log a      # 1000

skill
while until loop for

```

列表的值究竟是什么？
Scheme
Hashell
OCaml
循环，
映射，归纳，精简

类库
Underscore.js

list comprehension / array comprehension

```javascript

positiveNumbers = [1, 2, 3, 4];
negativeNumbers = [];
for (i = 0; i < positiveNumbers.length; i++) {
  negativeNumbers.push(-positiveNumbers[i]);
}

negativeNumbers = (-num for num in [1, 2, 3, 4])

keysPressed = (char while char = handleKeyPress())
```

# CoffeeScript de 核心设计哲学：
coffeescript 中的所有东西都是表达式，并且每个表达式有一个值。

模式匹配
结构赋值

数组模式匹配
```coffee
[firstName, middleInitial, lastName] = ['Joe', 'T', 'Plumber']

myRect =
  x: 100
  y: 200
{x: myX, y: myY} = myRect
```

Node assert module
assert.ok
assert.strictEqual

{ok, strictEqual} = require 'assert'

解构赋值

arr.slice[0..]
当有人传给你一个数组，而你希望对其进行修改以满足自己的需要时，使用数组的副本通常是一个得体的做法。

hash 解构的特点：假如已知键名的话，就能快速地取到对应的值。
如果要频繁地检测一个hash中是否有对应的值的话，应当使用其他类型的数据结构。

```javascript
do {
  user.harangue()
} while (!user.paidInFull)

// coffee version
user.harangue()
user.harangue() until user.paidInFull

doAndRepeatUntil = (func, condition) ->
  func.call this
  func.call this until condition()

doAndRepeatUntil user.harangue, -> user.paidInFull
```
