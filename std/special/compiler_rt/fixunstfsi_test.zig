const __fixunstfsi = @import("fixunstfsi.zig").__fixunstfsi;
const assert = @import("../../debug.zig").assert;

fn test__fixunstfsi(a: f128, expected: u32) {
    const x = __fixunstfsi(a);
    assert(x == expected);
}

const inf128 = @bitCast(f128, u128(0x7fff0000000000000000000000000000));

test "fixunstfsi" {
    test__fixunstfsi(inf128, 0xffffffff);
    test__fixunstfsi(0, 0x0);
    //TODO test__fixunstfsi(0x1.23456789abcdefp+5, 0x24);
    test__fixunstfsi(0x1.23456789abcdefp-3, 0x0);
    //TODO test__fixunstfsi(0x1.23456789abcdefp+20, 0x123456);
    test__fixunstfsi(0x1.23456789abcdefp+40, 0xffffffff);
    test__fixunstfsi(0x1.23456789abcdefp+256, 0xffffffff);
    test__fixunstfsi(-0x1.23456789abcdefp+3, 0x0);

    test__fixunstfsi(0x1.p+32, 0xFFFFFFFF);
}