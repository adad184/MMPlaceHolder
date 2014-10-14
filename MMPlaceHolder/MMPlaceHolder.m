//
//  MMPlaceHolder.m
//  driving
//
//  Created by Ralph Li on 8/11/14.
//  Copyright (c) 2014 LJC. All rights reserved.
//

#import "MMPlaceHolder.h"
#import <objc/runtime.h>
@import QuartzCore;

@interface  MMPlaceHolderConfig()

@end

@implementation MMPlaceHolderConfig


- (id)init
{
    self = [super init];
    
    if (self) {
        
        self.lineColor = [UIColor whiteColor];
        self.backColor = [UIColor clearColor];
        self.arrowSize = 3;
        self.lineWidth = 1;
        self.frameWidth = 0;
        self.frameColor = [UIColor redColor];
        
        self.showArrow = YES;
        self.showText = YES;
        
        self.visible = YES;
        self.autoDisplay = NO;
    }
    
    return self;
}


- (void)setVisible:(BOOL)visible
{
    _visible = visible;
    
    UIResponder<UIApplicationDelegate> *delegate = [UIApplication sharedApplication].delegate;
    
    if ( !visible )
    {
        [delegate.window hidePlaceHolderWithAllSubviews];
    }
    else
    {
        [delegate.window showPlaceHolderWithAllSubviews];
    }
}

+ (MMPlaceHolderConfig *)defaultConfig
{
    static dispatch_once_t  onceQueue;
    static MMPlaceHolderConfig *appInstance;
    
    dispatch_once(&onceQueue, ^{
        appInstance = [[MMPlaceHolderConfig alloc] init];
    });
    return appInstance;
}

@end

@interface MMPlaceHolder()


@end

@implementation MMPlaceHolder

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.backgroundColor = [UIColor clearColor];
        self.contentMode = UIViewContentModeRedraw;
        self.userInteractionEnabled = NO;
        
        self.lineColor  = [MMPlaceHolderConfig defaultConfig].lineColor;
        self.backColor  = [MMPlaceHolderConfig defaultConfig].backColor;
        self.arrowSize  = [MMPlaceHolderConfig defaultConfig].arrowSize;
        self.lineWidth  = [MMPlaceHolderConfig defaultConfig].lineWidth;
        self.frameColor = [MMPlaceHolderConfig defaultConfig].frameColor;
        self.frameWidth = [MMPlaceHolderConfig defaultConfig].frameWidth;
        
        self.showArrow = [MMPlaceHolderConfig defaultConfig].showArrow;
        self.showText = [MMPlaceHolderConfig defaultConfig].showText;
    }
    return self;
}

- (void)setFrameColor:(UIColor *)frameColor
{
    _frameColor = frameColor;
    self.layer.borderColor = frameColor.CGColor;
}

