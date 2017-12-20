//
//  SBTUITestTunnel_Client_Framework.h
//  SBTUITestTunnel_Client_Framework
//
//  Created by Tomas Camin on 18/12/2017.
//

#import <UIKit/UIKit.h>

//! Project version number for SBTUITestTunnel_Client_Framework.
FOUNDATION_EXPORT double SBTUITestTunnel_Client_FrameworkVersionNumber;

//! Project version string for SBTUITestTunnel_Client_Framework.
FOUNDATION_EXPORT const unsigned char SBTUITestTunnel_Client_FrameworkVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SBTUITestTunnel_Client_Framework/PublicHeader.h>

#import "SBTUITunneledApplication.h"
#import "XCTestCase+AppExtension.h"

#import "NSString+SwiftDemangle.h"
#import "NSURLRequest+HTTPBodyFix.h"
#import "NSURLRequest+SBTUITestTunnelMatch.h"
#import "SBTMonitoredNetworkRequest.h"
#import "SBTRequestMatch.h"
#import "SBTStubResponse.h"
#import "SBTSwizzleHelpers.h"
#import "SBTUITestTunnel.h"

