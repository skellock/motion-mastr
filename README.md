# motion-mastr

A RubyMotion library for iOS to own NSMutableAttributedString.

MASTR = Mutable Attributed STRing

# Installation

Add this to your Gemfile:

```ruby
gem 'motion-mastr'
```

Then run this to install it:

```
bundle
```

# Requirements

* iOS 7 or higher


# Usage

String -> NSMutableAttributedString
```ruby
"Hi".mastr!
```

Adding a style
```ruby
"Grimmace".mastr! foreground_color: UIColor.purpleColor
```

Many styles, handle it!
```ruby
"Ninja".mastr! foreground_color: UIColor.blackColor, background_color: UIColor.blackColor
```

Make a builder object.
```ruby
MotionMastr::Builder.new "Hi"
```

Adding pieces.
```ruby
MotionMastr::Builder.new.add("hi").add("there").add("!")
```

Building and chaining.
```ruby
"one".mastr.add("plus").add("one").build
```

Default styles get applied to all pieces.
```ruby
blue = UIColor.blueColor
"blue".mastr(foreground_color: blue).add(" blue ").add(" blue ").build
```

Chaining with overrides.
```ruby
red = UIColor.redColor
green = UIColor.greenColor
"red light".mastr(foreground_color:red).add("green light", foreground_color:green).add("red light").add("red light").build
```


