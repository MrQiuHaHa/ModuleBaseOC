//
//  ModleBaseDefine.h
//  Pods
//
//  Created by 邱俊荣 on 2020/8/10.
//

#ifndef ModleBaseDefine_h
#define ModleBaseDefine_h

#define SCR_WIDTH_BASE        [UIScreen mainScreen].bounds.size.width
#define SCR_HEIGHT_BASE       [UIScreen mainScreen].bounds.size.height

#define IS_IPHONEX_BASE             SCR_HEIGHT_BASE >=  812.0

#define TOP_HEIGHT_BASE          (IS_IPHONEX_BASE ? 88.0 : 64.0)
#define STATUS_BAR_HEIGHT_BASE   (IS_IPHONEX_BASE ? 44.0 : 20.0)
#define BOTTOM_HEIGHT_BASE       (IS_IPHONEX_BASE ? 34.0 : 0)

#endif /* ModleBaseDefine_h */
