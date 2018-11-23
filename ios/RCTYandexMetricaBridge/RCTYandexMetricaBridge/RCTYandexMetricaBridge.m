//
//  RCTYandexMetrica.m
//  RCTYandexMetrica
//
//  Created by Dmitry Chernyatiev on 14/12/2017.
//  Copyright © 2017 Dmitry Chernyatiev. All rights reserved.
//

#import "RCTYandexMetricaBridge.h"
#import <React/RCTLog.h>
#import <React/RCTConvert.h>
#import "YandexMobileMetrica.h"

@implementation RCTYandexMetricaBridge {

}

BOOL dryRun = false;
BOOL initialized = false;

RCT_EXPORT_MODULE();
RCT_EXPORT_METHOD(activateWithApiKey:(NSString *)apiKey)
{
  initialized = true;
  if (dryRun) {
    NSLog(@"Dry run mode, skip Yandex Mobile Metrica activation");
    return;
  }
    
YMMYandexMetricaConfiguration *configuration = [[YMMYandexMetricaConfiguration alloc] initWithApiKey:apiKey];
[YMMYandexMetrica activateWithConfiguration:configuration];
}

RCT_EXPORT_METHOD(reportEvent:(NSString *)message)
{
    [YMMYandexMetrica reportEvent:message onFailure:NULL];
}

RCT_EXPORT_METHOD(reportEvent:(NSString *)message parameters:(nullable NSDictionary *)params)
{
    [YMMYandexMetrica reportEvent:message parameters:params onFailure:NULL];
}

RCT_EXPORT_METHOD(reportDeepLink:(NSString *)link)
{
    NSURL *url = [NSURL URLWithString:[link stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    [YMMYandexMetrica handleOpenURL:url];
}

RCT_EXPORT_METHOD(reportReferralUrl:(NSString *)link)
{
    NSURL *url = [NSURL URLWithString:[link stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    [YMMYandexMetrica reportReferralUrl:url];
}

RCT_EXPORT_METHOD(setDryRun:(BOOL *)enabled)
{
  dryRun = enabled;
}

RCT_EXPORT_METHOD(isInitialized:(RCTPromiseResolveBlock)resolve
                  reject:(__unused RCTPromiseRejectBlock)reject)
{
    NSNumber *ret = [NSNumber numberWithBool:initialized];
    resolve(ret);
}

@end
