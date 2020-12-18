# 给图片设置圆角的方式

```dart
// 局限是 backgroundImage 只能跟 AssetImage, 不能是 Image.asset 之类的
CircleAvatar(
  backgroundImage: AssetImage('assets/cat.jpg'),
  radius: 50,
)

ClipOval(
  child: Image.asset(
    'assets/cat.jpg',
  ),
)

ClipRRect(
  borderRadius: BorderRadius.circular(50),
  child: Image.asset(
    'assets/cat.jpg',
  ),
)
```

## 附录: 给 Container 设置圆角

```dart
Container(
  width:20,
  height: 20,
  color: Colors.black,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.all(
      const Radius.circular(8),
    ),
  ),
),
```