- (void)setFrameWidth:(CGFloat)frameWidth
{
    _frameWidth = frameWidth;
    self.layer.borderWidth = frameWidth;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    CGFloat fontSize = 4 + (MIN(width,height))/10;
    CGFloat arrowSize = self.arrowSize;
    CGFloat lineWidth = self.lineWidth;
    
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    
    //fill the back
	CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, self.backColor.CGColor);
    CGContextFillRect(ctx, rect);
    
    if ( self.showArrow )
    {
        //strike lines & arrows
        CGContextSetLineWidth(ctx, lineWidth);
        CGContextSetStrokeColorWithColor(ctx, self.lineColor.CGColor);
        
        CGContextMoveToPoint(ctx, width/2, 0);
        CGContextAddLineToPoint(ctx, width/2, height);
        CGContextMoveToPoint(ctx, width/2, 0);
        CGContextAddLineToPoint(ctx, width/2-arrowSize, arrowSize);
        CGContextMoveToPoint(ctx, width/2, 0);
        CGContextAddLineToPoint(ctx, width/2+arrowSize, arrowSize);
        CGContextMoveToPoint(ctx, width/2, height);
        CGContextAddLineToPoint(ctx, width/2-arrowSize, height-arrowSize);
        CGContextMoveToPoint(ctx, width/2, height);
        CGContextAddLineToPoint(ctx, width/2+arrowSize, height-arrowSize);
        
        CGContextMoveToPoint(ctx, 0, height/2);
        CGContextAddLineToPoint(ctx, width, height/2);
        CGContextMoveToPoint(ctx, 0, height/2);
        CGContextAddLineToPoint(ctx, arrowSize, height/2-arrowSize);
        CGContextMoveToPoint(ctx, 0, height/2);
        CGContextAddLineToPoint(ctx, arrowSize, height/2+arrowSize);
        CGContextMoveToPoint(ctx, width, height/2);
        CGContextAddLineToPoint(ctx, width-arrowSize, height/2-arrowSize);
        CGContextMoveToPoint(ctx, width, height/2);
        CGContextAddLineToPoint(ctx, width-arrowSize, height/2+arrowSize);
        
        CGContextStrokePath(ctx);
    }
    
    if ( self.showText )
    {
        //calculate the text area
        NSString *strLabel = [NSString stringWithFormat:@"%.0f X %.0f",width, height];
        
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
        const CGSize labelSize = [strLabel sizeWithFont:font forWidth:CGFLOAT_MAX lineBreakMode:NSLineBreakByClipping];
        
        CGFloat rectWidth = roundf(labelSize.width)+4;
        CGFloat rectHeight = roundf(labelSize.height)+4;
        
        //clear the area behind the textz
        CGRect strRect = CGRectMake(width/2-rectWidth/2, height/2-rectHeight/2, rectWidth, rectHeight);
        CGContextClearRect(ctx, strRect);
        CGContextSetFillColorWithColor(ctx, self.backColor.CGColor);
        CGContextFillRect(ctx, strRect);
        
        //draw text
        CGContextSetFillColorWithColor(ctx, self.lineColor.CGColor);
        [strLabel drawInRect:CGRectInset(strRect, 0, 2) withFont:font lineBreakMode:NSLineBreakByTruncatingMiddle alignment:NSTextAlignmentCenter];
#pragma GCC diagnostic warning "-Wdeprecated-declarations"
    }
}


@end


@implementation UIView(MMPlaceHolder)

+ (void)mm_swizzleSelector:(SEL)originalSelector withSelector:(SEL)swizzledSelector {
    
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    
    
    BOOL didAddMethodInit=class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethodInit) {
        class_addMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
#if RELEASE
        
#else
        [self mm_swizzleSelector:@selector(init) withSelector:@selector(init_mm)];
        [self mm_swizzleSelector:@selector(awakeFromNib) withSelector:@selector(awakeFromNib_mm)];
        [self mm_swizzleSelector:@selector(initWithFrame:) withSelector:@selector(initWithFrame_mm:)];
        
#endif
    });
}

- (id)init_mm{
    
    self = [self init_mm];
    [self checkAutoDisplay];
    return self;
}

- (void)awakeFromNib_mm{
    [self checkAutoDisplay];
}

- (id)initWithFrame_mm:(CGRect)frame{
    self = [self initWithFrame_mm:frame];
    [self checkAutoDisplay];
    return self;
}

- (void)checkAutoDisplay
{
    if ( self.class != [MMPlaceHolder class] )
    {
        if ( [MMPlaceHolderConfig defaultConfig].autoDisplay )
        {
            [self showPlaceHolder];
        }
    }
}


- (void)showPlaceHolder
{
    [self showPlaceHolderWithLineColor:[MMPlaceHolderConfig defaultConfig].lineColor];
}

- (void)showPlaceHolderWithAllSubviews
{
    [self showPlaceHolderWithAllSubviews:NSIntegerMax];
}

