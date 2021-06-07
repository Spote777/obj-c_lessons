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

//MARK: - Properties

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

//MARK: - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
    NSLog(@"viewDidLoad");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
    
    [self becomeFirstResponder];
    [self newGame];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
    
    [self resignFirstResponder];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    NSLog(@"viewWillTransitionToSize");
}

//MARK: - UI methods

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

//MARK: - Touch methods

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInView:self.view];
        if (_bottomTouch == nil && point.y > HALF_SCREEN_HEIGHT) {
            _bottomTouch = touch;
            _racketBottom.center = CGPointMake(point.x, point.y);
        }
        else if (_topTouch == nil && point.y < HALF_SCREEN_HEIGHT) {
            _topTouch = touch;
            _racketTop.center = CGPointMake(point.x, point.y);
        }
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint point = [touch locationInView:self.view];
        if (touch == _topTouch) {
            if (point.y > HALF_SCREEN_HEIGHT) {
                _racketTop.center = CGPointMake(point.x, HALF_SCREEN_HEIGHT);
                return;
            }
            _racketTop.center = point;
        }
        else if (touch == _bottomTouch) {
            if (point.y < HALF_SCREEN_HEIGHT) {
                _racketBottom.center = CGPointMake(point.x, HALF_SCREEN_HEIGHT);
                return;
            }
            _racketBottom.center = point;
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        if (touch == _topTouch) {
            _topTouch = nil;
        }
        else if (touch == _bottomTouch) {
            _bottomTouch = nil;
        }
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
}

//MARK: - Alert controller

- (void)displayMessage:(NSString *)message {
    [self stop];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Ping Pong" message:message preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        if ([self gameOver]) {
            [self newGame];
            return;
        }
        [self reset];
        [self start];
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
}

//MARK: - Logic methods

- (void)newGame {
    [self reset];
    
    _scoreTop.text = @"0";
    _scoreBottom.text = @"0";
    
    [self displayMessage:@"Готовы к игре?"];
}

- (int)gameOver {
    if ([_scoreTop.text intValue] >= MAX_SCORE) return 1;
    if ([_scoreBottom.text intValue] >= MAX_SCORE) return 2;
    return 0;
}

- (void)start {
    _ball.center = CGPointMake(HALF_SCREEN_WIDTH, HALF_SCREEN_HEIGHT);
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(animate) userInfo:nil repeats:YES];
    }
    _ball.hidden = NO;
}

- (void)reset {
    if ((arc4random() % 2) == 0) {
        _dx = -1;
    } else {
        _dx = 1;
    }
    
    if (_dy != 0) {
        _dy = -_dy;
    } else if ((arc4random() % 2) == 0) {
        _dy = -1;
    } else  {
        _dy = 1;
    }
    
    _ball.center = CGPointMake(HALF_SCREEN_WIDTH, HALF_SCREEN_HEIGHT);
    
    _speed = 2;
}

- (void)stop {
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    _ball.hidden = YES;
}

- (void)animate {
    _ball.center = CGPointMake(_ball.center.x + _dx*_speed, _ball.center.y + _dy*_speed);
    [self checkCollision:CGRectMake(0, 0, 20, SCREEN_HEIGHT) X:fabs(_dx) Y:0];
    [self checkCollision:CGRectMake(SCREEN_WIDTH, 0, 20, SCREEN_HEIGHT) X:-fabs(_dx) Y:0];
    if ([self checkCollision:_racketTop.frame X:(_ball.center.x - _racketTop.center.x) / 32.0 Y:1]) {
        [self increaseSpeed];
    }
    if ([self checkCollision:_racketBottom.frame X:(_ball.center.x - _racketBottom.center.x) / 32.0 Y:-1]) {
        [self increaseSpeed];
    }
    [self goal];
}

- (void)increaseSpeed {
    _speed += 0.5;
    if (_speed > 10) _speed = 10;
}

- (BOOL)checkCollision: (CGRect)rect X:(float)x Y:(float)y {
    if (CGRectIntersectsRect(_ball.frame, rect)) {
        if (x != 0) _dx = x;
        if (y != 0) _dy = y;
        return YES;
    }
    return NO;
}

- (BOOL)goal
{
    if (_ball.center.y < 0 || _ball.center.y >= SCREEN_HEIGHT) {
        int s1 = [_scoreTop.text intValue];
        int s2 = [_scoreBottom.text intValue];
        
        if (_ball.center.y < 0) ++s2; else ++s1;
        _scoreTop.text = [NSString stringWithFormat:@"%u", s1];
        _scoreBottom.text = [NSString stringWithFormat:@"%u", s2];
        
        int gameOver = [self gameOver];
        if (gameOver) {
            [self displayMessage:[NSString stringWithFormat:@"Игрок %i выиграл", gameOver]];
        } else {
            [self reset];
        }
        
        return YES;
    }
    return NO;
}
@end
