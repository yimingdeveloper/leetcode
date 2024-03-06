## Leetcode 71

### Simply Path

#### Solution 1: Deque

先 split, 然后进栈出栈即可。

```
class Solution {
    public String simplifyPath(String path) {
        Deque<String> dq = new LinkedList<>();
        StringBuilder sb = new StringBuilder();
        String[] arr = path.split("/");
        for (String p: arr) {
            if (p.equals(".") || p.trim().isEmpty()) {
                continue;
            }
            if (p.equals("..")) {
                if (!dq.isEmpty())
                    dq.pollLast();
            } else {
                dq.offerLast(p);
            }
        }
        while (!dq.isEmpty()) {
            sb.append("/").append(dq.pollFirst());
        }
        return sb.toString().isEmpty() ? "/" : sb.toString();
    }
}
```

Time: O(n)
Space: O(n)
