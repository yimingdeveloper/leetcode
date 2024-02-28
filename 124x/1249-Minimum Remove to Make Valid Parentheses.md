## Leetcode 1249

### Minimum Remove to Make Valid Parentheses

#### Solution 1: Count

先算下 closing parenthese 一共有几个。然后从左往右扫一遍就行了

```
class Solution {
    public String minRemoveToMakeValid(String s) {
        int close = 0;
        for (char c: s.toCharArray()) {
            if (c == ')') {
                close ++;
            }
        }

        StringBuilder sb = new StringBuilder();
        int open = 0;
        for (char c: s.toCharArray()) {
            if (c == '(') {
                if (open == close) continue;
                open ++;
            } else if (c == ')') {
                close --;
                if (open == 0) continue;
                open --;
            }
            sb.append(c);
        }
        return sb.toString();
     }
}
```

Time: O(n)
Space: O(1)
