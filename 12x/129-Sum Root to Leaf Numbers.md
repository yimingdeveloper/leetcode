## Leetcode 129

### Sum Root to Leaf Numbers

#### Solution 1: DFS

```
class Solution {

    int ans = 0;

    public int sumNumbers(TreeNode root) {
        dfs(root, 0);
        return ans;
    }

    private void dfs(TreeNode node, int sum) {
        if (node == null) return;
        if (node.left == null && node.right == null) ans += sum * 10 + node.val;
        if (node.left != null) dfs(node.left, sum * 10 + node.val);
        if (node.right != null) dfs(node.right, sum * 10 + node.val);
    }
}
```

Time: O(n)
Space: O(h)
