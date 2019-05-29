Pod::Spec.new do |extension|

  extension.name          = 'RKOSimpleExample.swift'

  extension.version       = '1.0.0'

  extension.summary       = 'A Simple Example'

  extension.description   = 'A simple example to reproduce the CocoaPods generate_multiple_pod_projects bug'

  extension.homepage      = 'https://github.com/rakuyoMo/SimpleExample/tree/master'

  extension.license       = 'MIT'

  extension.author        = { 'Rakuyo' => 'rakuyo.mo@gmail.com' }

  extension.source        = { :git => 'https://github.com/rakuyoMo/SimpleExample.git', :tag => extension.version.to_s }

  extension.requires_arc  = true
  
  extension.platform      = :ios, '10.0'
  
  extension.swift_version = '5.0'
  
  extension.static_framework = true
  
  extension.module_name   = 'RKOSimpleExample'

  extension.default_subspecs = 'Extendable', 'Extension'
  
  extension.subspec 'Extendable' do |extendable|
      extendable.source_files = 'SimpleExample/SimpleExample/Core/Extendable/'
  end
  
  extension.subspec 'Extension' do |extension|
      
      extension.source_files = 'SimpleExample/SimpleExample/Core/Object/', 'SimpleExample/SimpleExample/Core/UI/'
      
      extension.dependency 'RKOSimpleExample.swift/Extendable'
      
      extension.dependency 'RxCocoa'
  end
  
  extension.subspec 'YYText' do |text|
      
      text.source_files = 'SimpleExample/SimpleExample/Core/YYText/*.swift'
      
      text.dependency 'RKOSimpleExample.swift/Extension'
      
      text.dependency 'YYText'
  end

end
