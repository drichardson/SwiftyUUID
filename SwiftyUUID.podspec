Pod::Spec.new do |s|
  s.name         = "SwiftyUUID"
  s.version      = "0.0.3"
  s.summary      = "Native Swift UUIDs."
  s.homepage     = "https://github.com/drichardson/SwiftyUUID"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Doug Richardson" => "dougie.richardson@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/drichardson/SwiftyUUID.git", :tag => "0.0.3" }
  s.source_files = "SwiftyUUID"
end
