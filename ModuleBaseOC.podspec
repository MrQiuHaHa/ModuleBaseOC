#
# Be sure to run `pod lib lint ModuleBaseOC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ModuleBaseOC'
  s.version          = '0.1.0'
  s.summary          = 'MVVM基类架构，OC版本'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/MrQiuHaHa/ModuleBaseOC'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '邱俊荣' => '2574282239@qq.com' }
  s.source           = { :git => 'https://github.com/MrQiuHaHa/ModuleBaseOC.git', :tag => s.version.to_s }
  
  s.source_files  = 'ModuleBaseOC/Classes/**/*'
  s.resource_bundles = {
    'ModuleBaseOCKit' => ['ModuleBaseOC/Assets/*']
  }
  
  s.ios.deployment_target = '10.0'
  
  s.dependency 'MJRefresh'
  s.dependency 'FDFullscreenPopGesture'
  s.dependency 'Masonry'
  s.dependency 'NSObjectExtend'
  s.dependency 'ReactiveObjC'
  
end
