//
//  DoraExerciseViewControllerTableViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 17/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraExerciseViewController.h"
#import "DoraExerciseTableSectionData.h"
#import "DoraExerciseTableViewCell.h"

@interface DoraExerciseViewController ()
@property(nonatomic, strong) NSMutableArray<DoraExerciseTableSectionData*> *DoraExerciseTableData;
@end

@implementation DoraExerciseViewController  {
    float btnW;
    float btnH;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createData];
    
    btnW = (DoraScreenWidth - 45) / 2 *0.6;
    btnH = btnW * 0.6;
}

#pragma mark - Dora Functions

-(void) createData {
    self.DoraExerciseTableData = [[NSMutableArray alloc] init];
    
    NSArray *bodyResionNames = @[@"腹部塑形", @"腰部力量", @"腿部塑形", @"手臂塑形", @"全身舒展"];
    NSLog(@"bodyResionNames count %lu", bodyResionNames.count);
    
    // create five sections' data
    for (int i = 0; i < 5; ++i) {
        DoraExerciseTableSectionData *sectionData = [DoraExerciseTableSectionData createSectionData];
        sectionData.sectionName = bodyResionNames[i];
        sectionData.sectionData = [[NSMutableArray alloc] init];
        
        // create 12 cells' data
        for (int j = 0; j < 12; ++j) {
            DoraExerciseTableCellData *cellData = [DoraExerciseTableCellData createCellData];
            
            cellData.leftButton.exerciseImage = [UIImage imageNamed:@"placeholder.jpg"];
            cellData.leftButton.exerciseName = @"西西里卷腹";
            cellData.leftButton.exerciseTime = @"10'";
            cellData.leftButton.exerciseLevel = @"S2";
            cellData.leftButton.exerciseCalorie = @"76Kcal";
            
            cellData.rightButton.exerciseImage = [UIImage imageNamed:@"placeholder.jpg"];
            cellData.rightButton.exerciseName = @"西西里卷腹";
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
    NSLog(@"complete set section number %lu", _DoraExerciseTableData.count);
    return _DoraExerciseTableData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"complete set row number %lu", _DoraExerciseTableData[section].sectionData.count);
    return _DoraExerciseTableData[section].sectionData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSLog(@"complete set section name %@", _DoraExerciseTableData[section].sectionName);
    return _DoraExerciseTableData[section].sectionName;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifer = @"exerciseCell";
    NSLog(@"start to set section cell");

    DoraExerciseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    DoraExerciseTableCellData *tempData = _DoraExerciseTableData[indexPath.section].sectionData[indexPath.row];
    
    if (cell == nil) {
        DoraExerciseTableViewCell *cell = [[DoraExerciseTableViewCell  alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer];
    }
    
    DoraExerciseTableCellButtonData *leftButton = tempData.leftButton;
    DoraExerciseTableCellButtonData *rightButton = tempData.rightButton;
    
    cell.leftExercise = [UIButton DoraCreateBlackMaskBigButtonWithWidth:btnW Height:btnH borderRaduis:4 titleText:leftButton.exerciseName detailTextTime:leftButton.exerciseTime detailTextCalorie:leftButton.exerciseCalorie imageBackground:leftButton.exerciseImage];
    cell.leftExercise.frame = CGRectMake(15, 5, btnW, btnH);
    
    cell.rightExercise = [UIButton DoraCreateBlackMaskBigButtonWithWidth:btnW Height:btnH borderRaduis:4 titleText:rightButton.exerciseName detailTextTime:rightButton.exerciseTime detailTextCalorie:rightButton.exerciseCalorie imageBackground:rightButton.exerciseImage];
    cell.rightExercise.frame = CGRectMake(25 + btnW, 5, btnW, btnH);
    
    NSLog(@"complete set section cell");

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
