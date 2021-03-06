# motion-mastr
[![Gem Version](https://img.shields.io/gem/v/motion-mastr.svg?style=flat)](https://rubygems.org/gems/motion-mastr)
[![Build Status](https://img.shields.io/travis/skellock/motion-mastr.svg?style=flat)](https://travis-ci.org/skellock/motion-mastr)

A RubyMotion library for iOS 7+ to own NSMutableAttributedString.

MASTR = Mutable Attributed STRing

<img src="./_pics/mastr.gif" alt="Demo" />


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

```ruby
include MotionMastr
```

This is a MastrBuilder.
```ruby
mastr # => MastrBuilder
```

You'll use this to build your `NSMutableAttributeString`s.
```ruby
mastr.build # => NSMutableAttributeString
```

Feed it a string.
```ruby
mastr("hello").build
```

Feed it styles too.
```ruby
mastr("Grimace", foreground_color: UIColor.purpleColor).build
```

Keep adding pieces until you get what you want.
```ruby
mastr.add("hi").add("there").add("!").build
```

Styles inside mastr() are default styles.
```ruby
blue = UIColor.blueColor
mastr("blue", foreground_color: blue).add(" blue ").add(" blue ").build
```

Override defaults while adding pieces.
```ruby
red = UIColor.redColor
green = UIColor.greenColor
mastr("red light", foreground_color:red)
  .add("green light", foreground_color:green)
  .add("red light")
  .add("red light")
  .build
```

# Supported Styles

```ruby
alignment                  # :left, :right, :center
attachment                 # NSTextAttachment
background_color           # UIColor
base_writing_direction     # :natural, :left_to_right, :right_to_left
baseline_offset            # :default or Float
default_tab_interval       # :default or 0.0 and up
expansion                  # :default or Float
first_line_head_indent     # 0.0 and up
font                       # UIFont
foreground_color           # UIColor
  color                    # ^
head_indent                # 0.0 and up
hyphenation_factor         # 0.0 up to 1.0
kern                       # :default, Float
  kerning                  # ^
ligature                   # :off, :on
line_break_mode            # :word, :char, :clip, :head, :tail, :middle
line_height_multiple       # :default, 0.0 and up
line_spacing               # 0.0 and up
link                       # NSURL or NSString
maximum_line_height        # :off, 0.0 and up
minimum_line_height        # :off, 0.0 and up
obliqueness                # :default, Float
paragraph_spacing          # :default, 0.0 and up
paragraph_spacing_before   # :default, 0.0 and up
shadow_blur_radius         # 0.0 and up
shadow_color               # UIColor
shadow_offset              # CGSize, [Float, Float], Float
strikethrough_color        # UIColor
strikethrough_style        # :style_none, :style_single, :style_thick, :style_double or an array including those + [:pattern_solid :pattern_dot :pattern_dash :pattern_dash_dot :pattern_dash_dot_dot :by_word]
stroke_color               # UIColor
stroke_width               # :default, Float
tail_indent                # 0.0 and up
text_effect                # :letterpress
underline_color            # UIColor
underline_style            # :style_none, :style_single, :style_thick, :style_double or an array including those + [:pattern_solid :pattern_dot :pattern_dash :pattern_dash_dot :pattern_dash_dot_dot :by_word]
```

For details, check out the NSAttributedString docs.  Or just play around.

# Wierd Things

* Setting text_effect makes the CPU work hard, not sure why yet.
* Shadow properties aren't working when assigning to a UILabel, not sure why yet.
* Go easy on obliqueness, don't get hurt.


# HISTORY

### 0.3.0 | May 3rd, 2015
* [new] mastr now optional supports being called with _just_ a Hash of styles
* [new] the style :color is now alias for :foreground_color

### 0.2.0 | May 2nd, 2015
* [feature] first release



