

#import "ObjCViewController.h"

@interface ObjCViewController () < UITableViewDataSource, UITableViewDelegate >
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ObjCViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

	[self.tableView setAllowsMultipleSelection:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray<NSIndexPath *> *selectedRows = [tableView indexPathsForSelectedRows];
    if (selectedRows && [selectedRows containsObject:indexPath]) {

        return 100.0; // Expanded height
    }

    return 44.0; // Normal height
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"ObjCCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID
                                                            forIndexPath:indexPath];

    cell.textLabel.text = [NSString stringWithFormat:@"row %li", (long)indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"section %li", (long)indexPath.section];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self updateTableView];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self updateTableView];
}

- (void)updateTableView
{
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
