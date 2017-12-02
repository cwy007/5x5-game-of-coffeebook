class Pet
  constructor: -> @isHungry = true  # new 时用
  eat: -> @isHungry = false         # Pet::eat.call

class Dog extends Pet               # 狗Dog继承了Pet的构造函数，意味着狗dog开始饿了
  eat: ->
    console.log '*crunch, crunch*'  # dog make some sound
    super()                         # Pet::eat.call this
  fetch: ->
    console.log 'Yip yip!'
    @isHungry = true

pet = new Pet
console.log pet.isHungry    #=> true
pet.eat()
console.log pet.isHungry    #=> false

dog = new Dog
console.log dog.isHungry    #=> true
dog.eat()                   #=> '*crunch crunch*'
console.log dog.isHungry    #=> false
dog.fetch()                 #=> 'Yip yip'
console.log dog.isHungry    #=> true


# 类class 就是 原型
# OOP object-oriented programming

class Appliance
  constructor: (warranty) ->
    warrantyDb.save(this) if warranty

class Toaster extends Appliance
  constructor: (warranty) ->
    super()
