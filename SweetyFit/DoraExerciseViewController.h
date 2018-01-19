//
//  DoraExerciseViewControllerTableViewController.h
//  SweetyFit
//
//  Created by Dora Zhao on 17/1/2018.
//  Copyright © 2018 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoraExerciseViewController : UITableViewController
//<UISearchBarDelegate, UISearchResultsUpdating>
@property(strong, nonatomic) UISearchController *searchController;

// all of data for search
@property(strong, nonatomic) NSArray *listExercise;
// data after filtering
@property(strong, nonatomic) NSMutableArray *listFilterExercise;

@end
