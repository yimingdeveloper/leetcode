## Leetcode 1650

### Lowest Common Ancestor of a Binary Tree III

#### Solution 1: 梭哈

直接最优解，先求两点深度，然后把深的往上走到两者尝试一致的时候，再一起往上走，直到两点相同。

```
class Solution {
    public Node lowestCommonAncestor(Node p, Node q) {
        int depthP = getDepth(p);
        int depthQ = getDepth(q);

        while (depthP < depthQ) {
            q = q.parent;
            depthQ --;
        }
        while (depthQ < depthP) {
            p = p.parent;
            depthP --;
        }

        while (p != q) {
            p = p.parent;
            q = q.parent;
        }

        return p;
    }

    private int getDepth(Node node) {
        int depth = 0;
        while (node.parent != null) {
            depth ++;
            node = node.parent;
        }
        return depth;
    }
}
```

Time: O(h)
Space: O(1)
