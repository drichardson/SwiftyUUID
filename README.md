# SwiftyUUID
Native Swift UUIDs. Generates [RFC 4122](https://www.ietf.org/rfc/rfc4122.txt) version 4, randomly generated UUIDs.

## Usage

    import SwiftyUUID
    ...
    let uuid = SwiftyUUID.UUID()
    let uuidString = uuid.CanonicalString()
    let uuidBytes = uuid.bytes
    
## CocoaPods Installation

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects.

CocoaPods 0.36 adds supports for Swift and embedded frameworks. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate SwiftyUUID into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
use_frameworks!
pod 'SwiftyUUID', '~> 1.0'
```

Then, run the following command:

```bash
$ pod install
```
