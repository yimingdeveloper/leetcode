## Leetcode 1644

### Lowest Common Ancestor of a Binary Tree II

#### Solution 1: Brute Force + DFS

这个题跟其它两个变种的区别在于，p 和 q 不一定 exist。因此我们可以先扫一遍，如果任意一个不 exist，直接 return null。否则还按照之前的解法来。时间复杂度是扫两遍的复杂度 O(2n) = O(n)

```
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {

    boolean hasp = false;
    boolean hasq = false;

    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        dfs(root, p, q);
        if (!hasp || !hasq) return null;

        return helper(root, p, q);
    }

    private TreeNode helper(TreeNode root, TreeNode p, TreeNode q) {
        if (root == null || root == p || root == q) return root;

        TreeNode left = helper(root.left, p, q);
        TreeNode right = helper(root.right, p, q);

        if (left != null && right != null) return root;
        if (left == null) return right;
        if (right == null) return left;
        return root;
    }

    private void dfs(TreeNode root, TreeNode p, TreeNode q) {
        if (root == null) return;
        if (root == p) hasp = true;
        if (root == q) hasq = true;

        dfs(root.left, p, q);
        dfs(root.right, p, q);
    }
}
```

Time: O(n)
Space: O(h)

#### Solution 2: DFS

计数法，扫一遍就可以了，但时空复杂度还是一致的。

```
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {

    TreeNode ans = null;

    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        helper(root, p, q);
        return ans;
    }

    private int helper(TreeNode root, TreeNode p, TreeNode q) {
        if (root == null || ans != null) return 0;
        int found = 0;
        if (root == p || root == q)
            found ++;

        int left = helper(root.left, p, q);
        int right = helper(root.right, p, q);

        found += left + right;

        if (found == 2 && ans == null) {
            ans = root;
        }
        return found;
    }
}
```

Time: O(n)
Space: O(h)
