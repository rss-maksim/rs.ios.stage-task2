#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    NSMutableArray *oneDArray = [NSMutableArray new];
    bool hasString = false;
    bool hasNumber = false;
    for (int i = 0; i < array.count; i++) {
        if (![array[i] isKindOfClass:[NSArray class]]) {
            return @[];
        }
        for (int j = 0; j < array[i].count; j++) {
            if (!hasString && ([array[i][j] isKindOfClass:[NSString class]])) {
                hasString = true;
            }
            if (!hasNumber && [array[i][j] isKindOfClass:[NSNumber class]]) {
                hasNumber = true;
            }
            if (hasString && hasNumber) {
                return @[];
            }
            [oneDArray addObject:(id)array[i][j]];
        }
    }
    if (!hasString && hasNumber) {
        return [oneDArray sortedArrayUsingComparator: ^(id obj1, id obj2) {
         
            if ([obj1 integerValue] > [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
    }
    if (hasString && !hasNumber) {
        return [oneDArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    }
    return @[];
}

@end
