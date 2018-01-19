//
//  DoraExerciseViewControllerTableViewController.h
//  SweetyFit
//
//  Created by Dora Zhao on 17/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoraExerciseTableSectionData.h"
#import "DoraExerciseTableViewCell.h"

@interface DoraExerciseViewController : UITableViewController <UISearchBarDelegate, UISearchResultsUpdating>

@property(strong, nonatomic) UISearchController *searchController;
@property(strong, nonatomic) NSArray <DoraExerciseTableSectionData *> *listItems;
@property(strong, nonatomic) NSMutableArray <DoraExerciseTableSectionData *> *listFilterItems;

- (void)filterContentForSearchText:(NSString *) searchText scope:(NSUInteger) scope;

@end