- (void)showPlaceHolderWithAllSubviews:(NSInteger)maxDepth
{
    if ( maxDepth > 0 )
    {
        for ( UIView *v in self.subviews )
        {
            [v showPlaceHolderWithAllSubviews:maxDepth-1];
        }
    }
    
    [self showPlaceHolder];
}

- (void)showPlaceHolderWithLineColor:(UIColor *)lineColor
{
    [self showPlaceHolderWithLineColor:lineColor backColor:[MMPlaceHolderConfig defaultConfig].backColor];
}

- (void)showPlaceHolderWithLineColor:(UIColor *)lineColor backColor:(UIColor *)backColor
{
    [self showPlaceHolderWithLineColor:lineColor backColor:backColor arrowSize:[MMPlaceHolderConfig defaultConfig].arrowSize];
}


- (void)showPlaceHolderWithLineColor:(UIColor *)lineColor backColor:(UIColor *)backColor arrowSize:(CGFloat)arrowSize
{
    [self showPlaceHolderWithLineColor:lineColor backColor:backColor arrowSize:arrowSize lineWidth:[MMPlaceHolderConfig defaultConfig].lineWidth];
}


- (void)showPlaceHolderWithLineColor:(UIColor *)lineColor backColor:(UIColor *)backColor arrowSize:(CGFloat)arrowSize lineWidth:(CGFloat)lineWidth
{
    
    [self showPlaceHolderWithLineColor:lineColor backColor:backColor arrowSize:arrowSize lineWidth:[MMPlaceHolderConfig defaultConfig].lineWidth frameWidth:[MMPlaceHolderConfig defaultConfig].frameWidth frameColor:[MMPlaceHolderConfig defaultConfig].frameColor];
}

- (void)showPlaceHolderWithLineColor:(UIColor *)lineColor backColor:(UIColor *)backColor arrowSize:(CGFloat)arrowSize lineWidth:(CGFloat)lineWidth frameWidth:(CGFloat)frameWidth frameColor:(UIColor *)frameColor
{
    
#if RELEASE
    
#else
    
    MMPlaceHolder *placeHolder = [self getPlaceHolder];
    
    if ( !placeHolder )
    {
        placeHolder = [[MMPlaceHolder alloc] initWithFrame:self.bounds];
        placeHolder.lineColor  = lineColor;
        placeHolder.backColor  = backColor;
        placeHolder.arrowSize  = arrowSize;
        placeHolder.lineWidth  = lineWidth;
        placeHolder.frameColor = frameColor;
        placeHolder.frameWidth = frameWidth;
        
        placeHolder.tag = [NSStringFromClass([MMPlaceHolder class]) hash]+(NSInteger)self;
        
        [self addSubview:placeHolder];
    }
    
    placeHolder.hidden = ![MMPlaceHolderConfig defaultConfig].visible;
    
    
#endif
}

- (void)hidePlaceHolder
{
    MMPlaceHolder *placeHolder = [self getPlaceHolder];
    
    if ( placeHolder )
    {
        placeHolder.hidden = YES;
    }
}

- (void)hidePlaceHolderWithAllSubviews
{
    for ( UIView *v in self.subviews )
    {
        [v hidePlaceHolderWithAllSubviews];
    }
    
    [self hidePlaceHolder];
}

- (void)removePlaceHolder
{
    MMPlaceHolder *placeHolder = [self getPlaceHolder];
    
    if ( placeHolder )
    {
        [placeHolder removeFromSuperview];
    }
}

- (void)removePlaceHolderWithAllSubviews
{
    for ( UIView *v in self.subviews )
    {
        [v removePlaceHolderWithAllSubviews];
    }
    
    [self removePlaceHolder];
}


- (MMPlaceHolder *)getPlaceHolder
{
    return (MMPlaceHolder*)[self viewWithTag:[NSStringFromClass([MMPlaceHolder class]) hash]+(NSInteger)self];
}

@end
