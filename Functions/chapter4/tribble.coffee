class Tribble
  constructor: ->  # 构造式
    @isAlive = true       # 实例属性 @
    Tribble.count++       # 修改类属性

  # Prototype properties, 实例方法
  breed: -> new Tribble if @isAlive
  die: ->
    Tribble.count-- if @isAlive
    @isAlive = false

  # Class-level properties， 类属性或方法
  @count: 0
  @makeTrouble: -> console.log ('Trouble!' for i in [0..@count]).join(' ')

tribble1 = new Tribble
tribble2 = new Tribble
Tribble.makeTrouble()

tribble1.die()
Tribble.makeTrouble()

tribble2.breed().breed().breed()
Tribble.makeTrouble()


# 类对象
  # 类属性
# 实例对象
  # 实例属性
# Tribble 对象本身（constructor函数）      new 出一个新实例，类方法，类属性
# Tribble prototype                     定义实例方法
# Tribble 类的实例                       实例，调用实例方法 或 属性
