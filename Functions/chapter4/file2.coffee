root = global ? window
console.log emergencyNumber
emergencyNumber = 911   # 改变全局变量一定要通过root对象，这样其他模块中对应的项也会改变
console.log emergencyNumber is root.emergencyNumber
