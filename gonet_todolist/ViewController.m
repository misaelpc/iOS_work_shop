//
//  ViewController.m
//  gonet_todolist
//
//  Created by Misael Pérez Chamorro on 5/23/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *taskTable;

@property (weak, nonatomic) IBOutlet UITextField *taskFiled;

@property (weak, nonatomic) IBOutlet UIButton *insertButton;

@property (nonatomic) NSMutableArray *tasks;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tasks = [NSMutableArray array];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];
}


- (IBAction)insertButtonWasTouchUpInside:(id)sender {
  NSString *text = [self.taskFiled text];
  
  if ([text length] == 0) {
    return;
  }
  NSLog(@"Task entered: %@", text);
  [self.tasks addObject:text];
  [self.taskTable reloadData];
  [self.taskFiled setText:@""];
  [self.taskFiled resignFirstResponder];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  return [self.tasks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell *cell = [self.taskTable dequeueReusableCellWithIdentifier:@"Cell"];
  NSString *item = [self.tasks objectAtIndex:indexPath.row];
  cell.textLabel.text = item;
  return cell;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
