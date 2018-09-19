Pod::Spec.new do |s|
  s.name             = 'Agglomerate'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Agglomerate.'

  s.homepage         = 'https://github.com/PLJNS/Agglomerate'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'PLJNS' => 'me@pljns.com' }
  s.source           = { :git => 'https://github.com/PLJNS/Agglomerate.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'Agglomerate/Classes/**/*'
  
  s.subspec 'Swift' do |swift|
      swift.source_files = 'Agglomerate/Classes/Swift/**/*'
  end

  s.subspec 'Foundation' do |foundation|
      foundation.source_files = 'Agglomerate/Classes/Foundation/**/*'
  end

  s.subspec 'UIKit' do |uikit|
      uikit.source_files = 'Agglomerate/Classes/UIKit/**/*'
  end
  
  s.subspec 'ViewIdentifiable' do |view_identifiable|
      view_identifiable.source_files = 'Agglomerate/Classes/ViewIdentifiable/**/*'
  end
  
end
