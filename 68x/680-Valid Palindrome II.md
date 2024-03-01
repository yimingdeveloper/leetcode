## Leetcode 680

### Valid Palindrome II

#### Solution 1: Two Pointers

双指针从两边往里走，如果一样就继续往里走，如果不一样，删左删右各试一次，如果不是 palindrome 的话返回 false, 如果是的话返回 true。

加一个 helper function 判断 String 是否 palindrome 会看起来更简洁清晰一些。

```
class Solution {
    public boolean validPalindrome(String s) {
      int p1 = 0, p2 = s.length() - 1;
      while (p1 < p2) {
          if (s.charAt(p1) == s.charAt(p2)) {
              p1 ++;
              p2 --;
          } else {
              return isPalindrome(s, p1 + 1, p2) || isPalindrome(s, p1, p2 - 1);
          }
      }
      return true;
    }

    private boolean isPalindrome(String s, int p1, int p2) {
        while (p1 < p2) {
            if (s.charAt(p1 ++) != s.charAt(p2 --)) {
                return false;
            }
        }
        return true;
    }
}
```

Time: O(n)
Space: O(1)
