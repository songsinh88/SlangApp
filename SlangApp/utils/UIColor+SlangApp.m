//
//  UIColor+SlangApp.m
//  SlangApp
//
//  Created by Victor Barrera on 3/8/15.
//  Copyright (c) 2015 Victor Barrera. All rights reserved.
//

#import "UIColor+SlangApp.h"

@implementation UIColor (SlangApp)

+ (UIColor*)slangGreen {
    return [UIColor colorWithRed:36.0/255.0 green:201.0/255.0 blue:165.0/255.0 alpha:1.0];
}

+ (UIColor*)slangGrey {
    return [UIColor colorWithWhite:184.0/255.0 alpha:1.0];
}

+ (UIColor*)slangLightGrey {
    return [UIColor colorWithWhite:236.0/255.0 alpha:1.0];
}

+ (UIColor*)slangBlack {
    return [UIColor colorWithRed:45.0/255.0 green:44.0/255.0 blue:44.0/255.0 alpha:1.0];
}

@end
