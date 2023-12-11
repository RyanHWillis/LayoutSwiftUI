# LayoutSwiftUI

Example app demonstrating the different communication patterns in SwiftUI.

**View Layout Lifecycle**

- Parent Proposes - how much space you can have
- Child Decides - parent much respect this choice
- Parent Places - based on child size info, place in position

---

ContentView is layout neutral, has no size of it's own. is not actually a view.

Other views are always layout neutral.

SwiftUI effectviley works from bottom to top when viewing it's modifiers, for example the below will have different results.

```
Text("Hello, world!")
  .padding(20)
  .background(.red)
  
Text("Hello, world!")
  .background(.red)
  .padding(20)
```
When you listen to Apple’s own SwiftUI engineers talk about modifiers, you’ll hear them refer them to as views – “the frame view”, “the background view”, and so on.

---

SwiftUI gives us two ways of positioning views: absolute positions using position(), and relative positions using offset().



```
VStack {
    Text("Gryffindor")
        .font(.largeTitle)
    Text("Hufflepuff")
    Text("Ravenclaw")
    Text("Slytherin")
}
.font(.title)
```

There, font() is an environment modifier, which means the Gryffindor text view can override it with a custom font.


However, this applies a blur effect to the VStack then attempts to disable blurring on one of the text views:

```
VStack {
    Text("Gryffindor")
        .blur(radius: 0)
    Text("Hufflepuff")
    Text("Ravenclaw")
    Text("Slytherin")
}
.blur(radius: 5)
```

That won’t work the same way: blur() is a regular modifier, so any blurs applied to child views are added to the VStack blur rather than replacing it.

No way of knowing of which, best to read the doc. Obvs being apply one modifiers to many is useful though.



$ means two way read and write binding.
