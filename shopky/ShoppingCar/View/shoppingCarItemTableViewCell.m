//
//  shoppingCarItemTableViewCell.m
//  shopky
//
//  Created by HaoMac on 2019/3/20.
//  Copyright © 2019 HaoMac. All rights reserved.
//

#import "shoppingCarItemTableViewCell.h"
#import "shoppingCarItemView.h"

static NSString* shoppingCarItemViewID = @"shoppingCarItemViewID";

@implementation shoppingCarItemTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _itemArr = [NSArray array];
        [self addOwnView];
        _isOpen = false;
        _Tcount = 0;
    }
    
    return self;
}

+(CGFloat)getHight:(NSInteger)count isOpen:(BOOL)isopen
{
    if (!isopen) {
        if (count > 3) {
            return (40 + 100 + 60*3);
        }
        else
        {
            return (40 + 100 + 60*count);
        }
    }
    return (40 + 100 + 60*count);
}

-(void)setCount:(NSInteger)count
{
    _Tcount = count;
    if (_isOpen) {
        _count = count;
        if (count > 3) {
            _foot.openLab.text = @"收起";
        }
    }
    else
    {
        if (count > 3) {
            _count = 3;
            _foot.openLab.text = @"展开";
        }
        else
        {
            _count = count;
        }
    }
    if (count <= 3)
    {
        _foot.openLab.text = @"";
    }
        
    [_tableView reloadData];
}

-(void)setItemArr:(NSArray *)itemArr
{
    _itemArr = itemArr;
}

-(void)addOwnView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellEditingStyleNone;
    _tableView.backgroundColor = [UIColor whiteColor];
