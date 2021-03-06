//
//  MTHTTPVirtualDirectory+Remove.m
//  iWebDriver
//
//  Created by Yu Chen on 6/1/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MTHTTPVirtualDirectory+Remove.h"

@implementation MTHTTPVirtualDirectory (Remove)
- (void) removeChildren {  
  // Remove NSMutableDictionary *contents
  NSString* contentName;
  for (contentName in [contents allKeys]) {
    id content = [contents objectForKey:contentName]; 
    [contents removeObjectForKey:contentName];
    NSLog(@"Content '%@' retainCount: %d, before removeChildren", contentName, (int)[content retainCount]);

    if ([content isKindOfClass:[MTHTTPVirtualDirectory class]]) {
      [(MTHTTPVirtualDirectory*)content removeChildren];
    }
    NSLog(@"Content '%@' retainCount: %d, after removeChildren, before release", contentName, (int)[content retainCount]);

    [content release];

  }    
    
  //Remove id<MTHTTPResource> index	
  if ([index isKindOfClass:[MTHTTPVirtualDirectory class]]) {
    [(MTHTTPVirtualDirectory*)index removeChildren];
  } 
  NSLog(@"Index retainCount: %d before release", (int)[index retainCount]);
  [index release];    
}
@end
