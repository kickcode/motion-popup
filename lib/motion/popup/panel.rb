class Motion::Popup::Panel < NSPanel
  attr_accessor :background

  def initPopup(width, height)
    self.initWithContentRect([[0, 0], [width, height]],
      styleMask: NSBorderlessWindowMask,
      backing: NSBackingStoreBuffered,
      defer: false)
    self.title = NSBundle.mainBundle.infoDictionary['CFBundleName']
    self.delegate = self
    self.setBackgroundColor(NSColor.clearColor)
    self.setOpaque(false)

    self.background = Motion::Popup::Background.alloc.initWithFrame(self.frame)
    self.setContentView(self.background)

    self
  end

  def toggle
    if self.isVisible
      self.orderOut(false)
    else
      event_frame = NSApp.currentEvent.window.frame
      window_frame = self.frame
      window_top_left_position = CGPointMake(event_frame.origin.x + (event_frame.size.width / 2) - (window_frame.size.width / 2), event_frame.origin.y)
      self.setFrameTopLeftPoint(window_top_left_position)

      self.background.setArrowX(window_frame.size.width / 2)

      NSApp.activateIgnoringOtherApps(true)
      self.makeKeyAndOrderFront(self)
    end
  end

  def canBecomeKeyWindow
    true
  end

  def windowDidResignKey(sender)
    self.orderOut(false)
  end
end