#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray <NSNumber *> *)numbersArray {
    NSString *result = @"";
    if (numbersArray == nil || numbersArray.count == 0) {
        return result;
    }
    UInt8 MIN = 0;
    UInt8 MAX = 255;
    UInt8 SIZE = 4;
    UInt8 index = 0;
    UInt8 count = numbersArray.count <= SIZE ? numbersArray.count : SIZE;
    while (index < count) {
        NSNumber *item = numbersArray[index];
        if (item.intValue > MAX) {
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
        if (item.intValue < MIN) {
            return @"Negative numbers are not valid for input.";
        }
        NSString *section = item.stringValue;
        if (index < SIZE - 1) {
            section = [section stringByAppendingString:@"."];
        }
        result = [result stringByAppendingString:section];
        index += 1;
    }
    if (count < SIZE) {
        for (int k = 0; k < SIZE - count; k++) {
            NSString *adding = k == SIZE - count - 1 ? @"0" : @"0.";
            result = [result stringByAppendingString:adding];
        }
    }
    return result;
}

@end
