#import "MenubarController.h"
#import "PanelController.h"

@interface ApplicationDelegate : NSObject <NSApplicationDelegate, PanelControllerDelegate>

@property (nonatomic, strong) MenubarController *menubarController;
@property (nonatomic, strong, readonly) PanelController *panelController;
@property (strong, nonatomic) NSStatusItem *statusItem;
@property (assign, nonatomic) BOOL darkModeOn;
@property (weak) IBOutlet NSWindow *window;

- (IBAction)togglePanel:(id)sender;

@end