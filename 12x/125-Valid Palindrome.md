## Leetcode 125

### Valid Palindrome

#### Solution 1: Two Pointers

两边往里扫。

```
class Solution {
    public boolean isPalindrome(String s) {
        int len = s.length();
        int p1 = 0, p2 = len - 1;
        while (p1 < p2) {
             while (p1 < p2 && !Character.isLetterOrDigit(s.charAt(p1))) p1 ++;
             while (p1 < p2 && !Character.isLetterOrDigit(s.charAt(p2))) p2 --;
             if (p1 < p2) {
                char ch1 = Character.toLowerCase(s.charAt(p1 ++));
                char ch2 = Character.toLowerCase(s.charAt(p2 --));
                if (ch1 != ch2) return false;
             }
        }
        return true;
    }
}
```

Time: O(n)
Space: O(1)
