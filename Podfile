source 'https://cdn.cocoapods.org/'

platform :ios, '12.0'

inhibit_all_warnings!
use_frameworks!

workspace 'Paradigms'
project 'Paradigms'

target 'Paradigms' do

  # Networking
  pod 'Alamofire'
  
  # Util
  pod 'Reusable'

  # Testing
  target 'ParadigmsTests' do
    inherit! :search_paths
    pod 'OHHTTPStubs/Swift'
  end
end
