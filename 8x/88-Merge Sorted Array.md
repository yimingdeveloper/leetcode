## Leetcode 88

### Merge Sorted Array

#### Solution 1: Two Pointers

再 new 一个新的 m+n 个 size 的数组，双指针法 merge 完再 copy 回 nums1 即可。

```
class Solution {
    public void merge(int[] nums1, int m, int[] nums2, int n) {
        int[] ans = new int[m + n];
        int p1 = 0, p2 = 0, p = 0;

        while (p1 < m && p2 < n) {
            if (nums1[p1] < nums2[p2]) {
                ans[p ++] = nums1[p1 ++];
            } else {
                ans[p ++] = nums2[p2 ++];
            }
        }
        while (p1 < m) {
            ans[p ++] = nums1[p1 ++];
        }
        while (p2 < n) {
            ans[p ++] = nums2[p2 ++];
        }
        for (int i = 0; i < m + n; i ++) {
            nums1[i] = ans[i];
        }
    }
}
```

Time: O(m + n)
Space: O(m + n)

#### Solution 2: Optimized Space Two Pointers

换个思路，双指针从后面开始，把大的从后往前放，就不用额外空间，或者交换了。

```
class Solution {
    public void merge(int[] nums1, int m, int[] nums2, int n) {
        int p1 = m - 1, p2 = n - 1, tail = m + n - 1;
        while (p1 >= 0 && p2 >= 0) {
            if (nums1[p1] > nums2[p2]) {
                nums1[tail --] = nums1[p1 --];
            } else {
                nums1[tail --] = nums2[p2 --];
            }
        }
        while (p1 >= 0) {
            nums1[tail --] = nums1[p1 --];
        }
        while (p2 >= 0) {
            nums1[tail --] = nums2[p2 --];
        }
    }
}
```

Time: O(m + n)
Space: O(1)
