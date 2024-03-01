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

#### Solution 3: Divide & Conquer

我们模仿 Python 的写法，Python 可以一个方法返回多个值。我们创建一个 Nodes class，模拟 Python。这样看起来解法更加清晰。

```
class Solution {

    class Nodes {
        Nodes(Node head, Node tail) {
            this.head = head;
            this.tail = tail;
        }

        Node head;
        Node tail;
    }

    public Node treeToDoublyList(Node root) {
        if (root == null) return null;
        Nodes nodes = helper(root);
        return nodes.head;
    }

    private Nodes helper(Node node) {
        Nodes nodes = new Nodes(node, node);

        if (node.left != null) {
            Nodes left = helper(node.left);
            left.tail.right = node;
            node.left = left.tail;
            nodes.head = left.head;
        }

        if (node.right != null) {
            Nodes right = helper(node.right);
            right.head.left = node;
            node.right = right.head;
            nodes.tail = right.tail;
        }

        nodes.head.left = nodes.tail;
        nodes.tail.right = nodes.head;

        return nodes;
    }
}
```

Time: O(n)
Space: O(n)
