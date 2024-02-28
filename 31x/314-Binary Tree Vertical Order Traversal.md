## Leetcode 314

### Binary Tree Vertical Order Traversal

#### Solution 1: BFS(TreeMap)

TreeMap 优点是 keySet 自动排序，缺点是每次操作复杂度 log(n).

```
class Solution {
    public List<List<Integer>> verticalOrder(TreeNode root) {
        List<List<Integer>> ans = new ArrayList<>();
        if (root == null) return ans;
        TreeMap<Integer, List<Integer>> map = new TreeMap<>();
        Queue<TreeNode> q = new LinkedList<>();
        Queue<Integer> qCol = new LinkedList<>();
        q.offer(root);
        qCol.offer(0);
        while (!q.isEmpty()) {
            TreeNode cur = q.poll();
            int col = (int)qCol.poll();
            map.computeIfAbsent(col, x -> new ArrayList<Integer>()).add(cur.val);
            if (cur.left != null) {
                q.offer(cur.left);
                qCol.offer(col - 1);
            }
            if (cur.right != null) {
                q.offer(cur.right);
                qCol.offer(col + 1);
            }
        }
        for (int col : map.keySet()) {
            ans.add(map.get(col));
        }
        return ans;
    }
}
```

Time: O(nlogn) treemap 排序要时间的
Space: O(n)

#### Solution2: BFS(HashMap)

我们不用 TreeMap, 用 HashMap。这样就省了排序的时间复杂度。但是要手动记一下 col 的最小的最大值。

```
class Solution {
    public List<List<Integer>> verticalOrder(TreeNode root) {
        List<List<Integer>> ans = new ArrayList<>();
        if (root == null) return ans;
        Map<Integer, List<Integer>> map = new HashMap<>();
        int min = 0, max = 0;
        Queue<TreeNode> q = new LinkedList<>();
        Queue<Integer> qCol = new LinkedList<>();
        q.offer(root);
        qCol.offer(0);
        while (!q.isEmpty()) {
            TreeNode node = q.poll();
            int col = qCol.poll();
            map.computeIfAbsent(col, x -> new ArrayList<>()).add(node.val);
            if (node.left != null) {
                q.offer(node.left);
                qCol.offer(col - 1);
                min = Math.min(min, col - 1);
            }

            if (node.right != null) {
                q.offer(node.right);
                qCol.offer(col + 1);
                max = Math.max(max, col + 1);
            }
        }
        for (int i = min; i <= max; i ++)
            ans.add(map.get(i));
        return ans;
    }
}
```

Time: O(n)
Space: O(n)

#### Solution 3: DFS

一般这种题不用 DFS,不好写。但是也不是不行。答案贴在下面。

```
class Solution {

    class Node {
        int row;
        int val;
        public Node(int row, int val) {
            this.row = row;
            this.val = val;
        }
    }

    public List<List<Integer>> verticalOrder(TreeNode root) {
        List<List<Integer>> ans = new ArrayList<>();
        if (root == null) return ans;
        Map<Integer, List<Node>> map = new TreeMap<>();
        dfs(root, map, 0, 0);
        for (int col : map.keySet()) {
            List<Node> cur = map.get(col);
            Collections.sort(cur, (a, b) -> a.row - b.row);
            List<Integer> list = new ArrayList<>();
            for (Node node : cur) {
                list.add(node.val);
            }
            ans.add(list);
        }
        return ans;
    }

    private void dfs(TreeNode root, Map<Integer, List<Node>> map, int col, int row) {
        if (root == null) return;
        if (!map.containsKey(col)) {
            map.put(col, new ArrayList<Node>());
        }
        map.get(col).add(new Node(row, root.val));
        dfs(root.left, map, col - 1, row + 1);
        dfs(root.right, map, col + 1, row + 1);
    }
}
```
