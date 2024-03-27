## Leetcode 708

### Insert into a Sorted Circular Linked List

#### Solution 1: Intuition

如果空结点特殊处理一下。一个 pre, 一个 next，走一个循环。有三种情况跳出循环直接插入。 1.当前节点大于下一节点，到了尾部，待插节点比两个都大，这时候直接插 2.当前节点大于下一节点，即到了尾部，待插节点比两个都小，这时候也直接插 3.当前节点小于下一节点，待插节点在两点之前，直接插
其它情况，pre = pre.next, next = next.next

```
/*
// Definition for a Node.
class Node {
    public int val;
    public Node next;

    public Node() {}

    public Node(int _val) {
        val = _val;
    }

    public Node(int _val, Node _next) {
        val = _val;
        next = _next;
    }
};
*/

class Solution {
    public Node insert(Node head, int insertVal) {
        Node node = new Node(insertVal, null);

        if (head == null) {
            node.next = node;
            return node;
        }

        Node pre = head, next = head.next;
        while (next != head) {
            if (insertVal >= pre.val && insertVal <= next.val) break;
            if (pre.val > next.val && insertVal >= pre.val) break;
            if (pre.val > next.val && insertVal <= next.val) break;
            pre = pre.next;
            next = next.next;
        }

        pre.next = node;
        node.next = next;
        return head;
    }
}
```

Time: O(n)
Space: O(1)
