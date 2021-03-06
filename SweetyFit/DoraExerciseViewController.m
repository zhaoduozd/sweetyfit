//
//  DoraExerciseViewControllerTableViewController.m
//  SweetyFit
//
//  Created by Dora Zhao on 17/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import "DoraExerciseViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "DoraExerciseActionShowController.h"
#import "DoraExericiseTableViewCellButton.h"
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
        
        //NSLog(@"%@", responseObject);
        [weakself SolveData:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    
}

-(NSString *) MapRegionName:(NSString *) name {
    NSString *result = @"";
    
    
    if ([name isEqualToString:@"arm"]) {
        result = @"手臂塑形";
    } if ([name isEqualToString:@"shoulder"]) {
        result = @"肩部训练";
    } else if ([name isEqualToString:@"leg"]) {
        result = @"腿部塑形";
    } else if ([name isEqualToString:@"back"]) {
        result = @"背部强健";
    } else if ([name isEqualToString:@"chest"]) {
        result = @"胸部增肌";
    } else if ([name isEqualToString:@"ventral"]) {
        result = @"腹部塑形";
    } else if ([name isEqualToString:@"hip"]) {
        result = @"臀部塑形";
    } else if ([name isEqualToString:@"all"]) {
        result = @"全身运动";
    } else if ([name isEqualToString:@"neck"]) {
        result = @"颈部舒展";
    }
    
    return result;
}

-(void) SolveData:(id) reponseObject {
    self.DoraExerciseTableData = [[NSMutableArray alloc] init];
    NSArray *rawdata = [[NSArray alloc] initWithArray:(NSArray *)reponseObject];
    NSArray *bodyResionNames = @[@"腿部塑形", @"手臂塑形", @"背部强健", @"肩部训练", @"胸部增肌", @"腹部塑形", @"臀部塑形",@"全身运动", @"颈部舒展"];
    NSArray *bodyename = @[@"leg", @"arm", @"back", @"shoulder", @"chest", @"ventral", @"hip", @"all", @"neck"];
    
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
            cellData.leftButton.aid = [leftData objectForKey:@"gifname"];
            cellData.leftButton.tip = [leftData objectForKey:@"tip"];
            
            NSString *urlstring =[resourceurl stringByAppendingString:[NSString stringWithFormat:@"/action?name=%@.png",[leftData objectForKey:@"gifname"]]];
        
            NSURL *urlimg = [[NSURL alloc] initWithString:urlstring];
            cellData.leftButton.exerciseimg = urlimg;

            if (j + 1 < [regionData count]) {
                NSDictionary *rightData = [[NSDictionary alloc] initWithDictionary:[regionData objectAtIndex:j+1]];
                cellData.rightButton.exerciseImage = [UIImage imageNamed:@"placeholder"];
                cellData.rightButton.exerciseName = [rightData objectForKey:@"name"];
                cellData.rightButton.exerciseTime = [rightData objectForKey:@"time"];
                cellData.rightButton.exerciseCalorie =[rightData objectForKey:@"calorie"];
                cellData.rightButton.aid = [rightData objectForKey:@"gifname"];
                cellData.rightButton.tip = [rightData objectForKey:@"tip"];
                
                
                NSString *urlstring =[resourceurl stringByAppendingString:[NSString stringWithFormat:@"/action?name=%@.png",[rightData objectForKey:@"gifname"]]];
                
                

                NSURL *urlimg = [[NSURL alloc] initWithString:urlstring];
                cellData.rightButton.exerciseimg = urlimg;
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifer = @"exerciseCell";
    DoraExerciseTableViewCell *cell = [[DoraExerciseTableViewCell  alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer];
    
    DoraExerciseTableCellData *tempData = _DoraExerciseTableData[indexPath.section].sectionData[indexPath.row];
    
    

    DoraExerciseTableCellButtonData *leftButton = tempData.leftButton;
    DoraExerciseTableCellButtonData *rightButton = tempData.rightButton;
    
    cell.leftExercise.button.exerciseCalorie.text = [leftButton.exerciseCalorie stringByAppendingString:@"Kcal"];
    cell.leftExercise.button.exerciseName.text = leftButton.exerciseName;
    cell.leftExercise.button.exerciseTime.text = [leftButton.exerciseTime stringByAppendingString:@"秒"];
    cell.leftExercise.button.tips = leftButton.tip;
    cell.leftExercise.button.aid = leftButton.aid;
    
    [cell.leftExercise.imageview sd_setImageWithURL:leftButton.exerciseimg];
    
    [cell.leftExercise.button addTarget:self action:@selector(GotoPage:) forControlEvents:UIControlEventTouchUpInside];
    
    if ([rightButton.exerciseName isEqualToString:@""]) {
        cell.rightExercise.hidden = YES;
    } else {
        cell.rightExercise.button.exerciseCalorie.text = [rightButton.exerciseCalorie stringByAppendingString:@"Kcal"];
        cell.rightExercise.button.exerciseName.text = rightButton.exerciseName;
        cell.rightExercise.button.exerciseTime.text = [rightButton.exerciseTime stringByAppendingString:@"秒"];
        cell.rightExercise.button.tips = rightButton.tip;
        cell.rightExercise.button.aid = rightButton.aid;
        [cell.rightExercise.imageview sd_setImageWithURL:rightButton.exerciseimg];
        
        [cell.rightExercise.button addTarget:self action:@selector(GotoPage:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cell;
}

- (void) GotoPage:(id) sender {
    DoraExericiseTableViewCellButton *btn = (DoraExericiseTableViewCellButton *)sender;
    DoraExerciseActionShowController *actionpage = [[DoraExerciseActionShowController alloc] init];
    actionpage.pagetitle = btn.exerciseName.text;
    actionpage.aid = btn.aid;
    actionpage.tips = btn.tips;
    actionpage.duration = [btn.exerciseTime.text floatValue];
    
    [self.navigationController pushViewController:actionpage animated:YES];
}

@end








