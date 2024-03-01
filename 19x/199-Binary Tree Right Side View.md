## Leetcode 199

### Binary Tree Right Side View

#### Solution 1: DFS + TreeMap

```
class Solution {

    TreeMap<Integer, Integer> map = new TreeMap<>();

    public List<Integer> rightSideView(TreeNode root) {
        List<Integer> ans = new ArrayList<>();

        dfs(root, 0);
        for (int key: map.keySet()) {
            ans.add(map.get(key));
        }
        return ans;
    }

    private void dfs(TreeNode node, int level) {
        if (node == null) return;
        if (!map.containsKey(level)) {
            map.put(level, node.val);
        }
        dfs(node.right, level + 1);
        dfs(node.left, level + 1);
    }
}
```

Time: O(n) + O(hlogh)
Space: O(h)

#### Solution 2: DFS

不用 TreeMap，就省了排序的时间，用 ans.size()其实可以判断是否应该加到结果集。但是缺点就是要想清楚，并且面试的时候跟面试官讲明白。

```
class Solution {

    public List<Integer> rightSideView(TreeNode root) {
        List<Integer> ans = new ArrayList<>();

        dfs(root, ans, 0);
        return ans;
    }

    private void dfs(TreeNode node, List<Integer> ans, int level) {
        if (node == null) return;
        if (ans.size() == level) ans.add(node.val);
        dfs(node.right, ans, level + 1);
        dfs(node.left, ans, level + 1);
    }
}
```

Time: O(n)
Space: (n)

#### Solution 3: BFS

跟平时 BFS 不太一样，一次遍历一层，取最右即可。

```
class Solution {

    public List<Integer> rightSideView(TreeNode root) {
        List<Integer> ans = new ArrayList<>();
        if (root == null) return ans;

        Queue<TreeNode> q = new LinkedList<>();
        TreeNode tail = root;
        q.offer(root);
        while (!q.isEmpty()) {
            int size = q.size();
            for (int i = 0; i < size; i ++) {
                tail = q.poll();
                if (tail.left != null) q.offer(tail.left);
                if (tail.right != null) q.offer(tail.right);
            }
            ans.add(tail.val);
        }
        return ans;
    }
}
```

Time: O(n)
Space: O(n)
