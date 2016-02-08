//
//  MSUserCardController.m
//  PPNetWorking
//
//  Created by 范月成 on 16/2/5.
//  Copyright © 2016年 范月成. All rights reserved.
//
#import "Masonry.h"
#import "MSUserData.h"
#import "MSUserCardController.h"
#import "MSFrameConfig.h"
#import "MSPhotoView.h"
#import "MSSystem.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define kScreenW        [UIScreen mainScreen].bounds.size.width
#define kScreenH        [UIScreen mainScreen].bounds.size.height

@implementation MSUserCardInfo

+ (NSMutableArray *)initWithMSUserCard:(MSUserCard *)userCard
{
    NSMutableArray *userCardArr = [NSMutableArray array];
    NSArray *titleArr = @[@"照        片", @"姓        名", @"身份管理", @"现 单 位", @"现 职 位", @"成就标签", @"能力标签", @"手        机", @"邮        箱", @"微        信", @"座        机", @"通信地址"];
    NSArray *detailArr = [NSArray arrayWithObjects:userCard.headphoto, userCard.name, @"身份管理", userCard.company, userCard.position, userCard.achieve, userCard.ability, userCard.mobile, userCard.email, userCard.weixin, userCard.landline, userCard.address, nil];
    
    for (int i = 0; i < titleArr.count; i ++) {
        MSUserCardInfo *info = [MSUserCardInfo new];
        info.title = titleArr[i];
        info.detail = detailArr[i];
        
        [userCardArr addObject:info];
    }
    
    return userCardArr;
}

@end

typedef NS_ENUM(NSInteger, MSUserCardCellType) {
    MSUserCardCellTypeImage,
    MSUserCardCellTypeWord
};

@interface MSUserCardCell ()

@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *detail;
@property (nonatomic, strong) MSPhotoView *headIcon;
@property (nonatomic, strong) UIImageView *indicator;
@property (nonatomic, assign) MSUserCardCellType cellTpe;

@end

@implementation MSUserCardCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.title = [UILabel new];
        self.title.textColor = kMSColor(158, 158, 158);
        self.title.font = kMSFontDefault;
        [self.contentView addSubview:self.title];
        
        self.detail = [UILabel new];
        self.detail.textColor = kMSColor(17, 17, 17);
        self.detail.font = kMSFontDefault;
        [self.contentView addSubview:self.detail];
        
        self.indicator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_arrow"]];
        [self.contentView addSubview:self.indicator];
        
        self.headIcon  = [[MSPhotoView alloc] init];
        [self.contentView addSubview:self.headIcon];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    WS(ws)
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws).offset(10);
        make.width.mas_equalTo(@70);
        make.top.equalTo(ws);
        make.bottom.equalTo(ws);
    }];
    
    [self.detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.title.mas_right);
        make.right.equalTo(ws.indicator.mas_left);
        make.top.equalTo(ws);
        make.bottom.equalTo(ws);
    }];
    
    [self.headIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.title.mas_right);
        make.centerY.mas_equalTo(ws.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [self.indicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws).offset(-10);
        make.centerY.mas_equalTo(ws.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(12, 12));
    }];
}

- (void)setCellTpe:(MSUserCardCellType)cellTpe
{
    _cellTpe = cellTpe;
    switch (cellTpe) {
        case MSUserCardCellTypeImage:
            self.headIcon.hidden = NO;
            self.detail.hidden = YES;
            
            break;
           
        case MSUserCardCellTypeWord:
            self.headIcon.hidden = YES;
            self.detail.hidden = NO;
            
            break;
        default:
            break;
    }
}

- (void)setUserInfo:(MSUserCardInfo *)userInfo
{
    _userInfo = userInfo;
    _title.text = userInfo.title;
    _detail.text = userInfo.detail;
    if(_cellTpe == MSUserCardCellTypeImage){
        _headIcon.image = userInfo.detail;
        _headIcon.photoType = MSPhotoViewTypeSquareRectRound;
    }
}

@end

@interface MSUserCardController ()

{
    NSMutableArray *_userInfoArray;
}

@end

@implementation MSUserCardController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadData];
    
    [self setUpTableView];
}

- (void)loadData
{
    [[[MSUserData alloc] init] getUserInfo:131276 success:^(MSUserCard *card) {
        if (card) {
            _userInfoArray = [MSUserCardInfo initWithMSUserCard:card];
            [self.tableView reloadData];
        }else{
            NSLog(@"获取信息失败");
        }
    }];
    
}

- (void)setUpTableView
{
    [self.tableView registerClass:[MSUserCardCell class] forCellReuseIdentifier:@"MSUserCardCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    self.tableView.sectionHeaderHeight = 44;
    self.tableView.showsVerticalScrollIndicator = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 7;
            break;
            
        case 1:
            return 5;
            break;

        case 2:
            return 1;
            break;

            
        default:
            return 0;
            break;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        MSUserCardInfo *info = _userInfoArray[indexPath.row];
        MSUserCardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MSUserCardCell" forIndexPath:indexPath];
        if (indexPath.section == 0 && indexPath.row == 0) {
            cell.cellTpe = MSUserCardCellTypeImage;
        } else {
            cell.cellTpe = MSUserCardCellTypeWord;
        }
        
        cell.userInfo = info;
        return cell;
    } else  if (indexPath.section == 1) {
        MSUserCardInfo *info = _userInfoArray[indexPath.row + 7];
        MSUserCardCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MSUserCardCell" forIndexPath:indexPath];
        
        cell.cellTpe = MSUserCardCellTypeWord;
        cell.userInfo = info;
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
        cell.imageView.image = [UIImage imageNamed:@"img"];
        cell.textLabel.text = @"更多个人展示，请填写人物传志";
        cell.textLabel.textColor = [MSSystem systemColorWith:1];
        return cell;
    }
   
}

//row height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 60.0;
    } else {
        return 44.0;
    }
}

//选中不高亮
-(BOOL) tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //跳转到详情修改页面
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//section headerview
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 44)];
    title.backgroundColor = kMSColor(236, 236, 236);
    title.textColor = [UIColor grayColor];
    switch (section) {
        case 0:
            title.text = @"  基本信息";
            
            break;
        case 1:
            title.text = @"  联系方式";

            break;
        case 2:
            title.text = @"";

            break;
            
        default:
            break;
    }
    
    return title;
}
@end
