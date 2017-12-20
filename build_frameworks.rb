#!/usr/bin/ruby

base_path = `git rev-parse --show-toplevel`.strip()

system("rm -rf /tmp/sbtuitesttunnel_build*")

system("cd #{base_path}; xcodebuild -workspace Example/SBTUITestTunnel.xcworkspace -sdk iphoneos -scheme SBTUITestTunnel_Client_Framework -configuration Debug ONLY_ACTIVE_ARCH=NO CONFIGURATION_BUILD_DIR=/tmp/sbtuitesttunnel_build_c_iphoneos &>/dev/null")
system("cd #{base_path}; xcodebuild -workspace Example/SBTUITestTunnel.xcworkspace -sdk iphonesimulator -scheme SBTUITestTunnel_Client_Framework -configuration Debug ONLY_ACTIVE_ARCH=NO CONFIGURATION_BUILD_DIR=/tmp/sbtuitesttunnel_build_c_simulator &>/dev/null")
system("cp -R /tmp/sbtuitesttunnel_build_c_simulator /tmp/sbtuitesttunnel_build_c") # copy modules and headers
system("lipo -create -output /tmp/sbtuitesttunnel_build_c/SBTUITestTunnel_Client_Framework.framework/SBTUITestTunnel /tmp/sbtuitesttunnel_build_c_simulator/SBTUITestTunnel_Client_Framework.framework/SBTUITestTunnel_Client_Framework /tmp/sbtuitesttunnel_build_c_iphoneos/SBTUITestTunnel_Client_Framework.framework/SBTUITestTunnel_Client_Framework")

system("cd #{base_path}; xcodebuild -workspace Example/SBTUITestTunnel.xcworkspace -sdk iphoneos -scheme SBTUITestTunnel_Server_Framework -configuration Debug ONLY_ACTIVE_ARCH=NO CONFIGURATION_BUILD_DIR=/tmp/sbtuitesttunnel_build_s_iphoneos &>/dev/null")
system("cd #{base_path}; xcodebuild -workspace Example/SBTUITestTunnel.xcworkspace -sdk iphonesimulator -scheme SBTUITestTunnel_Server_Framework -configuration Debug ONLY_ACTIVE_ARCH=NO CONFIGURATION_BUILD_DIR=/tmp/sbtuitesttunnel_build_s_simulator &>/dev/null")
system("cp -R /tmp/sbtuitesttunnel_build_s_simulator /tmp/sbtuitesttunnel_build_s") # copy modules and headers
system("lipo -create -output /tmp/sbtuitesttunnel_build_s/SBTUITestTunnel_Server_Framework.framework/SBTUITestTunnel /tmp/sbtuitesttunnel_build_s_simulator/SBTUITestTunnel_Server_Framework.framework/SBTUITestTunnel_Server_Framework /tmp/sbtuitesttunnel_build_s_iphoneos/SBTUITestTunnel_Server_Framework.framework/SBTUITestTunnel_Server_Framework")
system("lipo -create -output /tmp/sbtuitesttunnel_build_s/GCDWebServer.framework/GCDWebServer /tmp/sbtuitesttunnel_build_s_simulator/GCDWebServer.framework/GCDWebServer /tmp/sbtuitesttunnel_build_s_iphoneos/GCDWebServer.framework/GCDWebServer")

system("cp -R /tmp/sbtuitesttunnel_build_s/* #{base_path}/Frameworks")
system("cp -R /tmp/sbtuitesttunnel_build_c/* #{base_path}/Frameworks")