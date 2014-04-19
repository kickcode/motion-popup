# Drawing code for the popup panel background ported from this excellent Obj-C popup demo code
# https://github.com/shpakovski/Popup / http://blog.shpakovski.com/2011/07/cocoa-popup-window-in-status-bar.html
class Motion::Popup::Background < NSView
  attr_accessor :arrow_height, :arrow_width, :line_thickness, :corner_radius

  def initWithFrame(frame)
    self.arrow_height = 12
    self.arrow_width = 15
    self.line_thickness = 1
    self.corner_radius = 20

    super(frame)
  end

  def drawRect(rect)
    content_rect = NSInsetRect(self.bounds, self.line_thickness, self.line_thickness)
    path = NSBezierPath.bezierPath

    top_left_corner = NSMakePoint(NSMinX(content_rect), NSMaxY(content_rect) - self.arrow_height)

    path.moveToPoint(NSMakePoint(top_left_corner.x + self.corner_radius, top_left_corner.y))

    if @arrow_x
        path.lineToPoint(NSMakePoint(@arrow_x - self.arrow_width / 2, NSMaxY(content_rect) - self.arrow_height))
        path.lineToPoint(NSMakePoint(@arrow_x, NSMaxY(content_rect)))
        path.lineToPoint(NSMakePoint(@arrow_x + self.arrow_width / 2, NSMaxY(content_rect) - self.arrow_height))
    end
    path.lineToPoint(NSMakePoint(NSMaxX(content_rect) - self.corner_radius, NSMaxY(content_rect) - self.arrow_height))

    top_right_corner = NSMakePoint(NSMaxX(content_rect), NSMaxY(content_rect) - self.arrow_height)
    path.curveToPoint(NSMakePoint(NSMaxX(content_rect), NSMaxY(content_rect) - self.arrow_height - self.corner_radius), controlPoint1: top_right_corner, controlPoint2: top_right_corner)

    path.lineToPoint(NSMakePoint(NSMaxX(content_rect), NSMinY(content_rect) + self.corner_radius))

    bottom_right_corner = NSMakePoint(NSMaxX(content_rect), NSMinY(content_rect))
    path.curveToPoint(NSMakePoint(NSMaxX(content_rect) - self.corner_radius, NSMinY(content_rect)), controlPoint1: bottom_right_corner, controlPoint2: bottom_right_corner)

    path.lineToPoint(NSMakePoint(NSMinX(content_rect) + self.corner_radius, NSMinY(content_rect)))

    path.curveToPoint(NSMakePoint(NSMinX(content_rect), NSMinY(content_rect) + self.corner_radius), controlPoint1: content_rect.origin, controlPoint2: content_rect.origin)

    path.lineToPoint(NSMakePoint(NSMinX(content_rect), NSMaxY(content_rect) - self.arrow_height - self.corner_radius))

    
    path.curveToPoint(NSMakePoint(NSMinX(content_rect) + self.corner_radius, NSMaxY(content_rect) - self.arrow_height), controlPoint1: top_left_corner, controlPoint2: top_left_corner)

    
    path.closePath

    NSColor.whiteColor.setFill
    path.fill

    NSGraphicsContext.saveGraphicsState

    clip = NSBezierPath.bezierPathWithRect(self.bounds)
    clip.appendBezierPath(path)
    clip.addClip

    path.setLineWidth(self.line_thickness * 2)
    NSColor.lightGrayColor.setStroke
    path.stroke

    NSGraphicsContext.restoreGraphicsState
  end

  def setArrowX(value)
    @arrow_x = value
    self.setNeedsDisplay(true)
  end
end