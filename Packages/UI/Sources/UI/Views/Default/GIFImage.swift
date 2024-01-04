//
//  GIFImage~iOS~tvOS.swift
//
//  Code originally found from https://github.com/globulus/swiftui-gif
//

import SwiftUI

#if os(iOS) || os(tvOS)
// MARK: - GIF Image
struct GIFImage: UIViewRepresentable {
    // MARK: Constants
    private enum Constants {
        fileprivate static let gifExtension = "gif"
    }
    
    // MARK: Internal Properties
    private var data: Data? {
        guard let gifURL = Bundle.module.url(
            forResource: name, 
            withExtension: Constants.gifExtension
        ) else {
            return nil
        }
        return try? Data(contentsOf: gifURL)
    }
    
    // MARK: Exposed Properties
    let name: String
    
    // MARK: UIView Methods
    func makeUIView(context: Context) -> UIGIFImage {
        guard let data else {
            return .init()
        }
        return .init(data: data)
    }
    
    func updateUIView(_ uiView: UIGIFImage, context: Context) {
        guard let data else {
            return
        }
        uiView.updateGIF(data: data)
    }
}

// MARK: - Internal UI GIF Image
class UIGIFImage: UIView {
    // MARK: Properties
    private let imageView = UIImageView()
    private var data: Data?
    private var name: String?
    
    // MARK: Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(name: String) {
        self.init()
        self.name = name
        initView()
    }
    
    convenience init(data: Data) {
        self.init()
        self.data = data
        initView()
    }
    
    // MARK: Lifecycle & View Methods
    public override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        addSubview(imageView)
    }
    
    func updateGIF(data: Data) {
        updateWithImage {
            UIImage.gifImage(data: data)
        }
    }

    // MARK: Internal Methods
    private func updateWithImage(_ getImage: @escaping () -> UIImage?) {
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            guard let self else { return }
            let image = getImage()
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    
    private func initView() {
        imageView.contentMode = .scaleAspectFit
    }
}

// MARK: - UIImage Extension
fileprivate extension UIImage {
    // MARK: Class Methods
    class func gifImage(data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            return nil
        }
        let count = CGImageSourceGetCount(source)
        let delays = (0..<count).map {
            Int(delayForImage(at: $0, source: source) * 1000)
        }
        let duration = delays.reduce(0, +)
        let gcd = delays.reduce(0, gcd)
        var frames = [UIImage]()
        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                let frame = UIImage(cgImage: cgImage)
                let frameCount = delays[i] / gcd
                for _ in 0..<frameCount {
                    frames.append(frame)
                }
            } else {
                return nil
            }
        }
        return UIImage.animatedImage(
            with: frames,
            duration: Double(duration) / 1000.0
        )
    }
}

fileprivate func gcd(_ a: Int, _ b: Int) -> Int {
    let absB = abs(b)
    let r = abs(a) % absB
    if r != 0 {
        return gcd(absB, r)
    } else {
        return absB
    }
}

fileprivate func delayForImage(at index: Int, source: CGImageSource) -> Double {
    let defaultDelay = 1.0
    let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
    let gifPropertiesPointer = UnsafeMutablePointer<UnsafeRawPointer?>.allocate(capacity: 0)
    defer {
        gifPropertiesPointer.deallocate()
    }
    let unsafePointer = Unmanaged.passUnretained(kCGImagePropertyGIFDictionary).toOpaque()
    if CFDictionaryGetValueIfPresent(cfProperties, unsafePointer, gifPropertiesPointer) == false {
        return defaultDelay
    }
    let gifProperties = unsafeBitCast(gifPropertiesPointer.pointee, to: CFDictionary.self)
    var delayWrapper = unsafeBitCast(
        CFDictionaryGetValue(
            gifProperties,
            Unmanaged.passUnretained(kCGImagePropertyGIFUnclampedDelayTime).toOpaque()
        ),
        to: AnyObject.self
    )
    if delayWrapper.doubleValue == 0 {
        delayWrapper = unsafeBitCast(
            CFDictionaryGetValue(
                gifProperties,
                Unmanaged.passUnretained(kCGImagePropertyGIFDelayTime).toOpaque()
            ),
            to: AnyObject.self
        )
    }
    if let delay = delayWrapper as? Double, delay > 0 {
        return delay
    } else {
        return defaultDelay
    }
}

#elseif os(macOS)

// MARK: - GIF Image
struct GIFImage: NSViewRepresentable {
    // MARK: Constants
    private enum Constants {
        fileprivate static let gifExtension = "gif"
    }
    
    // MARK: Exposed Properties
    let name: String
    let macOSSize: CGSize
    
    // MARK: Init Methods
    init(name: String, macOSSize: CGSize = .zero) {
        self.name = name
        self.macOSSize = macOSSize
    }
    
    // MARK: Internal Properties
    private var data: Data? {
        guard let gifURL = Bundle.module.url(
            forResource: name,
            withExtension: Constants.gifExtension
        ) else {
            return nil
        }
        return try? Data(contentsOf: gifURL)
    }
    
    // MARK: UIView Methods
    func makeNSView(context: Context) -> NSView {
        let containerView = NSView(
            frame: NSRect(
                origin: .zero,
                size: macOSSize
            )
        )
        let nsImageView = NSImageView()
        guard let data else {
            return containerView
        }
        nsImageView.canDrawSubviewsIntoLayer = true
        nsImageView.imageScaling = .scaleProportionallyDown
        nsImageView.animates = true
        nsImageView.image = NSImage(data: data)
        nsImageView.setFrameSize(macOSSize)
        containerView.addSubview(nsImageView)
        return containerView
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {}
}
#endif
