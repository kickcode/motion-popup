# motion-popup

Customisable fancy popup windows for your Mac OS X apps

## Requirements

* RubyMotion
* RubyGems

## Setup

Add to your Gemfile:

``` shell
gem 'motion-popup'
```

Or install manually:

* gem install motion-popup

## Usage

You can create a popup window within your app like this:

``` ruby
@window = Motion::Popup::Panel.alloc.initPopup(POPUP_WIDTH, POPUP_HEIGHT)
```

You can customise how the background panel is drawn by setting the following values (the values shown here are the defaults):

``` ruby
@window.background.arrow_height = 12
@window.background.arrow_width = 15
@window.background.line_thickness = 1
@window.background.corner_radius = 20
```

arrow_height and arrow_width refer to the arrow pointer on the top of the panel that'll point to the status bar menu item. line_thickness is the outer border for the panel, and corner_radius affects the drawing of the rounded corners for the panel.

You can then fill the window with additional views using:

``` ruby
@window.contentView.addSubview(my_other_view)
```

Lastly, you can toggle showing the window using:

``` ruby
@window.toggle
```

For example, you can set the window as the delegate for your status menu item, and set the action to toggle so it triggers the window:

``` ruby
@status_item = NSStatusBar.systemStatusBar.statusItemWithLength(NSVariableStatusItemLength).init
@status_item.setTarget(@window)
@status_item.setAction('toggle')
```

This handles updating the windows position to sit under the menu item, with the arrow pointer directly in the middle. The window itself handles hiding itself when it loses focus, and ensuring the toggle then allows it to be reshown when the menu is clicked again.

For a free floating window, you can specify a frame - for example, for a centered popup window, you can call:

```ruby
@window.toggleWithFrame(CGRectMake(0, 0, 0, 0))
@window.center
```

You can also turn off the arrow on the window when you create it, if it's not needed:

```ruby
@window = Motion::Popup::Panel.alloc.initPopup(POPUP_WIDTH, POPUP_HEIGHT)
@window.arrow = false
```

## Contributors

* Elliott Draper

## License

Copyright 2014 Elliott Draper <el@kickcode.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
