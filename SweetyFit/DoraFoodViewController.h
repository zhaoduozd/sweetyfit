//
//  DoraFoodViewController.h
//  SweetyFit
//
//  Created by Dora Zhao on 19/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoraFoodTableSectionData.h"
#import "DoraFoodTableViewCell.h"
#import "DoraCommonHeader.h"

@interface DoraFoodViewController : UITableViewController
@property(nonatomic, strong) NSMutableArray <DoraFoodTableSectionData *> *DoraFoodTableData;

@end
