变量式函数，定义式函数
具名式，声明式函数

字符串插值 "#{}"

参数列表
类数组 arguments
greeting = -> 'Hello, #{arguments[0]}!'

灵活性 vs 可读性

`coffee -cwo output-dir ./`

缩进
函数块
条件分支

JSON 风格的对象

变量的可见性问题
变量的作用域：变量所处的范围
1. 每个函数都会创建一个作用域，且创建一个作用域的唯一方法就是定义一个函数；
2. 一个变量存在于最外层的作用域中，在该作用域中，该变量会被赋值；
3. 变量在其作用域之外不可见。

词法作用域

js 中：var 关键字，显式地定义变量作用域
coffee script：从赋值语句中推断出作用域

同名覆盖
* 在内部作用域创建同名的变量之后，在外部作用域內创建一个变量
* 使用函数参数
```CoffeeScript
x = 5
triple = (x) -> x *= 3
triple x    # 15
x           # 5
```

作用域并不依赖于在哪里或者如何调用函数

this
@
上下文(接收器)
作用域与标识符指向什么变量有关
newbie
this context
this/@
作用：为对象方法提供一种方法来引用调用它的对象。
对象方法：作为属性附加的函数
{
  setName: [Function: setName],
  name: 'Mittens'
}

call 接收的参数是彼此分开的
apply 接收一个上下文和参数数组
方法
所有的函数都有这两个方法
在特定的上下文context调用函数，而无需把这个函数附加到这个对象上

属性
函数就是对象

改变方法调用的上下文
call/apply “借用” 某个对象的方法并把这些方法用到别的对象上

构造函数（约定：首字母大写）
new: 不要返回函数的执行结果；
     要创建一个新的对象，以该对象为上下文执行该函数，然后返回该对象。
     Dog = setName

原型
全局对象
this 指向全局变量时，再使用它通常不是一件好事
函数不是被当作方法来调用，或者也没有用call/apply和new关键字来调用时，那上下文就是全局对象

上下文：由函数调用的方式所决定

函数定义的位置
作用域
# CoffeeScript 中上下问的规则，前者优先于后者

1. 函数调用之前若有new关键字，则上下文为新建的对象；
2. 使用call或者apply调用函数时，给定的第一个参数即为上下文；
3. 或则，函数作为对象的属性（obj.func) 或者 obj['func'] 来调用时，它就把该对象作为上下文来运行
4. 如果上面几条都不符，则函数在全局上下文中运行。


callback = (message) => @voicemail.push message
$('#clickToHide').click -> $(this).hide()

_this
_func
变量

存在判断运算符
null
undefined

在coffee中 a or b
如果a为真则返回 a
或者返回b

a and b
同真 返回 b
同假 返回 a
一真一假 返回假的

a = a or b
a ?= b

变长参数
arguments

slice
shift

参数列
arg...

无阻塞 IO

input = getInput()

stdin.on 'data', (input) ->

如果在标识符之后留有空格（除非空格之后有后缀操作符），
那么这个标识符就是一个包含隐式括号的函数

foo.bar.baz() 运行时的上下文是foo.bar
@hoo 的上下文是this（也就是@）
@hoo.rah() 的上下文是@hoo

作用域规则
上下文规则
变量
对象

quantum entanglement
