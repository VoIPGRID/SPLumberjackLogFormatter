Pod::Spec.new do |s|

  s.name         = "SPLumberjackLogFormatter"
  s.version      = "0.0.1"
  s.summary      = "A custom iOS Cocoalumberjack log formatter"

  s.homepage     = "https://github.com/VoIPGRID/SPLumberjackLogFormatter"

  s.license      = 'GNU GPL v3'
  s.author       = {"Devhouse Spindle" => "hello@wearespindle.com"}

  s.platform 	 = :ios, "7.0"

  s.source       = { :git => "https://github.com/VoIPGRID/SPLumberjackLogFormatter.git", :tag => "#{s.version}" }

  s.source_files = 'SPLumberjackLogFormatter/PodClasses/*.{h,m}'
  s.requires_arc = true

  s.dependency 'CocoaLumberjack'

end
