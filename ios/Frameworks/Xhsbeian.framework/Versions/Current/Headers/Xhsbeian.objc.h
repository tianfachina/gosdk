// Objective-C API for talking to greeting Go package.
//   gobind -lang=objc greeting
//
// File is generated by gobind. Do not edit.

#ifndef __Xhsbeian_H__
#define __Xhsbeian_H__

@import Foundation;
#include "ref.h"
#include "Universe.objc.h"


@class XhsbeianResponse;

@interface XhsbeianResponse : NSObject <goSeqRefInterface> {
}
@property(strong, readonly) _Nonnull id _ref;

- (nonnull instancetype)initWithRef:(_Nonnull id)ref;
- (nonnull instancetype)init;
@property (nonatomic) BOOL success;
@property (nonatomic) NSString* _Nonnull massage;
@property (nonatomic) NSString* _Nonnull session;
@property (nonatomic) NSString* _Nonnull userId;
@property (nonatomic) NSString* _Nonnull nickname;
@end

@interface Xhsbeian : NSObject
// skipped variable DefaultAvatars with unsupported type: []string

@end

FOUNDATION_EXPORT NSString* _Nonnull XhsbeianLogin(NSString* _Nullable name, NSString* _Nullable department, NSString* _Nullable phone, NSString* _Nullable code);

FOUNDATION_EXPORT BOOL XhsbeianSaveDb(NSString* _Nullable phone, NSString* _Nullable userId, NSString* _Nullable nickname, NSString* _Nullable session, NSError* _Nullable* _Nullable error);

FOUNDATION_EXPORT NSString* _Nonnull XhsbeianSendCode(NSString* _Nullable text);

#endif
