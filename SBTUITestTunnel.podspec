Pod::Spec.new do |s|
s.name             = "SBTUITestTunnel"
s.version          = "2.2.7"
s.summary          = "Enable network mocks and more in UI Tests"

s.description      = <<-DESC
Use this library to easily setup an HTTP tunnel between our UI Tests cases and the app under test.
The tunnel allows to inject data in order to enabale network mocking.
DESC

s.homepage         = "https://github.com/Subito-it/SBTUITestTunnel"
s.license          = 'Apache License, Version 2.0'
s.author           = { "Tomas Camin" => "tomas.camin@scmitaly.it" }
s.source           = { :git => "https://github.com/Subito-it/SBTUITestTunnel.git", :tag => s.version.to_s }

s.platform     = :ios, '9.0'
s.requires_arc = true

s.frameworks = 'UIKit'

s.subspec 'Server' do |server|
    server.source_files = 'Pod/Server/*.{h,m}', 'Pod/Common/*.{h,m}'
    server.dependency 'GCDWebServer', '~> 3.0'
end

s.subspec 'Client' do |client|
    client.frameworks = 'XCTest'
    client.source_files = 'Pod/Client/*.{h,m}', 'Pod/Common/*.{h,m}'
end

s.subspec 'Server_Framework' do |server|
    client.vendored_frameworks = ''
end
    
s.subspec 'Client_Framework' do |client|
    client.frameworks = 'XCTest'
    client.vendored_frameworks = ''
end

end
