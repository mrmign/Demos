//
//  SecondViewController.m
//  TableViewReuseCell
//
//  Created by armingli on 16/2/23.
//  Copyright © 2016年 armingli. All rights reserved.
//

#import "SecondViewController.h"
#import "CustomTableViewCell.h"
#import "CommonCell.h"
@interface SecondViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SecondViewController

- (void)loadView
{
    [super loadView];
//    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"CustomCell"];
    [self.tableView registerClass:[CommonCell class] forCellReuseIdentifier:@"Cell"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear %@", [[self.tableView subviews][0] subviews]);
    [self.tableView reloadData];
}
- (IBAction)reloadTableView:(id)sender {
    [self.tableView reloadData];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;
    switch (section) {
        case 0:
            rows = 1;
            break;
        case 1:
            rows = 3;
            break;
        case 2:
            rows = 2;
            break;
        default:
            break;
    }
    return rows;
    
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"0.Current IndexPath: %@", indexPath);
//    NSLog(@"1.tableViewSubViews Before dequeue:%@", [[tableView subviews][0] subviews]);
//    CommonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
//    NSLog(@"2.dequeueReusableCell:%@", cell);
//    NSLog(@"3.tableViewSubViews After dequeue:%@", [[tableView subviews][0] subviews]);
//    NSString *title = [NSString stringWithFormat:@"Section %zi, Row %zi", indexPath.section ,indexPath.row];
//    if (indexPath.section == 0) {
//        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell0"];
//        if (cell == nil) {
//            cell = [[CommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell0"];
//        }
//        cell.textLabel.text = title;
//    }
//    else if (indexPath.section == 1) {
//        CustomTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
//        if (customCell == nil) {
//            customCell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CustomCell"];
//        }
//        customCell.titleLabel.text = title;
//        customCell.tag = 2000+indexPath.row;
//        return customCell;
//    }
//    else {
//        cell.tag = 3000 + indexPath.row;
//    }
//    cell.textLabel.text = title;
//    return cell;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    NSString *title = [NSString stringWithFormat:@"Section %zi, Row %zi", indexPath.section ,indexPath.row];
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell0"];
        if (cell == nil) {
            cell = [[CommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell0"];
        }
        cell.textLabel.text = title;
    }
    else if (indexPath.section == 1) {
        CustomTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
        if (customCell == nil) {
            customCell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CustomCell"];
        }
        customCell.titleLabel.text = title;
        customCell.tag = 2000+indexPath.row;
        return customCell;
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (cell == nil) {
            cell = [[CommonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        }
        cell.tag = 3000 + indexPath.row;
    }
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tableView All Cells %@", [[tableView subviews][0] subviews]);
}

@end
