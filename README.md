MMPlaceHolder
=============

A drop in solution to set a placeholder or show UIView's size

[中文介绍](http://adad184.com/2014/08/21/2014-08-21-kai-yuan-xiang-mu-mmplaceholder/)

![demo](https://github.com/adad184/MMPlaceHolder/blob/master/demo.png?raw=true)

or you can use it to show the system view's default values

![show](https://github.com/adad184/MMPlaceHolder/blob/master/show.png?raw=true)

Usage
===============

simply, you only need one line code.
    
    [yourView showPlaceHolder];


or you can customize youself.

	@interface  UIView(MMPlaceHolder)

	- (void)showPlaceHolder;
	- (void)showPlaceHolderWithAllSubviews;
	- (void)showPlaceHolderWithAllSubviews:(NSInteger)maxDepth;
	- (void)showPlaceHolderWithLineColor:(UIColor*)lineColor;
	- (void)showPlaceHolderWithLineColor:(UIColor*)lineColor backColor:(UIColor*)backColor;
	- (void)showPlaceHolderWithLineColor:(UIColor*)lineColor backColor:(UIColor*)backColor arrowSize:(CGFloat)arrowSize;
	- (void)showPlaceHolderWithLineColor:(UIColor*)lineColor backColor:(UIColor*)backColor arrowSize:(CGFloat)arrowSize lineWidth:(CGFloat)lineWidth;

	- (void)hidePlaceHolder;
	- (void)hidePlaceHolderWithAllSubviews;
	- 
	- (MMPlaceHolder *)getPlaceHolder;

	@end
	
	
and you can use the global configuration

	@interface MMPlaceHolderConfig : NSObject

	+ (MMPlaceHolderConfig*) defaultConfig;

	@property (nonatomic, strong) UIColor *lineColor;
	@property (nonatomic, strong) UIColor *backColor;
	@property (nonatomic, assign) CGFloat arrowSize;
	@property (nonatomic, assign) CGFloat lineWidth;
	
    @property (nonatomic, assign) BOOL visible;

	@end


Changelog
===============

v1.4  add a demo project & now you can config the global visability by

    [MMPlaceHolderConfig defaultConfig].visible = NO;
    

v1.3  now you can add placeholders recursively by

    - (void)showPlaceHolderWithAllSubviews;
    - (void)showPlaceHolderWithAllSubviews:(NSInteger)maxDepth;
    - (void)hidePlaceHolderWithAllSubviews;


v1.2  now you can change default configuration by `[MMPlaceHolderConfig defaultConfig]`

    [MMPlaceHolderConfig defaultConfig].lineColor = [UIColor whiteColor];
    [MMPlaceHolderConfig defaultConfig].backColor = [UIColor clearColor];
    [MMPlaceHolderConfig defaultConfig].arrowSize = 3;
    [MMPlaceHolderConfig defaultConfig].lineWidth = 1;


v1.1  now you can get or remove `MMPlaceHolder` by 

    - (void)hidePlaceHolder;
    - (MMPlaceHolder *)getPlaceHolder;

v1.0  you can custom or simply use it by

    - (void)showPlaceHolder;
    - (void)showPlaceHolderWithLineColor:(UIColor*)lineColor;
    - (void)showPlaceHolderWithLineColor:(UIColor*)lineColor backColor:(UIColor*)backColor;
    - (void)showPlaceHolderWithLineColor:(UIColor*)lineColor backColor:(UIColor*)backColor arrowSize:(CGFloat)arrowSize ;
    - (void)showPlaceHolderWithLineColor:(UIColor*)lineColor backColor:(UIColor*)backColor arrowSize:(CGFloat)arrowSize lineWidth:(CGFloat)lineWidth;
