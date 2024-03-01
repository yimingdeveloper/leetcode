## Leetcode 560

### Subarray Sum Equals K

#### Solution 1: PreSum With Array

```
class Solution {
    public int subarraySum(int[] nums, int k) {
        int len = nums.length;
        int[] sums = new int[len + 1];
        int ans = 0;
        for (int i = 0; i < len; i ++) {
            sums[i + 1] = sums[i] + nums[i];
        }
        for (int i = 1; i < len + 1; i ++) {
            for (int j = 0; j < i; j ++) {
                if (sums[i] - sums [j] == k) {
                    ans ++;
                }
            }
        }
        return ans;
    }
}
```

Time: O(n^2)
Space: O(n)

#### Solution 1: PreSum With HashMap

用一个 HashMap, key 是 presum 的结果，value 是 presum 的数量。

```
class Solution {
    public int subarraySum(int[] nums, int k) {
        Map<Integer, Integer> map = new HashMap<>();
        int sum = 0;
        int ans = 0;
        map.put(0, 1);
        for (int num: nums) {
            sum += num;
            if (map.containsKey(sum - k)) {
                ans += map.get(sum - k);
            }
            map.put(sum, map.getOrDefault(sum, 0) + 1);
        }
        return ans;
    }
}
```

Time: O(n)
Space: O(n)
