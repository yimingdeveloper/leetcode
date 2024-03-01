## Leetcode 426

### Convert Binary Search Tree to Sorted Doubly Linked List

#### Solution 1: Stack

BST inorder traverse，先用 stack iteration 做，最后把头尾连起来即可。

```
class Solution {
    public Node treeToDoublyList(Node root) {
        if (root == null) return null;
        Stack<Node> stack = new Stack<>();
        pushAllLeft(stack, root);
        Node head = stack.peek();
        Node tail = null;
        Node pre = null;

        while (!stack.isEmpty()) {
            Node cur = stack.pop();
            tail = cur;
            if (pre != null) {
                pre.right = cur;
                cur.left = pre;
            }
            pre = cur;
            pushAllLeft(stack, cur.right);
        }

        tail.right = head;
        head.left = tail;
        return head;
    }

    private void pushAllLeft(Stack<Node> stack, Node node) {
        while (node != null) {
            stack.push(node);
            node = node.left;
        }
    }
}
```

Time: O(n)
Space: O(n)

#### Solution 2: Inorder recursion

```
class Solution {

    Node first = null;
    Node last = null;

    public Node treeToDoublyList(Node root) {
        if (root == null) return null;

        helper(root);
        first.left = last;
        last.right = first;
        return first;
    }

    private void helper(Node node) {
        if (node == null) return;
        helper(node.left);
        if (last != null) {
            last.right = node;
            node.left = last;
        } else {
            first = node;
        }
        last = node;
        helper(node.right);
    }
}
```

Time: O(n)
Space: O(n)
