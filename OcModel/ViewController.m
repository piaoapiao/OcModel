//
//  ViewController.m
//  OcModel
//
//  Created by guodong on 2018/11/19.
//  Copyright © 2018年 Maizi. All rights reserved.
//

#import "ViewController.h"
#import  <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建 一个类名
    Class newClass = objc_allocateClassPair([UIView class], "GuoView", 0);
    
    class_addMethod(newClass, @selector(report), (IMP)ReportFunction, "v@:");
    
    objc_registerClassPair(newClass);
    
    id instanceOfNewClas = [[newClass alloc] init];
    
//    [instanceOfNewClas performSelector:@selector(report)];
    
    
    UIButton *btn = [UIButton new];
    [self getBtnClassInfo:btn];
    
    
//    [btn classInfo];
    
    // Do any additional setup after loading the view, typically from a nib.
}

void ReportFunction(id self ,SEL _cmd)
{
    NSLog(@"this object is %p",self);
    NSLog(@"Class is %@,and super is %@.",[self class],[self superclass]);
    Class currentClass = [self class];
    for(int i = 1;i<5;i++)
    {
        NSLog(@"following the isa pointer %d times gives %p",i,currentClass);
        NSLog(@"currentClass:%@",NSStringFromClass(currentClass));
        currentClass = object_getClass(currentClass);
    }
    
}

-(void)getBtnClassInfo:(id )btn
{
    Class currentClass = [btn class];
    for(int i = 1;i<6;i++)
    {
        NSLog(@"following the isa pointer %d times gives %p",i,currentClass);
        NSLog(@"currentClass:%@",NSStringFromClass(currentClass));
        currentClass = object_getClass(currentClass);
    }
}



@end
