//
//  ViewController.m
//  HKRichText
//
//  Created by pyboy on 2017/3/16.
//  Copyright © 2017年 cn.lhangkai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *RichText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 文本插入图片
    [self richTextWithImage];
    // 文本中文字，用不同的方式显示
//    [self richTextWithKindOfTypes];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 文本中插入图片
- (void) richTextWithImage {
    // 获得一个富文本字符串
    NSMutableAttributedString* richString = [[NSMutableAttributedString alloc] initWithString:@"IOS开发中，我们常常会遇到文本和图片在一起展示的需求，这时我们就用到了富文本显示"];
    // 获得一个图片文本对象
    NSTextAttachment* attach = [[NSTextAttachment alloc] init];
    // 设置图片
    attach.image = [UIImage imageNamed:@"star"];
    // 设置图片大小
    attach.bounds = CGRectMake(0, 0, 15, 15);
    // 把图片文本对象转换成富文本对象
    NSAttributedString *picString = [NSAttributedString attributedStringWithAttachment:attach];
    // 把图片添加到富文本字符串里
    // 图片添加在字符串头部
    [richString insertAttributedString:picString atIndex:0];
    // 图片添加在字符串的尾部
    [richString appendAttributedString:picString];
    // 给label设值
    _RichText.attributedText = richString;
    
}

#pragma mark - 文本中文字，用不同的方式显示
// @AttributedString究竟可以设置哪些属性，具体来说，有以下21个：
// NSFontAttributeName                设置字体属性，默认值：字体：Helvetica(Neue) 字号：12
// NSForegroundColorAttributeNam      设置字体颜色，取值为 UIColor对象，默认值为黑色
// NSBackgroundColorAttributeName     设置字体所在区域背景颜色，取值为 UIColor对象，默认值为nil, 透明色
// NSLigatureAttributeName            设置连体属性，取值为NSNumber 对象(整数)，0 表示没有连体字符，1 表示使用默认的连体字符
// NSKernAttributeName                设定字符间距，取值为 NSNumber 对象（整数），正值间距加宽，负值间距变窄
// NSStrikethroughStyleAttributeName  设置删除线，取值为 NSNumber 对象（整数）
// NSStrikethroughColorAttributeName  设置删除线颜色，取值为 UIColor 对象，默认值为黑色
// NSUnderlineStyleAttributeName      设置下划线，取值为 NSNumber 对象（整数），枚举常量 NSUnderlineStyle中的值，与删除线类似
// NSUnderlineColorAttributeName      设置下划线颜色，取值为 UIColor 对象，默认值为黑色
// NSStrokeWidthAttributeName         设置笔画宽度，取值为 NSNumber 对象（整数），负值填充效果，正值中空效果
// NSStrokeColorAttributeName         填充部分颜色，不是字体颜色，取值为 UIColor 对象
// NSShadowAttributeName              设置阴影属性，取值为 NSShadow 对象
// NSTextEffectAttributeName          设置文本特殊效果，取值为 NSString 对象，目前只有图版印刷效果可用：
// NSBaselineOffsetAttributeName      设置基线偏移值，取值为 NSNumber （float）,正值上偏，负值下偏
// NSObliquenessAttributeName         设置字形倾斜度，取值为 NSNumber （float）,正值右倾，负值左倾
// NSExpansionAttributeName           设置文本横向拉伸属性，取值为 NSNumber （float）,正值横向拉伸文本，负值横向压缩文本
// NSWritingDirectionAttributeName    设置文字书写方向，从左向右书写或者从右向左书写
// NSVerticalGlyphFormAttributeName   设置文字排版方向，取值为 NSNumber 对象(整数)，0 表示横排文本，1 表示竖排文本
// NSLinkAttributeName                设置链接属性，点击后调用浏览器打开指定URL地址
// NSAttachmentAttributeName          设置文本附件,取值为NSTextAttachment对象,常用于文字图片混排
// NSParagraphStyleAttributeName      设置文本段落排版格式，取值为 NSParagraphStyle 对象
- (void) richTextWithKindOfTypes {
    // 显示的文本
    NSString* showString = @"IOS开发中，我们也会遇到在一段话中，不同的文字用不同的方式展示，比如：字体、颜色、背景颜色、删除线、红色的删除线、加粗的删除线、下划线、阴影等";
    // 获取一个富文本字符串
    NSMutableAttributedString* richString = [[NSMutableAttributedString alloc] initWithString:showString];
    [richString addAttribute:NSFontAttributeName value:[UIFont fontWithName:[[UIFont fontNamesForFamilyName:[[UIFont familyNames] objectAtIndex:8]] objectAtIndex:0] size:[UIFont systemFontSize]] range:[showString rangeOfString:@"字体"]];
    [richString addAttribute:NSForegroundColorAttributeName value:[UIColor cyanColor] range:[showString rangeOfString:@"颜色"]];
    [richString addAttribute:NSBackgroundColorAttributeName value:[UIColor yellowColor] range:[showString rangeOfString:@"背景颜色"]];
    [richString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:3] range:[showString rangeOfString:@"删除线"]];
    [richString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:2] range:[showString rangeOfString:@"红色的删除线"]];
    [richString addAttribute:NSStrikethroughColorAttributeName value:[UIColor redColor] range:[showString rangeOfString:@"红色的删除线"]];
    [richString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInt:6] range:[showString rangeOfString:@"加粗的删除线"]];
    [richString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleThick] range:[showString rangeOfString:@"下划线"]];
    // 笔画的阴影效果
    NSShadow *shadow = [[NSShadow alloc] init];
    [shadow setShadowColor:[UIColor colorWithRed:0.053 green:0.088 blue:0.205 alpha:1.000]];
    [shadow setShadowBlurRadius:4.0];
    [shadow setShadowOffset:CGSizeMake(2, 2)];
    [richString addAttribute:NSShadowAttributeName value:shadow range:[showString rangeOfString:@"阴影"]];
    //给label设值
    _RichText.attributedText = richString;
}

@end
