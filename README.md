MMPlaceHolder
=============

A drop in solution to show UIView's size(to accelerate the development speed).

![demo](https://github.com/adad184/MMPlaceHolder/blob/master/demo.png?raw=true)

Usage
===============

simply, you only need one line code.
    
    [yourView showPlaceHolder];


or you can customize youself.

    @interface  UIView(MMPlaceHolder)

        - (void)showPlaceHolder;
        - (void)showPlaceHolderWithLineColor:(UIColor*)lineColor;
        - (void)showPlaceHolderWithLineColor:(UIColor*)lineColor backColor:(UIColor*)backColor;
        - (void)showPlaceHolderWithLineColor:(UIColor*)lineColor backColor:(UIColor*)backColor arrowSize:(CGFloat)arrowSize;

    @end
    
default value is:

    self.lineColor = [UIColor whiteColor];
    self.backColor = [UIColor clearColor];
    self.arrowSize = 3;