//
//  JKHLoginTextField.m
//  Instagram
//
//  Created by Joon Hong on 10/4/16.
//  Copyright © 2016 JoonKiHong. All rights reserved.
//

#import "JKHLoginTextField.h"

@implementation JKHLoginTextField

static const CGFloat textRectPadding = 20.0;
static const CGFloat textFieldFontSize = 14.0;

- (instancetype)initWithType:(JKHLoginTextFieldType)type {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        
        self.layer.cornerRadius = LOGIN_ELEMENT_CORNERRADIUS;
        self.backgroundColor = [UIColor instagramLoginTextFieldBGColor];
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.font = [UIFont systemFontOfSize:textFieldFontSize weight:UIFontWeightMedium];
        self.textColor = [UIColor instagramLoginTextFieldTextColor];
        self.autocorrectionType = UITextAutocorrectionTypeNo;
        self.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;

        if (type == JKHLoginTextFieldTypePassword) {
            
            self.secureTextEntry = YES;
            
        } else if (type == JKHLoginTextFieldTypeEmail) {
            
            self.keyboardType = UIKeyboardTypeEmailAddress;
            
        }
    }
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@50);
    }];
}

- (CGRect)textRectForBounds:(CGRect)bounds{
    return CGRectInset(bounds, textRectPadding, textRectPadding);
}

- (CGRect)editingRectForBounds:(CGRect)bounds{
    return [self textRectForBounds:bounds];
}

- (void) drawPlaceholderInRect:(CGRect)rect {
    NSDictionary *attrDictionary = @{
                                     NSForegroundColorAttributeName: [UIColor instagramLoginTextFieldTextColor],
                                     NSFontAttributeName : [UIFont systemFontOfSize:textFieldFontSize weight:UIFontWeightMedium]
                                     };
    
    [[self placeholder] drawInRect:rect withAttributes:attrDictionary];
}

@end
