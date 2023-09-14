//  notnike
//  client.m
//
//  Created by Kjartan Rex on 07/08/2023.
//  Copyright © 2023 Kjartan Rex. All rights reserved.

#import <objc/runtime.h>
#import <CoreFoundation/CoreFoundation.h>
#import <Foundation/Foundation.h>
#import <Foundation/NSUserDefaults+Private.h>
#import <SportsWorkout/SWSyncHost.h>

static NSString* nsDomainString = @"com.kjarex.notnike";

id stswsh(NSString* url){
  NSArray* parts= [url componentsSeparatedByString: @"://"];
  NSString* host= [parts objectAtIndex: 1];
  BOOL secure= [[parts objectAtIndex: 0] isEqualToString: @"https"];
  return [[SWSyncHost alloc] initWithHostName: host secure: secure];}

static id new_SWSyncHost_productionSyncHost(Class self, SEL _cmd){
  return stswsh([[NSUserDefaults standardUserDefaults] objectForKey: @"syncHost" inDomain: nsDomainString]);}

static id new_SWSyncHost_productionLandingPageHost(Class self, SEL _cmd){
  return stswsh([[NSUserDefaults standardUserDefaults] objectForKey: @"landingPageHost" inDomain: nsDomainString]);}

static __attribute__((constructor)) void _logosLocalInit() {
  SEL selector= @selector(productionLandingPageHost);
  Method method= class_getClassMethod(objc_getMetaClass("SWSyncHost"), selector);
  const char* encoding= method_getTypeEncoding(method);
  class_replaceMethod(objc_getMetaClass("SWSyncHost"), selector, (IMP)new_SWSyncHost_productionLandingPageHost, encoding);

  selector= @selector(productionSyncHost);
  method= class_getClassMethod(objc_getMetaClass("SWSyncHost"), selector);
  encoding= method_getTypeEncoding(method);
  class_replaceMethod(objc_getMetaClass("SWSyncHost"), selector, (IMP)new_SWSyncHost_productionSyncHost, encoding);}
