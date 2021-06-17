//
//  ViewController.m
//  lesson7
//
//  Created by Павел Заруцков on 22.05.2021.
//

#import "ViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define HALF_SCREEN_WIDTH SCREEN_WIDTH/2
#define HALF_SCREEN_HEIGHT SCREEN_HEIGHT/2
#define MAX_SCORE 10

@interface ViewController ()

@property (strong, nonatomic) UIImageView *racketTop;
@property (strong, nonatomic) UIImageView *racketBottom;
@property (strong, nonatomic) UIView *gridView;
@property (strong, nonatomic) UIView *ball;
@property (strong, nonatomic) UITouch *topTouch;
@property (strong, nonatomic) UITouch *bottomTouch;
@property (strong, nonatomic) NSTimer *timer;
@property (nonatomic) CGFloat dx;
@property (nonatomic) CGFloat dy;
@property (nonatomic) CGFloat speed;
@property (strong, nonatomic) UILabel *scoreTop;
@property (strong, nonatomic) UILabel *scoreBottom;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
}

- (void)config {
    self.view.backgroundColor = [UIColor colorWithRed:100.0/255.0 green:100.0/255.0 blue:191.0/255.0 alpha:1.0];
    
    [self setupGrid];
    [self setupTopPaddle];
    [self setupBottomPaddle];
    [self setupBall];
    [self setupTopScore];
    [self setupBottomScore];
}

- (void)setupBottomScore
{
    _scoreBottom = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, HALF_SCREEN_HEIGHT + 20, 50, 50)];
    _scoreBottom.textColor = [UIColor whiteColor];
    _scoreBottom.text = @"0";
    _scoreBottom.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    _scoreBottom.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_scoreBottom];
}

- (void)setupTopScore
{
    _scoreTop = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, HALF_SCREEN_HEIGHT - 70, 50, 50)];
    _scoreTop.textColor = [UIColor whiteColor];
    _scoreTop.text = @"0";
    _scoreTop.font = [UIFont systemFontOfSize:40.0 weight:UIFontWeightLight];
    _scoreTop.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_scoreTop];
}

- (void)setupBall
{
    _ball = [[UIView alloc] initWithFrame:CGRectMake(self.view.center.x - 10, self.view.center.y - 10, 20, 20)];
    _ball.backgroundColor = [UIColor whiteColor];
    _ball.layer.cornerRadius = 10;
    _ball.hidden = YES;
    [self.view addSubview:_ball];
}

- (void)setupBottomPaddle
{
    _racketBottom = [[UIImageView alloc] initWithFrame:CGRectMake(30, SCREEN_HEIGHT - 90, 90, 60)];
    _racketBottom.image = [UIImage imageNamed:@"racketBottom"];
    _racketBottom.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_racketBottom];
}

- (void)setupTopPaddle
{
    _racketTop = [[UIImageView alloc] initWithFrame:CGRectMake(30, 40, 90, 60)];
    _racketTop.image = [UIImage imageNamed:@"racketTop"];
    _racketTop.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_racketTop];
}

- (void)setupGrid
{
    _gridView = [[UIView alloc] initWithFrame:CGRectMake(0, HALF_SCREEN_HEIGHT - 2, SCREEN_WIDTH, 4)];
    _gridView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:_gridView];
}




@end
