# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Strike' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Strike
  pod 'RealmSwift'
  pod 'Eureka', '~> 2.0.0-beta.1'

end

target 'Strike-extension' do
  use_frameworks!
  pod 'RealmSwift'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end
