Pod::Spec.new do |s|
  s.name             = 'WZLBadge'
  s.version          = '0.1.0'
  s.summary          = 'An easy tool to show different styles of UIView objects.'
  s.description      = <<-DESC
                       An easy tool to show different styles of UIView objects without the need for subclassing.
                       DESC
  s.homepage         = 'https://github.com/weng1250/WZLBadge'
  s.license          = { :type => 'None', :file => 'LICENSE' }
  s.author           = { '' => '' }
  s.source           = { :git => 'https://github.com/weng1250/WZLBadge.git', :tag => s.version }
  s.platform         = :ios, '5.0'
  s.requires_arc     = true
	
  s.source_files     = 'WZLBadge/**/*.{h,m}'
  s.public_header_files = 'WZLBadge/**/*.{h}'

  s.frameworks          = 'UIKit'
end