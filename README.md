# PerseusKit

Login/Signup view with validation logic for rapid prototyping.

<p float="left">
  <img src="login.png" width="30%" />
  <img src="signup.png" width="30%" />
  <img src="signup2.png" width="30%" />
</p>

## How to install
__Clone the repo:__

```
$ git clone https://
```

__Add to your project's target as local framework__.

## How to use it

```swift
import PerseusKit

@State var isPresented = false

var body: some View {
        VStack { }
         .sheet(isPresented: $isPresented, content: {
        	PerseusLoginView(isPresented: $isPresented)
        })
}

```