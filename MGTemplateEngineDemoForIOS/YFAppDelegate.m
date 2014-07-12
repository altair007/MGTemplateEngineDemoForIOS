//
//  YFAppDelegate.m
//  MGTemplateEngineDemoForIOS
//
//  Created by 颜风 on 14-7-12.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "YFAppDelegate.h"
#import "ICUTemplateMatcher.h"
#import "YFPerson.h"

@implementation YFAppDelegate
- (void)dealloc
{
    self.window = nil;
    
#if ! __has_feature(fobj_arc)
    [super dealloc];
#endif
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow * window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;
    YFRelease(window);
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    /*原始DEMO代码.*/
    // 用你所选择的匹配器设置模板引擎。
	MGTemplateEngine *engine = [MGTemplateEngine templateEngine];
	[engine setDelegate:self];
	[engine setMatcher:[ICUTemplateMatcher matcherWithTemplateEngine:engine]];
	
	// 设置所需的任何全局变量。
	// 全局变量与模板引擎具有相同的生命周期,即使在处理多个模板时,仍然适用.
	[engine setObject:@"你好!" forKey:@"hello"];
	
	// 获取模板地址.
	NSString *templatePath = [[NSBundle mainBundle] pathForResource:@"sample_template" ofType:@"txt"];

	// 设置用于某个特定模板的变量。
	NSDictionary *variables = [NSDictionary dictionaryWithObjectsAndKeys:
							   [NSArray arrayWithObjects:
								@"周杰伦", @"桂纶镁", @"叶湘伦", @"路小雨", @"Mr.Right.", nil], @"stars",
							   [NSDictionary dictionaryWithObjectsAndKeys:@"颜风", @"name", nil], @"people",
							   nil];

	// 处理模板,并显示结果.
	NSString *result = [engine processTemplateInFileAtPath:templatePath withVariables:variables];

    /* 显示模板内容. */
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 20, 320, 568)];
    textView.backgroundColor = [UIColor orangeColor];
    textView.text = result;
    
    [self.window addSubview: textView];
    YFRelease(textView);
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - MGTemplateEngineDelegate 协议方法.
- (void)templateEngine:(MGTemplateEngine *)engine blockStarted:(NSDictionary *)blockInfo
{
    
}
- (void)templateEngine:(MGTemplateEngine *)engine blockEnded:(NSDictionary *)blockInfo
{
    
}
- (void)templateEngineFinishedProcessingTemplate:(MGTemplateEngine *)engine
{
    
}
- (void)templateEngine:(MGTemplateEngine *)engine encounteredError:(NSError *)error isContinuing:(BOOL)continuing
{
    
}
@end
