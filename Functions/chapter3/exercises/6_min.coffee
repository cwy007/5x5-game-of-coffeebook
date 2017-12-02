fs = require 'fs'
owl2 = fs.readFileSync 'OWL2.txt', 'utf8'

wordList = owl2.match /^(\w+)/mg
wordList = (word.length for word in wordList)

console.log Math.min.apply Math, wordList
