
OVERVIEW
===================
WZLBadge is a tool to add or clear badge for **any UIViews**, which is written in Objective-C, **supporting iOS5 ~ iOS8**, supporting portrait and landscape device orientation.

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
 

Here are examples for WZLBadge:

![](http://chuantu.biz/t2/10/1436431134x-1376436589.gif)

![](http://chuantu.biz/t2/10/1436432051x-1376436545.gif)

----------


INSTALLTATION
-------------
Drag the 
> UIView+WZLBadge

 folder into your project.

----------

REQUIREMENTS
-------------------

 - Xcode 6
 - iOS5 or above
 - ARC

----------


USAGE
-------------

 1. Add the following import to the top of the file:
> import "UIView+WZLBadge.h"

 2. Use the following to display badge easily:

> [someView showBadgeWithStyle:**WBadgeStyleRedDot** value:0 animationType:**WBadgeAnimTypeShake**];
> [someView showBadgeWithStyle:**WBadgeStyleNumber** value:99 animationType:**WBadgeAnimTypeShake**];

or simply call interface:[- showBadge]
 
3. Use the following to clear badge easily:
 

> [someView clearBadge];

----------


BADGE CUSTOMIZATION
--------------------
Feel free to customize badge size, position, animation style or anything else in file `UIView+WZLBadge.h`

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
LICENSE
--------------------
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