//    _tableView.scrollEnabled = false;
//    _tableView.editing = YES;
    [self.contentView addSubview:_tableView];
    [_tableView makeConstraints:^(MASConstraintMaker* make){
        make.center.equalTo(self.contentView);
        make.width.equalTo(self.contentView.width);
        make.height.equalTo(self.contentView.height);
    }];
    _head = [[headView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    _tableView.tableHeaderView = _head;
    WEAKSELF
    _head.headDelItem = ^(NSInteger head){
        if (weakSelf.delItem) {
            weakSelf.delItem(0);
            shopcarDBModel* model  = [[shopcarDBModel alloc] init];
            model.shopId = weakSelf.model.shopID;
            [[Singleton shareInstance] deleteALLGoods:model];
            [weakSelf.tableView reloadData];
        }
        
    };
    
    _foot = [[footView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
    _tableView.tableFooterView = _foot;
    _foot.openTouch = ^(BOOL flag){
        self.isOpen = flag;
        if (flag) {
            if(_Tcount <= 3)
            {
                _foot.openLab.text = @" ";
            }
            if (_openCell) {
                _openCell(_Tcount, flag);
            }
        }
        else{
            if (_Tcount > 3) {
                _openCell(_Tcount, flag);
            }
            else
            {
                _openCell(_Tcount, flag);
            }
        }
        
        [_tableView reloadData];
    };
    
    _foot.pushVC = ^(){
        if (_pushVC) {
            _pushVC();
        }
    };
    
    [_tableView registerClass:[shoppingCarItemView class] forCellReuseIdentifier:shoppingCarItemViewID];
    
    _tableView.allowsMultipleSelection = NO;
    _tableView.allowsSelectionDuringEditing = NO;
    _tableView.allowsMultipleSelectionDuringEditing = NO;
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //只要实现这个方法，就实现了默认滑动删除！！！！！
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // 删除数据
        _count -= 1;
        _Tcount -= 1;
        if (_delItem) {
            _delItem(_Tcount);
        }
        shopcarDBModel* model = [[shopcarDBModel alloc] init];
        model.shopId = _model.shopID;
        model.goodsId = [_model.arrItem objectAtIndex:indexPath.row].goodsId;
//        model.goodsId =
        [[Singleton shareInstance] deleteGoodsData:model];
        [_tableView reloadData];
        
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 删除
    return UITableViewCellEditingStyleDelete;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_isOpen) {
        return _Tcount;
    }
    else
    {
        if (_Tcount > 3) {
            return 3;
        }
        else
            return _Tcount;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    shoppingCarItemView* cell = [tableView dequeueReusableCellWithIdentifier:shoppingCarItemViewID forIndexPath:indexPath];
    if (!cell) {
        cell = [[shoppingCarItemView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:shoppingCarItemViewID];
    }
    [cell setModel:_model.arrItem[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(shopCarListModel *)model
{
    _model = model;
    _head.shopLab.text = model.shooName;
    [_tableView reloadData];
}

@end

@implementation headView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self==[super initWithFrame:frame]) {
        [self addOwnView];
    }
    return self;
}

-(void)addOwnView
{
    _shopLab = [[UILabel alloc] init];
    _shopLab.font = [UIFont systemFontOfSize:15];
    _shopLab.text = @"兰州拉面";
    _shopLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_shopLab];
    [_shopLab makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(self);
        make.left.equalTo(10);
    }];
    
    _delBtn = [[UIButton alloc] init];
    _delBtn.contentMode = UIViewContentModeScaleAspectFit;
    [_delBtn setImage:[UIImage imageNamed:@"del"] forState:UIControlStateNormal];
    [_delBtn addTarget:self action:@selector(delAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_delBtn];
    [_delBtn makeConstraints:^(MASConstraintMaker* make){
        make.centerY.equalTo(self.shopLab);
        make.right.equalTo(self.right).equalTo(-5);
        make.width.equalTo(30);
        make.height.equalTo(30);
    }];
}

-(void)delAction:(id)sender
{
    
    if (_headDelItem) {
        _headDelItem(0);
    }
}

@end

@implementation footView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addOwnView];
    }
    return self;
}

-(void)addOwnView
{
    _openLab = [[UILabel alloc] init];
    _openLab.font = [UIFont systemFontOfSize:10];
    _openLab.text = @" ";
    _openLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_openLab];
    [_openLab makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(self);
        make.centerX.equalTo(self);
    }];
    
    _openLab.userInteractionEnabled=YES;
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTouchUpInside:)];
    
    [_openLab addGestureRecognizer:labelTapGestureRecognizer];
    
    UIView* bottomLine1 = [[UIView alloc] init];
    bottomLine1.backgroundColor = [UIColor darkGrayColor];
    [self addSubview:bottomLine1];
    [bottomLine1 makeConstraints:^(MASConstraintMaker* make){
        make.centerX.equalTo(self);
        make.top.equalTo(_openLab.bottom).equalTo(5);
        make.width.equalTo(kScreenWidth);
        make.height.equalTo(0.5);
    }];
    
    UILabel* chLab = [[UILabel alloc] init];
    chLab.font = [UIFont systemFontOfSize:15];
    chLab.text = @"餐盒";
    chLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:chLab];
    [chLab makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(bottomLine1.bottom).equalTo(10);
        make.left.equalTo(self).equalTo(10);
    }];
    
    _chfLab = [[UILabel alloc] init];
    _chfLab.font = [UIFont systemFontOfSize:15];
    _chfLab.text = @"6";
    _chfLab.textColor = [UIColor redColor];
    _chfLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_chfLab];
    [_chfLab makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(bottomLine1.bottom).equalTo(10);
        make.right.equalTo(self.right).equalTo(-5);
    }];
    
    UIView* bottomLine2 = [[UIView alloc] init];
    bottomLine2.backgroundColor = [UIColor darkGrayColor];
    [self addSubview:bottomLine2];
    [bottomLine2 makeConstraints:^(MASConstraintMaker* make){
        make.centerX.equalTo(self);
        make.top.equalTo(_chfLab.bottom).equalTo(10);
        make.width.equalTo(kScreenWidth);
        make.height.equalTo(0.5);
    }];
    
    _balanceBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [_balanceBtn setTitle:@"去结算" forState:UIControlStateNormal];
    _balanceBtn.backgroundColor = [UIColor greenColor];
    [_balanceBtn addTarget:self action:@selector(balanceBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_balanceBtn];
    [_balanceBtn makeConstraints:^(MASConstraintMaker* make){
        make.top.equalTo(bottomLine2).equalTo(10);
        make.right.equalTo(self.right).equalTo(-5);
        make.width.equalTo(70);
    }];
    
    _CountMoneyLab = [[UILabel alloc] init];
    _CountMoneyLab.font = [UIFont systemFontOfSize:15];
    _CountMoneyLab.text = @"总计¥100.0";
    _CountMoneyLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_CountMoneyLab];
    [_CountMoneyLab makeConstraints:^(MASConstraintMaker* make){
        make.right.equalTo(_balanceBtn.left).equalTo(-5);
        make.centerY.equalTo(_balanceBtn);
    }];
    
}

-(void)labelTouchUpInside:(UILabel*)sender
{
    
    if ([_openLab.text isEqual:@"展开"]) {
        _openLab.text = @"收起";
        if (_openTouch) {
            _openTouch(true);
        }
        
    }else if([_openLab.text isEqual:@"收起"])
    {
        _openLab.text = @"展开";
        if (_openTouch) {
            _openTouch(false);
        }
    }
    
    
    
}

-(void)balanceBtn:(id)sender
{
    if (_pushVC) {
        _pushVC();
    }
}

@end
