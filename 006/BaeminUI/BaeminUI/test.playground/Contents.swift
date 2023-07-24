import UIKit

var a = 0
var b = 0

func aUp() -> Bool {
    a += 1
    return true
}

func bUp() -> Bool {
    b += 1
    return false
}

aUp() || bUp()

print(a)
print(b)
