#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if (array == nil || array.count == 0) {
        return @[];
    }
    NSMutableArray<NSNumber*> *numbers = [NSMutableArray new];
    NSMutableArray<NSString*> *strings = [NSMutableArray new];
    for (int i = 0; i < array.count; i++) {
        if (![array[i] isKindOfClass:[NSArray class]]) {
            return @[];
        }
        for (int j = 0; j < array[i].count; j++) {
            if (([array[i][j] isKindOfClass:[NSString class]])) {
                [strings addObject:array[i][j]];
            }
            if ([array[i][j] isKindOfClass:[NSNumber class]]) {
                [numbers addObject:array[i][j]];
            }
        }
    }
    if (strings.count == 0) {
        return [numbers sortedArrayUsingComparator: ^(id obj1, id obj2) {
            if ([obj1 integerValue] > [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
    }
    if (numbers.count == 0) {
        return [strings sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    }
    NSArray<NSNumber*> *sortedNumbers = [numbers sortedArrayUsingComparator: ^(id obj1, id obj2) {
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    NSSortDescriptor *sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: NO];
    [strings sortUsingDescriptors:[NSArray arrayWithObject: sortOrder]];
    
    return [NSArray arrayWithObjects:sortedNumbers, strings, nil];
}

@end
