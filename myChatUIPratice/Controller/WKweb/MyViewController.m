//
//  myViewController.m
//  myUiPractice
//
//  Created by 周传祥 on 2018/10/17.
//  Copyright © 2018 zcx. All rights reserved.
//

#import "MyViewController.h"
#import <WebKit/WebKit.h>
#import "AFNetworking.h"
@interface MyViewController ()<UITextFieldDelegate,UITextViewDelegate,WKNavigationDelegate>
@property (strong,nonatomic) UILabel *label;
@property CGFloat smalWidth;
@property CGFloat smalHeight;
@property CGFloat TopView;
@property CGFloat bigWidth;
@property CGFloat bigHeight;
@property CGFloat space;
@property CGRect screen;
@property (strong,nonatomic) WKWebView *wkWebView;
@property (strong,nonatomic) UIActivityIndicatorView *active;
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _smalWidth = 60;
    _smalHeight = 30;
    _TopView = 150;
    _bigWidth = 200;
    _bigHeight = 150;
    _space = 40;
    _screen = [[UIScreen mainScreen]bounds];
    // Do any additional setup after loading the view.
    //    [self lebelAndButton];
    //    [self textFiledAndKeybord];
    //    [self switchAndSegmentedControl];
    [self WKweb];
    //    UITableView
    
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.wkWebView  loadRequest:request];
    self.wkWebView.navigationDelegate = self;
    NSLog(@"buttonLoadRequest");
    // 方式二
   self.navigationItem.title = @"WKWeb";
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
    
    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}


-(void)onClick:(id)sender{
    _label.text = @"clicked";
}


