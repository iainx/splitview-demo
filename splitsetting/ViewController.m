//
//  ViewController.m
//  splitsetting
//
//  Created by iain on 10/05/2021.
//

#import "ViewController.h"

@implementation ViewController
{
    NSSplitView *_splitView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    _splitView = [[NSSplitView alloc] init];
    _splitView.vertical = YES;
    _splitView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:_splitView];
    [self.view.leadingAnchor constraintEqualToAnchor:_splitView.leadingAnchor].active = YES;
    [self.view.trailingAnchor constraintEqualToAnchor:_splitView.trailingAnchor].active = YES;
    [self.view.topAnchor constraintEqualToAnchor:_splitView.topAnchor].active = YES;
    [self.view.bottomAnchor constraintEqualToAnchor:_splitView.bottomAnchor].active = YES;
    
    NSView *redView = [self createViewWithColor:NSColor.redColor identifier:@"red" frame:NSMakeRect(0, 0, 300, 250)];
    [_splitView addArrangedSubview:redView];
    
    NSSplitView *rightSplit = [self createRightSplitView];
    rightSplit.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    
    [_splitView addArrangedSubview:rightSplit];
    
    NSView *blueView = [self createViewWithColor:NSColor.blueColor identifier:@"blue" frame:NSMakeRect(0, 0, 100, 250)];
    [_splitView addArrangedSubview:blueView];
}

- (NSView *)createViewWithColor:(NSColor *)color identifier:(NSString *)identifier frame:(NSRect)frame
{
    NSView *view = [[NSView alloc] init];
    view.wantsLayer = YES;
    view.layer.backgroundColor = color.CGColor;

    view.frame = frame;
    view.identifier = identifier;

    view.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    
    return view;
}

- (NSSplitView *)createRightSplitView
{
    NSSplitView *rightSplit = [[NSSplitView alloc] init];
    rightSplit.frame = NSMakeRect(0, 0, 100, 250);
    rightSplit.identifier = @"rightSplit";

    NSView *greenView = [self createViewWithColor:NSColor.greenColor identifier:@"green" frame:NSMakeRect(0, 0, 100, 40)];
    
    [rightSplit addArrangedSubview:greenView];
    
    NSSplitView *bottomSplit = [self createBottomSplitView];
    [rightSplit addArrangedSubview:bottomSplit];
    
    return rightSplit;
}

- (NSSplitView *)createBottomSplitView
{
    NSSplitView *bottomSplit = [[NSSplitView alloc] init];
    bottomSplit.vertical = YES;
    bottomSplit.frame = NSMakeRect(0, 0, 50, 300);
    bottomSplit.identifier = @"bottomSplit";

    NSView *purpleView = [self createViewWithColor:NSColor.purpleColor identifier:@"purple" frame:NSMakeRect(0, 0, 10, 200)];
    
    [bottomSplit addArrangedSubview:purpleView];

    NSView *orangeView = [self createViewWithColor:NSColor.orangeColor identifier:@"orange" frame:NSMakeRect(0, 0, 200, 0)];
    
    [bottomSplit addArrangedSubview:orangeView];
    
    return bottomSplit;
}

@end
