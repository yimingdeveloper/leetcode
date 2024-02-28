## Leetcode 339

### Nested List Weight Sum

#### Solution 1: DFS

加个 helper function，多一个 depth 的参数，如果是 Integer, 就直接\*depth 加到结果里。否则无限套娃。这个是比较简单的 DFS 题目了，注意设置出口条件。

```
class Solution {
    public int depthSum(List<NestedInteger> nestedList) {
        return depthSum(nestedList, 1);
    }

    private int depthSum(List<NestedInteger> nestedList, int depth) {
        if (nestedList == null || nestedList.isEmpty()) return 0;
        int sum = 0;
        for (NestedInteger nestedInteger: nestedList) {
            if (nestedInteger.isInteger()) {
                sum += nestedInteger.getInteger() * depth;
            } else {
                sum += depthSum(nestedInteger.getList(), depth + 1);
            }
        }
        return sum;
    }
}
```

Time: O(n)
Space: O(D), where D is the maximum depth of the nested list.
