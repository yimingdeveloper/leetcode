## Leetcode 408

### Valid Word Abbreviation

#### Solution 1: Two Pointers

这个题双指针可解。两个指针从左往右扫，如果都是字母且一致就跳过。如果都是字母且不一致就 return false。如果遇到数字，先把数字 parse 出来，然后 pointer 向后 skip 数字长度，继续判断直到世界的尽头。

```
class Solution {
    public boolean validWordAbbreviation(String word, String abbr) {
        int p1 = 0, p2 = 0;
        while (p1 < word.length() && p2 < abbr.length()) {
            char c = abbr.charAt(p2);
            if (Character.isLetter(c)) {
                if (c != word.charAt(p1))
                    return false;
                p1 ++;
                p2 ++;
            } else {
                int num = 0;
                if (abbr.charAt(p2) == '0') return false;
                while (p2 < abbr.length() && Character.isDigit(abbr.charAt(p2))) {
                    num = num * 10 + (abbr.charAt(p2) - '0');
                    p2 ++;
                }
                p1 += num;
            }
        }
        return p2 == abbr.length() && p1 == word.length();
    }
}
```

Time: O(n)
Space: O(1)
