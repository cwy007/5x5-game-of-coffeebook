# 在类上进行函数绑定的内容

(window ? global).property = 'global context'
@property = 'surrounding context'
class Foo
  constructor: -> @property = 'instance context'
  bar: => console.log @property   # 实例方法

foo = new Foo
bar = foo.bar
foo.bar()
bar()
