Pod::Spec.new do |s|
  s.name         = "SwiftyUUID"
  s.version      = "1.1.0"
  s.summary      = "Native Swift UUIDs."
  s.homepage     = "https://github.com/drichardson/SwiftyUUID"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Doug Richardson" => "dougie.richardson@gmail.com" }
  s.source       = { :git => "https://github.com/drichardson/SwiftyUUID.git", :tag => s.version }
  s.source_files = "SwiftyUUID"

  s.platform     = :ios, "8.0"
end
