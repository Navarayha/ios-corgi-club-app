platform :ios, '13.0'

target 'HomeCoordinatorExampleApp' do
  use_frameworks!

  # add pods for desired Firebase products
  # https://firebase.google.com/docs/ios/setup#available-pods
  pod 'Firebase'

end

target 'LoginUI' do
  use_frameworks!

  # add pods for desired Firebase products
  # https://firebase.google.com/docs/ios/setup#available-pods
  pod 'FirebaseAuth'
  pod 'FirebaseDatabase'

end

target 'CreateUserUI' do
  use_frameworks!

  # add pods for desired Firebase products
  # https://firebase.google.com/docs/ios/setup#available-pods
  pod 'FirebaseAuth'
  pod 'FirebaseDatabase'

end

post_install do |installer|
   installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64 i386"
   end
   end
 end