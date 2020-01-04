source 'https://cdn.cocoapods.org/'

platform :ios, '12.0'

inhibit_all_warnings!
use_frameworks!

workspace 'Paradigms'
project 'Paradigms'

def common_test_pods
  pod 'OHHTTPStubs/Swift'
  pod 'OHHTTPStubs'
end

target 'Paradigms' do

  # Networking
  pod 'Alamofire'
  pod 'AlamofireNetworkActivityIndicator'

  # Crash Reporting
  pod 'Fabric'
  pod 'Crashlytics'

  # Logging
  pod 'CocoaLumberjack/Swift', '= 3.4.2'

  # Core Data
  pod 'DataManager'

  # Analytics
  pod 'MetovaAnalytics'
  pod 'Firebase/Core'
  pod 'Firebase/Messaging'

  # Utility
  pod 'MetovaBase'
  pod 'ThunderCats'
  pod 'PureLayout'
  pod 'Reusable'
  pod 'SwiftGen'
  pod 'SwiftLint'
  pod 'MetovaJSONCodable'
  pod 'MBProgressHUD'

  target 'ParadigmsTests' do
    inherit! :search_paths
    pod 'MetovaTestKit'
    common_test_pods
  end
end