//
-(void)lebelAndButton{
    
    CGRect fram = CGRectMake((_screen.size.width-_bigWidth)/2, _TopView, _bigWidth, _smalHeight);
    _label = [[UILabel alloc]initWithFrame:fram];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = @"Label";
    [self.view addSubview:_label];
    UIButton *button  = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"button" forState:UIControlStateNormal];
    button.frame = CGRectMake((_screen.size.width-_bigWidth)/2, _TopView + _space, _bigWidth, _smalHeight);
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)textFiledAndKeybord{
    
    
    UITextField *textFiled = [[UITextField alloc]initWithFrame:CGRectMake((_screen.size.width-_bigWidth)/2, _TopView ,_bigWidth, _smalHeight)];
    textFiled.borderStyle = UITextBorderStyleRoundedRect;
    textFiled.delegate = self;
    _label = [[UILabel alloc]initWithFrame:CGRectMake(textFiled.frame.origin.x, textFiled.frame.origin.y-_space, _bigWidth, _smalHeight)];
    _label.text=@"input";
    textFiled.returnKeyType = UIReturnKeyGo;
    textFiled.keyboardType = UIKeyboardTypeWebSearch;
    
    [self.view addSubview:textFiled];
    [self.view addSubview:_label];
    UILabel *abstractLabel = [[UILabel alloc]init];
    CGRect rect = textFiled.frame;
    CGPoint point = CGPointMake(textFiled.frame.origin.x, (textFiled.frame.origin.y + _space));
    rect.origin = point;
    abstractLabel.frame = rect;
    abstractLabel.text = @"abstract:";
    [self.view addSubview:abstractLabel];
    
    UITextView * textview =[[UITextView alloc]initWithFrame:CGRectMake(abstractLabel.frame.origin.x, abstractLabel.frame.origin.y +  _space, _bigWidth, _bigHeight)];
    textview.text = @"this is textview ndjaskdasljdkl kasnldaskld skdlajkdlaj akdljaskdajs dsa";
    textview.delegate = self;
    
    textview.layer.borderColor = [UIColor blackColor].CGColor;
    textview.layer.borderWidth = 1;
    [self.view addSubview:textview];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"input get aim");
    [textField resignFirstResponder];
    return YES;
}
-(bool)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if([text isEqualToString:@"\n"]){
        NSLog(@"no enter");
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
-(void)keyBoardDidShow:(NSNotification*)notification{
    NSLog(@"键盘打开");
}
-(void)keyBoardDidHide:(NSNotification*)notification{
    NSLog(@"键盘关闭");
}

-(void)switchAndSegmentedControl{
    
    UISegmentedControl * segment = [[UISegmentedControl alloc]initWithItems:@[@"left",@"right"]];
    segment.frame = CGRectMake((_screen.size.width - _bigWidth)/2,_TopView, _bigWidth, _smalHeight);
    [segment addTarget:self action:@selector(segmentChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segment];
    
    UISwitch * leftSwitch = [[UISwitch alloc]initWithFrame:CGRectMake((_screen.size.width - _bigWidth)/2, _TopView + _space*2, _smalWidth, _smalHeight)];
    leftSwitch.on = YES;
    [leftSwitch addTarget:self action:@selector(leftSwitchClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:leftSwitch];
    leftSwitch.tag = 1;
    UISwitch * rightSwitch = [[UISwitch alloc]initWithFrame:CGRectMake((_screen.size.width)/2 + _space, _TopView + _space *2, _smalWidth, _smalHeight)];
    rightSwitch.on = YES;
    [rightSwitch addTarget:self action:@selector(rightSwitchClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:rightSwitch];
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake((_screen.size.width - _bigWidth)/2, leftSwitch.frame.origin.y + _space *2, _bigWidth, _smalHeight)];
    _label.text=@"value:30%";
    [self.view addSubview:_label];
    UISlider * slider = [[UISlider alloc]initWithFrame:CGRectMake((_screen.size.width - _bigWidth)/2, _label.frame.origin.y + _space , _bigWidth, _smalHeight)];
    slider.minimumValue = 0.0f;
    slider.maximumValue = 100.0f;
    slider.value = 30.0f;
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];
    
}
-(void)WKweb{
    
    CGFloat buttonBarWidth =_screen.size.width;
    CGFloat buttonBarHeight =_bigHeight-100;
    _space = _space/2;
    CGFloat buttonWidth =(buttonBarWidth-_space*4)/3;
    CGFloat buttonHeight =_bigHeight - 120;
    UIView *buttonBar = [[UIView alloc]initWithFrame:CGRectMake((_screen.size.width - buttonBarWidth)/2, 20, buttonBarWidth, buttonBarHeight)];
    //[buttonBar  setBackgroundColor:UIColor.grayColor];
    buttonBar.layer.borderColor = UIColor.blueColor.CGColor;
    buttonBar.layer.borderWidth = 1;
    //[self.view addSubview:buttonBar];
    UIButton *buttonLoadStr = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect fram = CGRectMake((buttonBar.frame.origin.x + _space), buttonBar.frame.origin.y-10, buttonWidth, buttonHeight);
    buttonLoadStr.frame = fram;
    buttonLoadStr.layer.borderColor = UIColor.blueColor.CGColor;
    buttonLoadStr.layer.borderWidth = 1;
    [buttonLoadStr setTitle:@"LoadString" forState:UIControlStateNormal];
    
    UIButton *buttonLoadData = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect fram1 = CGRectMake((buttonBar.frame.origin.x + _space*2 + buttonWidth), buttonBar.frame.origin.y-10, buttonWidth, buttonHeight);
    buttonLoadData.frame = fram1;
    buttonLoadData.layer.borderColor = UIColor.blueColor.CGColor;
    buttonLoadData.layer.borderWidth = 1;
    [buttonLoadData setTitle:@"LoadData" forState:UIControlStateNormal];
    
    UIButton *buttonLoadRequest = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect fram2 = CGRectMake((buttonBar.frame.origin.x + _space*3+buttonWidth*2), buttonBar.frame.origin.y-10, buttonWidth, buttonHeight);
    buttonLoadRequest.frame = fram2;
    buttonLoadRequest.layer.borderColor = UIColor.blueColor.CGColor;
    buttonLoadRequest.layer.borderWidth = 1;
    [buttonLoadRequest setTitle:@"LoadRequest" forState:UIControlStateNormal];
    
    [buttonBar addSubview:buttonLoadStr];
    [buttonBar addSubview:buttonLoadData];
    [buttonBar addSubview:buttonLoadRequest];
    //[buttonLoadRequest addTarget:self action:@selector(buttonLoadRequest:) forControlEvents:UIControlEventTouchUpInside];
    // [buttonLoadData addTarget:self action:@selector(buttonLoadData:) forControlEvents:UIControlEventTouchUpInside];
    //[buttonLoadStr addTarget:self action:@selector(buttonLoadStr:) forControlEvents:UIControlEventTouchUpInside];
    _wkWebView = [[WKWebView alloc]initWithFrame:CGRectMake(buttonBar.frame.origin.x, 0, _screen.size.width, _screen.size.height)];
    // _wkWebView.layer.borderWidth = 1;
    //_wkWebView.layer.borderColor = UIColor.blueColor.CGColor;
    
    [self.view addSubview:_wkWebView];
    
    _active = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    CGRect cg = CGRectMake((_screen.size.width-_smalWidth)/2, (_screen.size.height - _smalHeight)/2, _smalWidth, _smalHeight);
    _active.frame = cg;
    _active.hidesWhenStopped = false;
    [self.view addSubview:_active];
    
}
-(void)buttonLoadRequest:(UIButton *)sender{
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.wkWebView  loadRequest:request];
    self.wkWebView.navigationDelegate = self;
    NSLog(@"buttonLoadRequest");
}
-(void)buttonLoadData:(UIButton *)sender{
    
    NSLog(@"buttonLoadData");
    NSString *str = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    //if str == nil , a bug here
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]bundlePath]];
    NSData *data = [[NSData alloc]initWithContentsOfFile:str];
    [self.wkWebView loadData:data MIMEType:@"text/html" characterEncodingName:@"UTF-8" baseURL:url];
    
    
}
-(void)buttonLoadStr:(UIButton *)sender{
    NSLog(@"buttonLoadStr");
    NSString *str = [[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]bundlePath]];
    NSError *error= nil;
    NSString *html = [[NSString alloc]initWithContentsOfFile:str encoding:NSUTF8StringEncoding error:&error];
    if(error == nil)
    {
        [self.wkWebView loadHTMLString:html baseURL:url];
    }
    
}
-(void)leftSwitchClick:(UISwitch *)sender{
    NSLog(@"leftSwitchValueChanged");
}
-(void)rightSwitchClick:(UISwitch *)sender{
    NSLog(@"rightSwitchValueChanged");
}
-(void)segmentChange:(UISegmentedControl*)sender{
    NSLog(@"selected:%ld",sender.selectedSegmentIndex);
}
-(void)sliderValueChanged:(UISlider*)sender{
    NSLog(@"selected:%f",sender.value);
    _label.text = [NSString stringWithFormat:@"value:%d %%",(int)sender.value];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    NSLog(@"begin");
    
    [_active startAnimating];
}
-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    NSLog(@"commit");
}
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    NSLog(@"finish");
    [_active stopAnimating];
}
-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    NSLog(@"fail %@",error.description);
}
@end
