### How to use:
```
#import "UIViewController+CzyModalTransitioner.h"
```

```
    SecondViewController *secondVc = [[SecondViewController alloc] init];
    secondVc.transitioningDelegate = self;
    //设置为modalPresentationStyle = UIModalPresentationCustom present之后不会消失
    secondVc.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:secondVc animated:YES completion:nil];
```

### sketch map
![sketch map](https://github.com/ITIosEthan/CzyCustomModalTransitionAnimation/blob/master/modal.gif)
