

import UIKit

class PageIndicator: UIControl {
  
  var minimumValue: Float = 0
  
  var maximumValue: Float = 1

  
  private (set) var value: Float = 0
  
  var gestureRecognizer = UIGestureRecognizer()
  
  func setValue(_ newValue: CGFloat, animated: Bool = false) {
    value = min(maximumValue, max(minimumValue, Float(newValue)))

    let valueRange = maximumValue - minimumValue
    let finalValue = CGFloat(value - minimumValue) / CGFloat(valueRange)

    renderer.setPointerPosition(finalValue * 235, animated: animated)
  }
  
  var isContinuous = true
    
  var isTouchEnabled = true {
    didSet {
       gestureRecognizer.isEnabled = isTouchEnabled
    }
  }
  
  private let renderer = PageIndicatorRenderer()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit() {
    renderer.updateBounds(bounds)
    renderer.backgroundColour = UIColor.lightGray
    renderer.pointerColor = UIColor.red
    renderer.setPointerPosition(renderer.startPosition, animated: false)
    
    layer.addSublayer(renderer.trackLayer)
    layer.addSublayer(renderer.pointerLayer)
    
    
     gestureRecognizer = TapAndDragGestureRecognizer(target: self, action: #selector(PageIndicator.handleGesture(_:)))
    addGestureRecognizer(gestureRecognizer)
    
    
    
    
    
  }
  
  @objc private func handleGesture(_ gesture: TapAndDragGestureRecognizer) {
        var x = gesture.touchPosition.x
        x -= pointerLength / 2
    
        renderer.setPointerPosition(x, animated: true)
      
        if isContinuous {
          sendActions(for: .valueChanged)
        } else {
          if gesture.state == .ended || gesture.state == .cancelled {
            sendActions(for: .valueChanged)
          }
        }
    
    
  }
    
  var trackColour: UIColor = .blue {
      didSet {
          renderer.backgroundColour = trackColour
      }
  }
  
  var pointerColor: UIColor = .blue {
      didSet {
          renderer.pointerColor = pointerColor
      }
  }


  
  
  var startPosition: CGFloat {
    get { return renderer.startPosition }
    set { renderer.startPosition = newValue }
  }
  
  var pointerLength: CGFloat {
    get { return renderer.pointerLength }
    set { renderer.pointerLength = newValue }
  }
  
}

private class PageIndicatorRenderer {
  
  init() {
    trackLayer.fillColor = UIColor.lightGray.cgColor
    pointerLayer.fillColor = UIColor.gray.cgColor
    trackLayer.strokeColor = UIColor.lightGray.cgColor
    pointerLayer.strokeColor = UIColor.gray.cgColor
    
  }
  
  
  
  var backgroundColour: UIColor = .blue {
    didSet {
      trackLayer.strokeColor = backgroundColour.cgColor
      trackLayer.fillColor =  backgroundColour.cgColor
    }
  }
  
  var pointerColor: UIColor = .blue {
    didSet {
      pointerLayer.strokeColor = pointerColor.cgColor
      pointerLayer.fillColor = pointerColor.cgColor
    }
  }
  
  var startPosition: CGFloat = 0 {
    didSet {
      updatePointerLayerPath()
    }
  }
  
  var start: CGFloat {
    get { return trackLayer.bounds.minX }
  }
  
  var end: CGFloat {
    get { return trackLayer.bounds.maxX }

  }
  
  var pointerLength: CGFloat = 100 {
    didSet {
      updateTrackLayerPath()
      updatePointerLayerPath()
    }
  }
  
  private (set) var pointerPosition: CGFloat = 0
  
  func setPointerPosition(_ newPointerPosition: CGFloat, animated: Bool = false) {
   var new = newPointerPosition
    if !(new  >= trackLayer.bounds.minX) {
      new = 0.0
    }
    if !(new + pointerLength <= trackLayer.bounds.maxX) {
      new = trackLayer.bounds.maxX - pointerLength
    }
    CATransaction.begin()
    CATransaction.setDisableActions(true)
    pointerLayer.transform = CATransform3DMakeTranslation(new, 0, 0)
    CATransaction.commit()
    pointerPosition = newPointerPosition
  }
  
  let trackLayer = CAShapeLayer()
  let pointerLayer = CAShapeLayer()
  
  private func updateTrackLayerPath() {
    let bounds = trackLayer.bounds
    let maskPath = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: [.bottomLeft, .bottomRight, .topLeft, .topRight],
                                cornerRadii: CGSize(width: 3.0, height: 3.0))
    
    trackLayer.path = maskPath.cgPath
  }
  
  private func updatePointerLayerPath() {
    let bounds = trackLayer.bounds
    
    let pointer = UIBezierPath(roundedRect: CGRect(x: startPosition, y: 0, width: pointerLength, height:bounds.height),
                               byRoundingCorners: [.bottomLeft, .bottomRight, .topLeft, .topRight],
                               cornerRadii: CGSize(width: 3.0, height: 3.0))
    
    pointerLayer.path = pointer.cgPath
  }
  
  func updateBounds(_ bounds: CGRect) {
    trackLayer.bounds = bounds
    trackLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
    updateTrackLayerPath()
    
    pointerLayer.bounds = trackLayer.bounds
    pointerLayer.position = trackLayer.position
    updatePointerLayerPath()
  }

  
}


import UIKit.UIGestureRecognizerSubclass

private class TapAndDragGestureRecognizer: UIPanGestureRecognizer {
  private(set) var touchPosition = CGPoint()
  
  override init(target: Any?, action: Selector?) {
    super.init(target: target, action: action)
    
    maximumNumberOfTouches = 1
    minimumNumberOfTouches = 1
  }
  
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
    super.touchesBegan(touches, with: event)
    updateAngle(with: touches)
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
    super.touchesMoved(touches, with: event)
    updateAngle(with: touches)
    
    
  }
  
  private func updateAngle(with touches: Set<UITouch>) {
    guard
      let touch = touches.first,
      let view = view
      else {
        return
    }

    touchPosition = touch.location(in: view)
  }

  
  
}
