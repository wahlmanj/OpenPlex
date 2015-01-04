//#define STATUS_ITEM_VIEW_WIDTH 24.0
//#import <Cocoa/Cocoa.h>
//#pragma mark -

//@class StatusItemView;

//@interface MenubarController : NSObject {
//@private
//    StatusItemView *_statusItemView;
//}

//@property (nonatomic) BOOL hasActiveIcon;
//@property (nonatomic, strong, readonly) NSStatusItem *statusItem;
//@property (nonatomic, strong, readonly) StatusItemView *statusItemView;
//@property (assign, nonatomic) BOOL darkModeOn;
//@property (weak) IBOutlet NSWindow *window;
//@end


#define STATUS_ITEM_VIEW_WIDTH 24.0

#pragma mark -

@class StatusItemView;

@interface MenubarController : NSObject {
@private
    StatusItemView *_statusItemView;
}

@property (nonatomic) BOOL hasActiveIcon;
@property (nonatomic, strong, readonly) NSStatusItem *statusItem;
@property (nonatomic, strong, readonly) StatusItemView *statusItemView;

@end
