#import "MenubarController.h"
#import "StatusItemView.h"


@implementation MenubarController
@synthesize statusItemView = _statusItemView;

#pragma mark -

- (id)init
{
        // Install status item into the menu bar
   
   // _statusItemView.image = [NSImage imageNamed:@"switchIcon.png"];
   // [_statusItemView.image setTemplate:YES];

    self = [super init];
    if (self != nil)
    {
        // Install status item into the menu bar
        //DARK//  self.menubarController = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
       //CGI// NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:STATUS_ITEM_VIEW_WIDTH];
        NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:STATUS_ITEM_VIEW_WIDTH];
        _statusItemView = [[StatusItemView alloc] initWithStatusItem:statusItem];
        _statusItemView.image = [NSImage imageNamed:@"Status"];
        [_statusItemView.image setTemplate:YES];
        _statusItemView.alternateImage = [NSImage imageNamed:@"StatusHighlighted"];
        _statusItemView.action = @selector(togglePanel:);
    }
    return self;
}



- (void)dealloc
{
    [[NSStatusBar systemStatusBar] removeStatusItem:self.statusItem];
}

#pragma mark -
#pragma mark Public accessors

- (NSStatusItem *)statusItem
{
    return self.statusItemView.statusItem;
}

#pragma mark -



@end
