//
//  AppDelegate.m
//  Copyright © 2016 VoIPGRID. All rights reserved.
//

#import "AppDelegate.h"
#import "SPLumberjackLogFormatter.h"

@interface AppDelegate ()

@end

//The default log level for this class
static int ddLogLevel = DDLogLevelVerbose;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //Add the Terminal and TTY(XCode console) loggers to CocoaLumberjack (simulate the default NSLog behaviour)
    SPLumberjackLogFormatter* logFormatter = [[SPLumberjackLogFormatter alloc] init];

    DDASLLogger *aslLogger = [DDASLLogger sharedInstance];
    [aslLogger setLogFormatter: logFormatter];
    DDTTYLogger *ttyLogger = [DDTTYLogger sharedInstance];
    [ttyLogger setLogFormatter:logFormatter];

    [DDLog addLogger:aslLogger];
    [DDLog addLogger:ttyLogger];

    DDLogError(@"This is an ERROR");
    //Gives
    //ERROR   2014/07/30 10:45:41.823 [AppDelegate application:didFinishLaunchingWithOptions:29] This is an ERROR
    //OR with DEBUG defined
    //ERROR   11:09:20.363 [AppDelegate application:didFinishLaunchingWithOptions:29] This is an ERROR

    DDLogWarn(@"This is a WARNING");
    DDLogInfo(@"This is INFO");
    DDLogDebug(@"This is DEBUG");
    DDLogVerbose(@"This is VERBOSE\n");

    [self testFunctionNoArguments];
    [self testFunctionWithArgument:@"Argument not used"];

    return YES;
}

- (void)testFunctionNoArguments {
    DDLogVerbose(@"Log string function no argument");
}

- (void)testFunctionWithArgument:(NSString *)argumentNoUsed {
    DDLogVerbose(@"Log string function with argument, note the \":\" between end of function name and \"]\"");
}

//Functions for changing the default log levels during runtime
#pragma mark -
#pragma mark Lumberjack functions for dynamic logging
+ (int)ddLogLevel {
    return ddLogLevel;
}

+ (void)ddSetLogLevel:(int)logLevel {
    ddLogLevel = logLevel;
}

@end
