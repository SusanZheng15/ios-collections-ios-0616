//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSArray *) arrayBySortingArrayAscending:(NSArray *)array
{
    NSSortDescriptor *ascending = [NSSortDescriptor sortDescriptorWithKey: nil ascending: YES];
    return [array sortedArrayUsingDescriptors:@[ascending]];
}

- (NSArray *) arrayBySortingArrayDescending:(NSArray *)array
{
    NSSortDescriptor *descending = [NSSortDescriptor sortDescriptorWithKey: nil ascending: NO];
    return [array sortedArrayUsingDescriptors:@[descending]];
}

- (NSArray *) arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array
{
    NSMutableArray *swapArray = [array mutableCopy];
    [swapArray exchangeObjectAtIndex: 0 withObjectAtIndex:swapArray.count -1];
    return swapArray;
}
- (NSArray *) arrayByReversingArray:(NSArray *)array
{
    NSArray *reverseArray = [[array reverseObjectEnumerator] allObjects];
    return reverseArray;
}
- (NSString *) stringInBasicLeetFromString:(NSString *)string
{
    NSMutableString *mutString = [[NSMutableString alloc] init];
    NSDictionary *leet = @{
                            @"a" : @"4",
                            @"s" : @"5",
                            @"i" : @"1",
                            @"l" : @"1",
                            @"e" : @"3",
                            @"t" : @"7"
                          };
        for (NSUInteger i = 0; i < string.length; i++)
        {
            NSString *character = [NSString stringWithFormat:@"%c",[string characterAtIndex:i]];
            
            if ([[leet allKeys] containsObject:character])
            {
                [mutString appendString:leet[character]];
            }
            else
            {
                [mutString appendString:character];
            }
            
        }
        return mutString;
}

- (NSArray *) splitArrayIntoNegativesAndPositives:(NSArray *)array
{
    NSMutableArray *split = [[NSMutableArray alloc] init];
    NSPredicate *positives = [NSPredicate predicateWithFormat: @"self >= 0"];
    NSPredicate *negatives = [NSPredicate predicateWithFormat: @"self < 0"];
    [split addObject:[array filteredArrayUsingPredicate:negatives]];
    [split addObject:[array filteredArrayUsingPredicate:positives]];
    
    return split;
    
}

//- (NSInteger *) sumOfIntegersInArray: (NSInteger *)array
//{
    
//}

@end
