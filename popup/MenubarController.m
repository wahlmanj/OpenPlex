#import "MenubarController.h"
#import "StatusItemView.h"


@implementation MenubarController
@synthesize statusItemView = _statusItemView;

#pragma mark -

- (id)init
{
    // Install status item into the menu bar
    
    self = [super init];
    if (self != nil)
    {
        // Install status item into the menu bar
        
        //////////////////////////FIRST IMAGE ROUTE//////////////////////////
        //////////////////////////FIRST IMAGE ROUTE//////////////////////////
        
        //DARK//  self.menubarController = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
        //CGI// NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:STATUS_ITEM_VIEW_WIDTH];
        NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:STATUS_ITEM_VIEW_WIDTH];
        _statusItemView = [[StatusItemView alloc] initWithStatusItem:statusItem];
        _statusItemView.image = [NSImage imageNamed:@"Status"];
        [_statusItemView.image setTemplate:YES];
        _statusItemView.alternateImage = [NSImage imageNamed:@"StatusHighlighted"];
        _statusItemView.action = @selector(togglePanel:);
        
        //////////////////////////FIRST IMAGE ROUTE//////////////////////////
        //////////////////////////FIRST IMAGE ROUTE//////////////////////////
    }
    return self;
}

- (void)dealloc
{
    [[NSStatusBar systemStatusBar] removeStatusItem:self.statusItem];
}

- (NSStatusItem *)statusItem
{
    return self.statusItemView.statusItem;
}

// Switch icon to other view when clicked

- (BOOL)hasActiveIcon
{
    return self.statusItemView.isHighlighted;
}

- (void)setHasActiveIcon:(BOOL)flag
{
    self.statusItemView.isHighlighted = flag;
}

@end
