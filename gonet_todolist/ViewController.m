//
//  ViewController.m
//  gonet_todolist
//
//  Created by Misael Pérez Chamorro on 5/23/18.
//  Copyright © 2018 Misael Pérez Chamorro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;
@property (nonatomic) NSMutableArray *tasks;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tasks = [NSMutableArray array];
  [self setupButton];
  [self setupTextField];
  [self setupTableView];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];
}

- (void) setupTableView {
  CGRect frame = self.view.frame;
  CGRect tableFrame = CGRectMake(0, 80,      frame.size.width,
      frame.size.height - 100);
  
  self.taskTable = [[UITableView alloc] initWithFrame:tableFrame                                            style:UITableViewStylePlain];
  self.taskTable.separatorStyle = UITableViewCellSeparatorStyleNone;
  [self.taskTable registerClass:[UITableViewCell class]
         forCellReuseIdentifier:@"Cell"];
  self.taskTable.dataSource = self;
  [self.view addSubview:self.taskTable];
}

- (void) setupTextField {
  CGRect frame = self.view.frame;
  CGRect fieldFrame = CGRectMake(20,40,
                                 frame.size.width - 80,
                                 50);
  self.taskField = [[UITextField alloc] initWithFrame:fieldFrame];
  self.taskField.borderStyle = UITextBorderStyleRoundedRect;
  self.taskField.placeholder = @"Type a task";
  [self.view addSubview:self.taskField];
}

- (void) setupButton {
  CGRect frame = self.view.frame;
  CGRect buttonFrame = CGRectMake(frame.size.width - 72, 40, 72, 31);
  self.insertButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  self.insertButton.frame = buttonFrame;
  self.insertButton.tag = 5;
  [self.insertButton setTitle:@"Insert"
                     forState: UIControlStateNormal];
  
  [self.insertButton addTarget:self
                        action:@selector(addTask:)
          forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:self.insertButton];
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

//https://github.com/misaelpc/iOS_work_shop

- (void)addTask:(UIButton *)sender {
  NSString *text = [self.taskField text];
  
  if ([text length] == 0) {
    return;
  }
  NSLog(@"Task entered: %@", text);
  [self.tasks addObject:text];
  [self.taskTable reloadData];
  [self.taskField setText:@""];
  [self.taskField resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
