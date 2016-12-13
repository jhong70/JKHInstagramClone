//
//  JKHLoginTextField.h
//  Instagram
//
//  Created by Joon Hong on 10/4/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKHLoginTextField : UITextField

typedef enum {
    JKHLoginTextFieldTypeDefault,
    JKHLoginTextFieldTypeEmail,
    JKHLoginTextFieldTypePassword
} JKHLoginTextFieldType;

- (instancetype)initWithType:(JKHLoginTextFieldType)type;

@end
