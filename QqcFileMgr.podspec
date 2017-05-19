Pod::Spec.new do |s|

  s.license      = "MIT"
  s.author       = { "qqc" => "20599378@qq.com" }
  s.platform     = :ios, "8.0"
  s.requires_arc  = true

  s.name         = "QqcFileMgr"
  s.version      = "1.0.44"
  s.summary      = "QqcFileMgr"
  s.homepage     = "https://github.com/xukiki/QqcFileMgr"
  s.source       = { :git => "https://github.com/xukiki/QqcFileMgr.git", :tag => "#{s.version}" }
  
  s.source_files  = ["QqcFileMgr/*.{h,m}"]
  s.dependency  = "QqcSingletonTemplate"

end
