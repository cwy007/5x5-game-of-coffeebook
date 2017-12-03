Netscape
Internet Explorer

写一些函数，以避免写重复的代码
数千行
MooTools
Prototype
Dojo
YUI
jQuery
2006 22olds John Resig

jQuery Mobile Beyond
web application
jQuery 处理网页元素，响应事件

超能力
jQuery 的设计理念：使JavaScript变得更加自然
CoffeeScript

内置对象的原型 String Array

jquery 的超能力被隐藏到一个对象上 $

jQuery对象
过度动画
添加事件回调函数
服务器端提取数据

操作dom
创建，读取，x修改

用自己的对象包装这些元素
通过包装对象，获取更多的便捷功能
跨浏览器一致性

jQuery 对象
选择器 -- 一个传递给jQuery对象的字符串

css 的一个超集
```
ID
#pikachu
$pokeman
格式规范

$pokeman = $('#pikachu')

一个jQuery对象
掌控一个巨大的函数兵工厂

$('p').fadeOut()

匹配对象

getter 类函数
第一个被匹配的对象

sonnet = $('p').html()

setter 类函数
作用于所有匹配的对象
```
jquery object
1. jQuery对象本身
2. 调用jQuery选择器生成的包装着DOM元素的自定义jQuery对象

sonnet = $('p').html()  读取
$('p').html sonnet      赋值

text读取器：过滤所有的html标签，把所有匹配元素的内容连接到一起
$('p').html $('p').html()

优雅已读的代码

$('a, button, .link')

$('a').add($('button')).add($('.link'))

空格连接的选择器
子节点匹配
$('#header img')
$('#header').find('img')

> 直接子节点

$('#header').children('img')
调用链

修饰语
$('tr:odd')

$('li:has(a)')

$(':checked')

选择只会执行一次
live
delegate

$('#header')
$('div:first')
$('div').first()

单个元素
元素的集合

$ function
传递一个string
返回一组元素

获取，更改，添加元素到页面上

事件绑定
$('h1').click ->
  $(this).html $(this).html() + '!'

$(this) 把上下文元素jQuery化

$elem.unbind()

$elem.unbind 'click'

方法返回调用他们的对象

链组
mighty

```CoffeeScript
$('#logo')
  .css(fontSize: 64)
  .hover(-> $(this).css(fontWeight: 'bold'))
  .click(-> alert 'How dare you click the mighty logo!')

$logo = $('#logo')
$logo.css fontSize: 64
$logo.hover -> $logo.css fontWeight: 'bold'
$logo.click -> alert 'How dare you click the mighty logo!'

```

生产部署
CoffeeScript
JavaScript

编译
压缩合并到一个代码包中
