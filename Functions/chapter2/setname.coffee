# name 是一个局部变量，在函数之外无法访问
# @name 是上下文的一个属性
setName = (name) -> @name = name

cat = {}
cat.setName = setName   # 作为属性附加的函数
cat.setName 'Mittens'   # 调用函数 setName，作用：给对象cat的属性name赋值
console.log cat.name
console.log cat
console.log setName 'Mr. Mistoffelees'
console.log cat.name

pig = {}
setName.apply pig, ['Babe']
console.log pig.name

monkey = {}
setName.call monkey, 'King of monkey'
console.log monkey.name

horse = {}
cat.setName.apply horse, ['Mr. Ed']
console.log horse.name

Dog = setName
dog1 = new Dog('Jimmy')
dog2 = new Dog('Jake')
console.log dog1.name
console.log dog2.name

setName 'Lulu'
console.log name
console.log @name 
