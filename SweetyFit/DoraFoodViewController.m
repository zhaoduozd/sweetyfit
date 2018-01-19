//
//  DoraFoodViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 19/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraFoodViewController.h"

@interface DoraFoodViewController ()

@end

@implementation DoraFoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.DoraFoodTableData = [[NSMutableArray alloc] init];
    [self createData];
    
}

-(void) createData {
    self.DoraFoodTableData = [[NSMutableArray alloc] init];
    NSArray *sectionNames = @[@"水果", @"蔬菜", @"谷物", @"肉类", @"奶制品"];
    
    for (int i = 0; i < sectionNames.count; ++i) {
        DoraFoodTableSectionData *sectionData = [DoraFoodTableSectionData createSectionData];
        sectionData.sectionData = [[NSMutableArray alloc] init];
        sectionData.sectionName = sectionNames[i];
        
        for (int j = 0; j < 8; ++j) {
            DoraFoodTableCellData *cellData = [DoraFoodTableCellData createFoodCellData];
            cellData.foodName = @"橙子";
            cellData.foodImage = [UIImage imageNamed:@"fruit.jpg"];
            cellData.foodCalorie = @"50Kcal/100g";
            cellData.foodDetail = @"富含维生素C";
            
            [sectionData.sectionData addObject:cellData];
        }
        
        [self.DoraFoodTableData addObject:sectionData];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.DoraFoodTableData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.DoraFoodTableData[section].sectionData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.DoraFoodTableData[section].sectionName;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123" forIndexPath:indexPath];
    
    if (cell == nil) {
      //  cell = [UITableViewCell ]
    }
    
    return cell;
}



@end
