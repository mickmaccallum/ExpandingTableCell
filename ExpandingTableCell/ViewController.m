

#import "ViewController.h"

@interface ViewController () < UITableViewDataSource, UITableViewDelegate >

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

#warning This method supports multiple selection as well. Simply uncomment the line below to enable it.

//	[self.tableView setAllowsMultipleSelection:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Compares the index path for the current cell to the index path stored in the expanded
    // index path variable. If the two match, return a height of 100 points, otherwise return
    // a height of 44 points.
	if ([tableView indexPathsForSelectedRows].count > 0) {
		if ([[tableView indexPathsForSelectedRows] indexOfObject:indexPath] != NSNotFound) {
			return 100.0; // Expanded height
		}
	}

    return 44.0; // Normal height
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"CELLID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView beginUpdates]; // tell the table you're about to start making changes

    [tableView endUpdates]; // tell the table you're done making your changes
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView beginUpdates]; // tell the table you're about to start making changes

    [tableView endUpdates]; // tell the table you're done making your changes
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
