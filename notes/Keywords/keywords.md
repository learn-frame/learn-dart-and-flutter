# 关键字

|                        |                         |                        |                      |
| ---------------------- | ----------------------- | ---------------------- | -------------------- |
| abstract <sup>2</sup>  | else                    | import <sup>2</sup>    | super                |
| as <sup>2</sup>        | enum                    | in                     | switch               |
| assert                 | export <sup>2</sup>     | interface <sup>2</sup> | sync <sup>1</sup>    |
| async <sup>1</sup>     | extends                 | is                     | this                 |
| await <sup>3</sup>     | extension <sup>2</sup>  | library <sup>2</sup>   | throw                |
| break                  | external <sup>2</sup>   | mixin <sup>2</sup>     | true                 |
| case                   | factory <sup>2</sup>    | new                    | try                  |
| catch                  | false                   | null                   | typedef <sup>2</sup> |
| class                  | final                   | on <sup>1</sup>        | var                  |
| const                  | finally                 | operator <sup>2</sup>  | void                 |
| continue               | for                     | part <sup>2</sup>      | while                |
| covariant <sup>2</sup> | Function <sup>2</sup>   | rethrow                | with                 |
| default                | get <sup>2</sup>        | return                 | yield <sup>3</sup>   |
| deferred <sup>2</sup>  | hide <sup>1</sup>       | set <sup>2</sup>       |
| do                     | if                      | show <sup>1</sup>      |
| dynamic <sup>2</sup>   | implements <sup>2</sup> | static <sup>2</sup>    |

应该避免使用这些单词作为标识符.但是,带有上标的单词可以在必要的情况下作为标识符:

带有上标 1 的关键字为 上下文关键字,只有在特定的场景才有意义,它们可以在任何地方作为有效的标识符.

带有上标 2 的关键字为 内置标识符,其作用只是在 JavaScript 代码转为 Dart 代码时更简单,这些关键字在大多数时候都可以作为有效的标识符,但是它们不能用作类名或者类型名或者作为导入前缀使用.

带有上标 3 的关键字为 Dart1.0 发布后用于支持异步相关的特性新加的.不能在由关键字 async、async\* 或 sync\* 标识的方法体中使用 await 或 yield 作为标识符.

其它没有上标的关键字为保留字,均不能用作标识符.
