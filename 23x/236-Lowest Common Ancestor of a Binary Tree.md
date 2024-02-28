## Leetcode 236

### Lowest Common Ancestor of a Binary Tree

#### Solution 1: Postorder || Divide & Conquer

```
class Solution {
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        if (root == null || root == p || root == q) return root;

        TreeNode left = lowestCommonAncestor(root.left, p, q);
        TreeNode right = lowestCommonAncestor(root.right, p, q);

        if (left == null || right == null) return left == null ? right : left;
        return root;
    }
}
```

Time: O(n)
Space: O(h)
