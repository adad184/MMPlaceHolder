Pod::Spec.new do |s|
  s.name         = "MMPlaceHolder"
  s.version      = "1.6"
  s.summary      = "A drop in solution to show UIView's size. Only one line code to use it. "
  s.screenshots  = "https://github.com/adad184/MMPlaceHolder/raw/master/show.png"
  s.homepage     = "https://github.com/adad184/MMPlaceHolder"
  s.license      = { :type => 'MIT License', :file => 'LICENSE' }
  s.author       = { "adad184" => "adad184@gmail.com" }
  s.source       = { :git => "https://github.com/adad184/MMPlaceHolder.git", :tag => "v1.6" }
  s.platform     = :ios, '5.0'
  s.source_files = 'MMPlaceHolder/MMPlaceHolder.{h,m}'
  s.requires_arc = true
end
