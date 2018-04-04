//
//  DoraFoodViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 19/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraFoodViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "DoraCommonHeader.h"

@interface DoraFoodViewController ()
@property(nonatomic, copy) NSString *foodrooturl;
@end

@implementation DoraFoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _foodrooturl = [serverurl stringByAppendingString:@"/resource/foodimg?fid="];
    [self ObtainData];
}

- (void) ObtainData {
    __weak DoraFoodViewController *weakself = self;
    
    NSString *urlstring = [serverurl stringByAppendingString:@"/ui/food"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlstring parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        [weakself SolveData:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    
}

-(void) SolveData:(id) responseObject {
    _DoraFoodTableData = [[NSMutableArray alloc] init];
    NSArray *rawdata = [[NSArray alloc] initWithArray:(NSArray *)responseObject];
    NSArray *sectionNames = @[@"主食", @"蔬菜", @"水果", @"肉类", @"坚果类", @"饮品类"];
    NSArray *sectioncNames = @[@"mainfood", @"vegetable", @"fruit", @"meatfish", @"fat",@"drink"];
    
    for (NSUInteger i = 0; i < [sectionNames count]; ++i) {
        DoraFoodTableSectionData *sectionData = [DoraFoodTableSectionData createSectionData];
        sectionData.sectionName = sectionNames[i];
        sectionData.sectionData = [[NSMutableArray alloc] init];
        NSMutableArray *typeData = [[NSMutableArray alloc] init];
        
        for (NSUInteger j = 0; j < [rawdata count]; ++j) {
            if ([[sectioncNames objectAtIndex:i] isEqualToString:[[rawdata objectAtIndex:j] objectForKey:@"typename"]]) {
                typeData = [[rawdata objectAtIndex:j] objectForKey:@"foods"];
                break;
            }
        }
        
        for (NSUInteger j = 0; j < typeData.count; ++j) {
            DoraFoodTableCellData *cellData = [DoraFoodTableCellData createCellData];
            NSString *calorie = [[typeData objectAtIndex:j] objectForKey:@"calorie"];
            NSString *protein = [[typeData objectAtIndex:j] objectForKey:@"protein"];
            NSString *fat = [[typeData objectAtIndex:j] objectForKey:@"fat"];
            NSString *carbohydrate = [[typeData objectAtIndex:j] objectForKey:@"carbohydrate"];
            NSString *vitamin = [[typeData objectAtIndex:j] objectForKey:@"vitamin"];
            NSString *fiber = [[typeData objectAtIndex:j] objectForKey:@"fiber"];
            cellData.foodName = [[typeData objectAtIndex:j] objectForKey:@"name"];
            NSString *foodid = [[typeData objectAtIndex:j] objectForKey:@"id"];
            NSString *suburl = [NSString stringWithFormat:@"/resource/ffoodimg?fid=%@.png",foodid];
            NSURL *fimgurl = [NSURL URLWithString:[serverurl stringByAppendingString:suburl]];
            cellData.foodImage = fimgurl;
            
            NSString *detail1 = [NSString stringWithFormat:@"卡路里：%@Kcal/100g\n碳水化物：%@g/100g\n纤维素：%@g/100g", calorie, carbohydrate, fiber];
            NSString *detail2 = [NSString stringWithFormat:@"蛋白质：%@g/100g\n脂肪：%@g/100g\n维生素%@/100g", protein, fat, vitamin];

            cellData.foodDetail1 = detail1;
            cellData.foodDetail2 = detail2;
            
            [sectionData.sectionData addObject:cellData];
        }
        [_DoraFoodTableData addObject:sectionData];
    }
    
    NSLog(@"A/  table data:%lu", [_DoraFoodTableData count]);
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (void) reloadData {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"section num %lu", self.DoraFoodTableData.count);
    return self.DoraFoodTableData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.DoraFoodTableData[section].sectionData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.DoraFoodTableData[section].sectionName;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123" forIndexPath:indexPath];
    
    NSString *identifer = @"foodCell";
    
    DoraFoodTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    if (cell == nil) {
        cell = [[DoraFoodTableViewCell  alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer];
    }
    
    DoraFoodTableCellData *data = _DoraFoodTableData[indexPath.section].sectionData[indexPath.row];
    
    [cell.foodImage sd_setImageWithURL:data.foodImage];
    cell.foodName.text = data.foodName;
    
    NSString *detail1 = data.foodDetail1;
    NSString *detail2 = data.foodDetail2;
    
    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:detail1];
    NSMutableAttributedString *attributedString2 = [[NSMutableAttributedString alloc] initWithString:detail2];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 10;
    NSRange range1 = NSMakeRange(0, [detail1 length]);
    NSRange range2 = NSMakeRange(0, [detail2 length]);
    
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range1];
    [attributedString2 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range2];
    
    cell.foodDetail1.attributedText = attributedString1;
    cell.foodDetail1.text = data.foodDetail1;
    
    cell.foodDetail2.attributedText = attributedString2;
    cell.foodDetail2.text = data.foodDetail2;
    
    return cell;
}



@end
