Pod::Spec.new do |s|
  s.name             = 'WZLBadge'
  s.version          = '1.2.6'
  s.summary          = 'An one-line tool to show  styles of badge for UIView'
  s.description      = <<-DESC
                       An easy tool to show different styles of UIView objects without the need for subclassing.
                       DESC
  s.homepage         = 'https://github.com/weng1250/WZLBadge'
  s.license          = { :type => 'None', :file => 'LICENSE' }
  s.author           = { 'Zilin Weng翁子林' => "719113951@qq.com" } 
  s.source           = { :git => 'https://github.com/weng1250/WZLBadge.git', :tag => s.version }
  s.platform         = :ios, '5.0'
  s.requires_arc     = true
	
  s.source_files     = 'WZLBadge/BarItem/*.{h,m}', 'WZLBadge/CategorySupport/*.{h,m}', 'WZLBadge/Protocol/*.{h,m}', 'WZLBadge/View/*.{h,m}', 'WZLBadge/WZLBadgeImport.h' 
  s.public_header_files = 'WZLBadge/**/*.{h}'

  s.frameworks          = 'UIKit'
end
