## Leetcode 921

### Minimum Add to Make Parentheses Valid

#### Solution 1: Stack

```
class Solution {
    public int minAddToMakeValid(String s) {
        Stack<Character> stack = new Stack<>();
        int ans = 0;
        for (char c: s.toCharArray()) {
            if (c == '(') {
                stack.push(c);
            } else { // c == ')'
                if (stack.isEmpty()) {
                    ans ++;
                } else {
                    stack.pop();
                }
            }
        }
        return ans + stack.size();
    }
}
```

Time: O(n)
Space: O(n)

#### Solution 2: Counting

```
class Solution {
    public int minAddToMakeValid(String s) {
        int ans = 0;
        int left = 0;
        for (char c: s.toCharArray()) {
            if (c == '(') {
                left ++;
            } else {
                if (left > 0) {
                    left --;
                } else {
                    ans ++;
                }
            }
        }
        return ans += left;
    }
}
```

Time: O(n)
Space: O(1)
