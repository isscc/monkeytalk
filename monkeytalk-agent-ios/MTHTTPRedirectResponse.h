//
//  MTHTTPRedirectResponse.h
//  iWebDriver
//
//  Copyright 2009 Google Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

#import <Foundation/Foundation.h>
#import "MTHTTPResponse.h"

// This is a response which redirects the user to the specified relative URL.
@interface MTHTTPRedirectResponse : MTHTTPDataResponse {
	NSString *destination;
}

@property (nonatomic, copy) NSString *destination;

- (id)initWithDestination:(NSString *)url;
- (id)initWithDestination:(NSString *)url data:(NSData *)messageData;

+ (MTHTTPRedirectResponse *)redirectToURL:(NSString *)url;

// Expand destination (if needed) to be an absolute URL relative to base
- (void)expandRelativeUrlWithBase:(NSURL *)base;

@end