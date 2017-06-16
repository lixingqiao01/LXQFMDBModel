Pod::Spec.new do |s|
  s.name         = "LXQFMDBModel"
  s.version      = "0.0.1"
  s.summary      = "操作简单,扩展性强,直接操作model"
  s.homepage     = "https://github.com/lixingqiao01/LXQFMDBModel"
  s.license      = "MIT"
  s.author       = { "XingQiao Li" => "lixingqiao01@163.com" }
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/lixingqiao01/LXQFMDBModel.git", :tag => s.version }
  s.source_files = "FMDBModel/FMDBModel/*.{h,m}"
  s.requires_arc = true
end
