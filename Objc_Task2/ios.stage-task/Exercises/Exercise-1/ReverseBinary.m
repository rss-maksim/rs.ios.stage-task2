#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 bits = sizeof(n) * 8;
    UInt8 reverse_num = 0;
    UInt8 temp;
    for (int i = 0; i < bits; i++) {
        temp = (n & (1 << i));
        if (temp) {
            reverse_num |= (1 << ((bits - 1) - i));
        }
    }
    return reverse_num;
}
