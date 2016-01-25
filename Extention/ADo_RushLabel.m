#import "ADo_RushLabel.h"

#define defaultColor [UIColor orangeColor]

static float const animatedDuration = 0.15;
static int const  denominator = 30;
static int const  defaultFont = 17;

@interface ADo_RushLabel ()

@property (nonatomic, assign) int rushNumber;
@property (nonatomic, assign) int maxNumber;
@property (nonatomic, strong) NSTimer *currentTimer;
@property (nonatomic, strong) NSMutableDictionary *textAttributes;
@property (nonatomic, assign) int defaultRatio;

@end

@implementation ADo_RushLabel

- (void)rush_setTextColor:(UIColor *)textColor {
    self.textAttributes[NSForegroundColorAttributeName] = textColor;
}
- (void)rush_setTextFont:(UIFont *)textFont {
    self.textAttributes[NSFontAttributeName] = textFont;
}
- (void)rush_setMaxNumber:(int)maxNumber {
    self.maxNumber = maxNumber;
    self.defaultRatio = maxNumber / denominator;
    [self.currentTimer fire];
}

#pragma mark - 初始化

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        NSMutableDictionary *textAttributes =[NSMutableDictionary dictionary];
        textAttributes[NSForegroundColorAttributeName] = defaultColor;
        textAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:defaultFont];
        self.textAttributes = textAttributes;
        self.currentTimer = [NSTimer scheduledTimerWithTimeInterval:animatedDuration target:self selector:@selector(changeText) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.currentTimer forMode:NSRunLoopCommonModes];
        self.rushNumber = 0;
    }
    return self;
}

#pragma mark - 文字改变

- (void)changeText {
    self.rushNumber += (arc4random_uniform(2) + 1) * self.defaultRatio;
    if (self.rushNumber >= self.maxNumber) {
        self.rushNumber = self.maxNumber;
        [self.currentTimer invalidate];
        self.currentTimer = nil;
    }
    NSString *tempStr = [self countNumAndChangeformat:[NSString stringWithFormat:@"%010d",self.rushNumber]];
    NSMutableAttributedString *tempAtt = [[NSMutableAttributedString alloc] initWithString:tempStr];
    [tempAtt setAttributes:self.textAttributes range:NSMakeRange(0, tempAtt.length)];
    self.attributedText = tempAtt;
}

- (NSString *)countNumAndChangeformat:(NSString *)num
{
    //此处是为了各位证书之间的分号
    NSMutableString *string = [NSMutableString stringWithString:num];
    for (NSInteger i = 7; i >= 1; i -= 3) {
        [string insertString:@"," atIndex:i];
    }
    
    return string;
}


@end
