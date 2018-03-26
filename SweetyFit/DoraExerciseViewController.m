//
//  DoraExerciseViewControllerTableViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 17/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraExerciseViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
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
    [self ObtainData];
}

#pragma mark - Dora Functions

- (void) ObtainData {
    __weak DoraExerciseViewController *weakself = self;
    
    NSString *urlstring = [serverurl stringByAppendingString:@"/ui/exercise"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlstring parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        
        [weakself SolveData:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    
}

-(NSString *) MapRegionName:(NSString *) name {
    NSString *result = @"";
    
    if ([name isEqualToString:@"all"]) {
        result = @"全身运动";
    } else if ([name isEqualToString:@"neck"]) {
        result = @"颈部舒展";
    } else if ([name isEqualToString:@"shoulder"]) {
        result = @"肩部训练";
    } else if ([name isEqualToString:@"arm"]) {
        result = @"颈手臂塑形";
    } else if ([name isEqualToString:@"chest"]) {
        result = @"胸部增肌";
    } else if ([name isEqualToString:@"ventral"]) {
        result = @"腹部塑形";
    } else if ([name isEqualToString:@"back"]) {
        result = @"背部强健";
    } else if ([name isEqualToString:@"hip"]) {
        result = @"臀部塑形";
    } else if ([name isEqualToString:@"leg"]) {
        result = @"腿部塑形";
    }
    
    return result;
}

-(void) SolveData:(id) reponseObject {
    self.DoraExerciseTableData = [[NSMutableArray alloc] init];
    NSArray *rawdata = [[NSArray alloc] initWithArray:(NSArray *)reponseObject];
    NSArray *bodyResionNames = @[@"全身运动", @"颈部舒展", @"肩部训练", @"手臂塑形", @"背部强健", @"胸部增肌", @"腹部塑形", @"臀部塑形", @"腿部塑形"];
    NSArray *bodyename = @[@"all", @"neck", @"shoulder", @"arm", @"back", @"chest", @"ventral", @"hip", @"leg"];
    
    // create 9 sections
    for (NSUInteger i = 0; i < [bodyResionNames count]; ++i) {
        DoraExerciseTableSectionData *sectionData = [DoraExerciseTableSectionData createSectionData];
        sectionData.sectionName = bodyResionNames[i];
        sectionData.sectionData = [[NSMutableArray alloc] init];
        NSMutableArray *regionData = [[NSMutableArray alloc] init];
        
        for (NSUInteger j = 0; j < [rawdata count]; ++j) {
            if ([[bodyename objectAtIndex:i] isEqualToString:[[rawdata objectAtIndex:j] objectForKey:@"regionname"]]) {
                regionData = [[rawdata objectAtIndex:j] objectForKey:@"actions"];
            }
        }
        
        for (NSUInteger j = 0; j < [regionData count]; j += 2) {
            NSDictionary *leftData = [[NSDictionary alloc] initWithDictionary:[regionData objectAtIndex:j]];
            DoraExerciseTableCellData *cellData = [DoraExerciseTableCellData createCellData];

            cellData.leftButton = [DoraExerciseTableCellButtonData createButtonData];
            cellData.rightButton = [DoraExerciseTableCellButtonData createButtonData];

            cellData.leftButton.exerciseImage = [UIImage imageNamed:@"placeholder"];
            cellData.leftButton.exerciseName = [leftData objectForKey:@"name"];
            cellData.leftButton.exerciseTime = [leftData objectForKey:@"time"];
            cellData.leftButton.exerciseCalorie = [leftData objectForKey:@"calorie"];
            
            NSString *urlstring = [@"http://120.77.42.160:3000/resource/acionimg?aid=%@" stringByAppendingString:[leftData objectForKey:@"gifname"]];
        
            NSURL *urlimg = [[NSURL alloc] initWithString:urlstring];

            if (j + 1 < [regionData count]) {
                NSDictionary *rightData = [[NSDictionary alloc] initWithDictionary:[regionData objectAtIndex:j+1]];
                cellData.rightButton.exerciseImage = [UIImage imageNamed:@"placeholder"];
                cellData.rightButton.exerciseName = [rightData objectForKey:@"name"];
                cellData.rightButton.exerciseTime = [rightData objectForKey:@"time"];
                cellData.rightButton.exerciseCalorie =[rightData objectForKey:@"calorie"];
            } else {
                cellData.rightButton.exerciseName = @"";
            }
            
            [sectionData.sectionData addObject:cellData];
        }
        
        [_DoraExerciseTableData addObject:sectionData];
    }
    [self.tableView reloadData];
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

    //DoraExerciseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    //if (cell == nil) {
    DoraExerciseTableViewCell *cell = [[DoraExerciseTableViewCell  alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer];
    //}
    
    DoraExerciseTableCellData *tempData = _DoraExerciseTableData[indexPath.section].sectionData[indexPath.row];
    DoraExerciseTableCellButtonData *leftButton = tempData.leftButton;
    DoraExerciseTableCellButtonData *rightButton = tempData.rightButton;
    
    cell.leftExercise.exerciseCalorie.text = leftButton.exerciseCalorie;
    cell.leftExercise.exerciseName.text = leftButton.exerciseName;
    cell.leftExercise.exerciseTime.text = leftButton.exerciseTime;
    cell.leftExercise.exerciseLevel.text = leftButton.exerciseLevel;
    [cell.leftExercise setBackgroundImage:leftButton.exerciseImage forState:UIControlStateNormal];

    if ([rightButton.exerciseName isEqualToString:@""]) {
        cell.rightExercise.hidden = YES;
    } else {
        cell.rightExercise.exerciseCalorie.text = rightButton.exerciseCalorie;
        cell.rightExercise.exerciseName.text = rightButton.exerciseName;
        cell.rightExercise.exerciseTime.text = rightButton.exerciseTime;
        cell.rightExercise.exerciseLevel.text = rightButton.exerciseLevel;
        [cell.rightExercise setBackgroundImage:rightButton.exerciseImage forState:UIControlStateNormal];
    }
    
    return cell;
}
@end








