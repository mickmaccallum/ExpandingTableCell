

#import "ViewController.h"

@interface ViewController () < UITableViewDataSource, UITableViewDelegate >

@property (strong, nonatomic) NSIndexPath *expandedIndexPath;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController





- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView beginUpdates]; // tell the table you're about to start making changes

    // If the index path of the currently expanded cell is the same as the index that
    // has just been tapped set the expanded index to nil so that there aren't any
    // expanded cells, otherwise, set the expanded index to the index that has just
    // been selected.

    if ([indexPath compare:self.expandedIndexPath] == NSOrderedSame) {
        self.expandedIndexPath = nil;
    } else {
        self.expandedIndexPath = indexPath;
    }

    [tableView endUpdates]; // tell the table you're done making your changes
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Compares the index path for the current cell to the index path stored in the expanded
    // index path variable. If the two match, return a height of 100 points, otherwise return
    // a height of 44 points.

    if ([indexPath compare:self.expandedIndexPath] == NSOrderedSame) {
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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"CELLID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];

    return cell;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
