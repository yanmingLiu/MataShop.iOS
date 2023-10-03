# Mata商城iOS原生版本

## 一些潜在的Bug：

```javascript
1、WMZBannerView完全停止更新，且文字过长会出现问题。跑马灯功能需要另辟蹊径
2、iPhone 15全系列机型因为才上市，暂时还没有拿到最新的机型屏幕数据以及Identifier
持续关注：
https://www.theiphonewiki.com/wiki/Models
对 UIDevice+XMUtils.h 和 MacroDef_Size.h 进行更新
```

## 几点重要说明

```javascript
要想快，用快捷键调取代码块
集成方式：https://github.com/JobsKit/JobsCodeSnippets
```

```javascript
苹果在后续的Api中推出了 UIButtonConfiguration 来设置UIButton，但是这个新Api会存在几大问题
1、大多数开发者对这个Api不熟悉
2、用了新Api以后，老的Api的一些调用方式可能不会起效果
3、大多数时候，我们会涉及到富文本。而富文本和普通的文本之间对于控件有优先级。富文本的优先级最高
4、因为要做兼容处理，但是 UIButtonConfiguration 的设置环节非常繁琐

所以，为了应对以上的问题，可以快捷键（init.JobsBtn）调代码块来设置 UIButton
得出的 UIButton 是没有约束的，需要自己在外界加
具体的内部实现，请关注@implementation UIButton (UI)
资料来源：
Chat GPT 3.5 
https://www.jianshu.com/p/12426709420e
```
