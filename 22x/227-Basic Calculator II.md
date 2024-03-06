## Leetcode 227

### Basic Calculator II

#### Solution 1: Template

这个系列一共有三题，网上有个大哥总结了模板。

```
class Solution {
    public int calculate(String s) {
        int ans = 0, cur = 0, temp = 0;
        char op = '+';
        for (char c: s.toCharArray()) {
            if (Character.isDigit(c)) {
                cur = cur * 10 + c - '0';
            } else if (c != ' ') {
                temp = cal(temp, cur, op);
                if (c == '+' || c == '-') {
                    ans += temp;
                    temp = 0;
                }
                cur = 0;
                op = c;
            }
        }
        return ans + cal(temp, cur, op);
    }

    private int cal(int num1, int num2, char op) {
        switch(op) {
            case '+':
                return num1 + num2;
            case '-':
                return num1 - num2;
            case '*':
                return num1 * num2;
            default:
                return num1 / num2;
        }
    }
}
```

Time: O(n)
Space: O(1)
