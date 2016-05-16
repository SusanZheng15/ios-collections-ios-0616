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

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary
{
    NSMutableArray *hobbits = [[NSMutableArray alloc] init];
    
    for (NSString *key in dictionary)
    {
        if ([dictionary[key] isEqualToString:@"hobbit"])
        {
            [hobbits addObject:key];
        }
    }
    
    return [NSArray arrayWithArray:hobbits];
}

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array
{
    
    NSPredicate *beginsWithAPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    NSArray *beginsWithA = [array filteredArrayUsingPredicate:beginsWithAPredicate];
    
    return beginsWithA;
}


- (NSInteger)sumOfIntegersInArray:(NSArray *)integers;
{
        NSInteger sum = 0;
    
        for (NSNumber *total in integers)
        {
                sum += [total integerValue];
        }
    
        return sum;
}


-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array
{
    NSMutableArray *plurals = [[NSMutableArray alloc] init];
    
    for (NSString *singular in array)
    {
        NSString *plural = @"";
        if ([singular containsString:@"oo"])
        {
            plural = [singular stringByReplacingOccurrencesOfString:@"oo" withString:@"ee"];
        } else if ([singular containsString:@"ox"])
        {
            if ([singular hasPrefix:@"b"])
            {
                plural = [singular stringByAppendingString:@"es"];
            } else
            {
                plural = [singular stringByAppendingString:@"en"];
            }
        }
        else if ([singular hasSuffix:@"us"])
        {
            plural = [singular stringByReplacingOccurrencesOfString:@"us" withString:@"i"];
        }
        else if ([singular hasSuffix:@"um"])
        {
            plural = [singular stringByReplacingOccurrencesOfString:@"um" withString:@"a"];
        }
        else
        {
            plural = [singular stringByAppendingString:@"s"];
        }
        
        [plurals addObject:plural];
    }
    
    return [NSArray arrayWithArray:plurals];
}


-(NSDictionary *)countsOfWordsInString:(NSString *)string
{
    NSArray *punctuationStrings = @[@".", @",", @";", @"-"];
    
    NSString *noPunctuation = string;
    
    for (NSString *punctuation in punctuationStrings)
    {
        noPunctuation = [noPunctuation stringByReplacingOccurrencesOfString:punctuation withString:@""];
    }
    
    NSString *lowercaseNoPunctuation = [noPunctuation lowercaseString];
    
    NSArray *arrayOfWords = [lowercaseNoPunctuation componentsSeparatedByString:@" "];
    
    NSMutableDictionary *countsOfWords = [[NSMutableDictionary alloc] init];
    
    for (NSString *word in arrayOfWords)
    {
        if ([countsOfWords[word] integerValue] > 0)
        {
            NSInteger newCount = [countsOfWords[word] integerValue] + 1;
            countsOfWords[word] = @(newCount);
        }
        else
        {
            countsOfWords[word] = @1;
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:countsOfWords];
}

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array
{
    NSMutableDictionary *artistsWithSongs = [[NSMutableDictionary alloc] init];
    
    for (NSString *string in array)
    {
        NSArray *artistAndSong = [string componentsSeparatedByString:@" - "];
        NSString *artist = artistAndSong[0];
        NSString *song = artistAndSong[1];
        
        if ([[artistsWithSongs allKeys] containsObject:artist])
        {
            [artistsWithSongs[artist] addObject:song];
        }
        else
        {
            artistsWithSongs[artist] = [ @[song] mutableCopy];
        }
    }
    
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    for (NSString *artist in artistsWithSongs)
    {
        [artistsWithSongs[artist] sortUsingDescriptors:@[sortByNilAsc]];
    }
    
    return [NSDictionary dictionaryWithDictionary:artistsWithSongs];
}

@end
