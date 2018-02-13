//
//  DoraExerciseViewControllerTableViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 17/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraExerciseViewController.h"
//#import "DoraSearchController.h"

@interface DoraExerciseViewController ()
@property(nonatomic, strong) NSMutableArray<DoraExerciseTableSectionData*> *DoraExerciseTableData;
@end

@implementation DoraExerciseViewController  {
    float btnW;
    float btnH;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    btnW = (DoraScreenWidth - 45) / 2;
    btnH = btnW * 0.6;

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self createData];
    
    UIView *searchViewContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DoraScreenWidth, 50)];
    UIButton *goToSearch = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, DoraScreenWidth-10, 40)];
    [searchViewContainer addSubview:goToSearch];
    
    self.tableView.tableHeaderView = searchViewContainer;
}

#pragma mark - Dora Functions

-(void) createData {
    self.DoraExerciseTableData = [[NSMutableArray alloc] init];
    
    NSArray *bodyResionNames = @[@"腹部塑形", @"腰部力量", @"腿部塑形", @"手臂塑形", @"全身舒展"];
    
    // create five sections' data
    for (int i = 0; i < 5; ++i) {
        DoraExerciseTableSectionData *sectionData = [DoraExerciseTableSectionData createSectionData];
        sectionData.sectionName = bodyResionNames[i];
        sectionData.sectionData = [[NSMutableArray alloc] init];
        
        // create 12 cells' data
        for (int j = 0; j < 6; ++j) {
            DoraExerciseTableCellData *cellData = [DoraExerciseTableCellData createCellData];
            
            cellData.leftButton = [DoraExerciseTableCellButtonData createButtonData];
            cellData.rightButton = [DoraExerciseTableCellButtonData createButtonData];
            
            cellData.leftButton.exerciseImage = [UIImage imageNamed:@"placeholder.JPG"];
            cellData.leftButton.exerciseName = @"西西里卷腹1";
            cellData.leftButton.exerciseTime = @"12'";
            cellData.leftButton.exerciseLevel = @"S2";
            cellData.leftButton.exerciseCalorie = @"76Kcal";
            
            cellData.rightButton.exerciseImage = [UIImage imageNamed:@"placeholder.JPG"];
            cellData.rightButton.exerciseName = @"西西里卷腹2";
            cellData.rightButton.exerciseTime = @"10'";
            cellData.rightButton.exerciseLevel = @"S2";
            cellData.rightButton.exerciseCalorie = @"76Kcal";
            
            [sectionData.sectionData addObject:cellData];
        }
        
        [_DoraExerciseTableData addObject:sectionData];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _DoraExerciseTableData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _DoraExerciseTableData[section].sectionData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return btnH + 10;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _DoraExerciseTableData[section].sectionName;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifer = @"exerciseCell";

    DoraExerciseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    if (cell == nil) {
        cell = [[DoraExerciseTableViewCell  alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer];
    }
    
    DoraExerciseTableCellData *tempData = _DoraExerciseTableData[indexPath.section].sectionData[indexPath.row];
    DoraExerciseTableCellButtonData *leftButton = tempData.leftButton;
    DoraExerciseTableCellButtonData *rightButton = tempData.rightButton;
    
    cell.leftExercise.exerciseCalorie.text = leftButton.exerciseCalorie;
    cell.leftExercise.exerciseName.text = leftButton.exerciseName;
    cell.leftExercise.exerciseTime.text = leftButton.exerciseTime;
    cell.leftExercise.exerciseLevel.text = leftButton.exerciseLevel;
    [cell.leftExercise setBackgroundImage:leftButton.exerciseImage forState:UIControlStateNormal];

    cell.rightExercise.exerciseCalorie.text = rightButton.exerciseCalorie;
    cell.rightExercise.exerciseName.text = rightButton.exerciseName;
    cell.rightExercise.exerciseTime.text = rightButton.exerciseTime;
    cell.rightExercise.exerciseLevel.text = rightButton.exerciseLevel;
    [cell.rightExercise setBackgroundImage:rightButton.exerciseImage forState:UIControlStateNormal];

    return cell;
}
@end








