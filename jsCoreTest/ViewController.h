//
//  ViewController.h
//  jsCoreTest
//
//  Created by ZHUYN on 2017/10/12.
//  Copyright © 2017年 zynabc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JSObjcDelegate <JSExport>

- (void)callOC:(NSString *)imgPath;
- (void)callJsBack:(NSString *)typeStr;
- (NSMutableDictionary *)getOCImg;

@end

@interface ViewController : UIViewController <JSObjcDelegate>


@end

