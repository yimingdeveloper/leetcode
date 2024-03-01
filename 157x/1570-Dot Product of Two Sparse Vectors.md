## Leetcode 1570

### Dot Product of Two Sparse Vectors

#### Solution 1: Brute Force

直接算就行了，很简单。

```
class SparseVector {

    List<Integer> list = new ArrayList<>();

    SparseVector(int[] nums) {
        for (int num: nums) {
            list.add(num);
        }
    }

	// Return the dotProduct of two sparse vectors
    public int dotProduct(SparseVector vec) {
        int ans = 0;
        int len = list.size();
        for (int i = 0; i < len; i ++) {
            ans = ans + list.get(i) * vec.list.get(i);
        }
        return ans;
    }
}
```

Time: O(n)
Space: O(n)
