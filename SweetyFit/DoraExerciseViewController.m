//
//  DoraExerciseViewControllerTableViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 17/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraExerciseViewController.h"
#import "ExerciseUnitDataModel.h"
#import "ExerciseTableDataModel.h"

@interface DoraExerciseViewController ()
@property(nonatomic, strong) NSMutableArray *simulationData;
@end

@implementation DoraExerciseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createData];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Dora Functions

-(void) createData {
    NSArray *bodyResionNames = @[@"腹部塑形", @"腰部力量", @"腿部塑形", @"手臂塑形", @"全身舒展"];
    for (int i = 0; i < 5; ++i) {
        ExerciseTableDataModel *dataModel = [ExerciseTableDataModel section];
        ExerciseUnitDataModel *unitDataModel = [ExerciseUnitDataModel unitData];
        unitDataModel.exerciseName = @"西西里卷腹";
        unitDataModel.exerciseTime = @"10分钟";
        unitDataModel.exerciseLevel = @"S2";
        unitDataModel.exerciseCalorie = @"76Kcal";
        
        dataModel.exerciseBodyRegion = bodyResionNames[i];
        for (int j = 0; j < 12; ++j) {
            [dataModel.exerciseBodyRegionData addObject:unitDataModel];
        }
        
        [_simulationData addObject:dataModel];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _simulationData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ExerciseTableDataModel *tempData = [_simulationData objectAtIndex:section];
    return tempData.exerciseBodyRegionData.count/2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    ExerciseTableDataModel *tempData = [_simulationData objectAtIndex:section];
    NSLog(@"123");
    return tempData.exerciseBodyRegion;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"exerciseItem" forIndexPath:indexPath];
 
    
 
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
