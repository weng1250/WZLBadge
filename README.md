一行代码实现Badge效果(iOS)
BADGE IN ONE LINE(iOS)
===================
OVERVIEW
===================
WZLBadge is a tool to add or clear badge for **any UIViews**, which is written in Objective-C, **supporting iOS5 ~ iOS8**, supporting **portrait and landscape device orientation**.

> The code is implemented by the way of category for UIView, thus, 
it is **very easy to use**.

At this version, three badge style are supported:

 - WBadgeStyleRedDot
 - WBadgeStyleNumber
 - WBadgeStyleNew

Three animation types are supported:

 - WBadgeAnimTypeNone(by default)
 - WBadgeAnimTypeScale
 - WBadgeAnimTypeShake
 - WBadgeAnimTypeBreathe
 - WBadgeAnimTypeBounce
 

Here are examples for WZLBadge:

![](http://chuantu.biz/t2/13/1443173925x1729546381.gif)

![](http://chuantu.biz/t2/13/1443173966x1822614216.gif)

----------


INSTALLTATION
-------------
Method1：
Drag the 
> WZLBadge

 folder into your project.

Method2:
Use CocoaPods to install automaticlly:
pod 'WZLBadge', '~> 1.1.3’

----------

REQUIREMENTS
-------------------

 - Xcode 6
 - iOS5 or above
 - ARC (or MRC, but project setting is necessary)

----------


USAGE
-------------

 1. Add the following import to the top of the file:
> import "WZLBadgeImport.h"

 2. Use the following to display badge easily:

> [someView showBadgeWithStyle:**WBadgeStyleRedDot** value:0 animationType:**WBadgeAnimTypeShake**];
> [someView showBadgeWithStyle:**WBadgeStyleNumber** value:99 animationType:**WBadgeAnimTypeShake**];

or simply call interface:[- showBadge]
 
3. Use the following to clear badge easily:
 

> [someView clearBadge];


----------


BADGE CUSTOMIZATION
--------------------
Feel free to customize badge size, position, animation style or anything else.

WZLBadge provides easy way to customize its style.:

    //set background color. red color by default
    view.badgeBgColor = [UIColor purpleColor];
    
    //set badge position. right-top corner of view by default
    view.badgeCenterOffset = CGPointMake(-8, 0);

	//set badge foreground color. white color by default
	view.badgeTextColor = [UIColor whiteColor];

	//...

----------
CONTACT
--------------------
Do you have any questions or idea? My email is: 

> zilin_weng@163.com

 Or you can find some more info at my blog in cnblogs.com:
 
> http://www.cnblogs.com/wengzilin/

如果你在天朝，可以查看中文博客地址：
http://www.cnblogs.com/wengzilin/p/4633937.html

----------
NOTE
--------------------
This project will be update continually. Therefore, **fork** or **star** would be suggested.

I wish it to be an ultimat solution for UIView badge in iOS.


----------
CONTRIBUTE
--------------------
 - Zilin Weng(翁子林) https://github.com/weng1250
 - jfuellert https://github.com/jfuellert

Feel free to open an issue or pull request, if you need help or there is a bug.

----------
CHANGE LOG
--------------------
V1.2  2015.09.25
 1.UITabBarItem badge is supproted;
 2.Enable change badge properties when badge is showing;
 3.Other code optimization.

V1.1  2015.08.12

 1. UIBarButtonItem badge is supported. UIBarButtonItem is kind of NSObject and its displayed view is invisiable. This version makes usage of UIBarButtonItem badge as to UIView.
 2. Slight adjustment for code structure to fit future extension.
 3. Other code optimization.



V1.0  at 2015.06.16

Base functions are completed, which is able to meet most of requirements.

----------
----------
LICENSE
--------------------
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
