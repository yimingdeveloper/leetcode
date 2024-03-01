## Leetcode 215

### Kth Largest Element in an Array

#### Solution 1: Priority Queue

Kth Largest/Smallest 问题，Java 用 Priority Queue 简直就是作弊。

```
class Solution {
    public int findKthLargest(int[] nums, int k) {
        PriorityQueue<Integer> pq = new PriorityQueue<>((a, b) -> a - b);
        for (int num: nums) {
            pq.offer(num);
            if (pq.size() > k) {
                pq.poll();
            }
        }
        return pq.poll();
    }
}
```

Time: O(klogn)
Space: O(k)

#### Solution 2: Quick Select

```
class Solution {
    public int findKthLargest(int[] nums, int k) {
        helper(nums, 0, nums.length - 1, k);
        return nums[k - 1];
    }

    private void helper(int[] nums, int start, int end, int k) {
        if (start >= end) return;
        int mid = start + (end - start) / 2;
        int pivot = nums[mid];
        int i = start, j = end;
        while (i <= j) {
            while (i <= j && nums[i] > pivot) i ++;
            while (i <= j && nums[j] < pivot) j --;
            if (i <= j) {
                swap(nums, i ++, j --);
            }
        }
        if (start + k - 1 <= j) helper(nums, start, j, k);
        if (start + k - 1 >= i) helper(nums, i, end, k - (i - start));
    }

    private void swap(int[] nums, int i, int j) {
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
}
```

Time: O(n) average, worst case O(n^2)
Space: O(1)
