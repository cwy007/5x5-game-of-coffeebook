javaScript 没有类，只有便于对象间共享方法的原型
一种基于原型的编程语言

通过类组织代码

class

模块之间是如何交互的
模块：解构程序

防止覆盖彼此的变量
拆分一个项目
开源代码 与 自己的代码冲突
命名空间
每个函数都有自己的命名空间，每个在函数中定义的变量，在函数外不可见

CommonJS 标准
把每个文件当作单独的模块来看

全局变量
共享的数据
根对象
浏览器中 根对象为 window，
node 中为 global
属性
全局对象
parseInt
window.parseInt / global.parseInt
window.Math / global.Math
window.String / global.String

root = global ? window

node 还有一个特殊的对象 exports，通常比 global 更常用

类库 RequireJS
环境
模块化代码

global / window 默认情况下到处可用的情况

清晰的引用对象

CommonJS 一组服务器端的js标准

```coffee
root = global ? window
root.httpCodes =
  movedPermanently: 301
  pageNotFound:     404
  serverError       500


httpCodes.pageNotFound
```
模块中的变量

# 原型
原型其实就是一种对象，由原型衍生出来的所有对象都能共享原型的属性。

prototype

new constructor function
sue
:: prototype
@ this

变量声明，作用域的最顶端

对象从原型继承属性

hasOwnProperty
确定一个属性是直接赋值给对象，还是从原型继承来

@name 属性参数的简写法

类定义语法
对象的定义语法

定义类，定义对象，定义原型。
constructor function 唯一不属于原型的类属性

原型
对象
共享功能
继承 extends

原型链
flurb
a = new A
console.log a.flurb

遍历整个原型链
默认对象 {} 的原型

class B extends A
B 的原型就继承自A的原型
A 的类属性复制给了 B

super()
调用父类同名的方法

多态 与 类型转换
class 的一大应用 多态
一个东西可以变成很多不同的东西，但不是任何东西
polymorphic

super(warranty)
super
没有括号也没有参数的super，会传递当前函数的所有参数。

不告诉super传递的参数，会传递所有的参数

鸭子类型：通过行为分类（相同的，类似的方法，属性）
“看到一只鸟，走起来像鸭子，叫起来像鸭子，游起来像鸭子，那么这只鸟就可以被称为鸭子”

switch
分句
打断 break
落空 fallthrough

工厂函数

类，经典的面向对象的设计模式

模块化，可扩展性
输入模块
引入类
