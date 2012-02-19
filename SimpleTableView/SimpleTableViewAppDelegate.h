//
//  SimpleTableViewAppDelegate.h
//  SimpleTableView
//
//  Created by Jeff Lutzenberger on 2/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimpleTableViewViewController;

@interface SimpleTableViewAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SimpleTableViewViewController *viewController;

@end
