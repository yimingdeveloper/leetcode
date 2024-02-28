## Leetcode 1762

### Buildings With an Ocean View

#### Solution 1: Brute Force

直接梭哈双重循环，每个 building 都把右边的楼遍历一遍，没有更高的就加上，有的话就跳过到下一个楼。

```
class Solution {
    public int[] findBuildings(int[] heights) {
        int length = heights.length;
        List<Integer> list = new ArrayList<>();
        for (int i = 0; i < length; i ++) {
            int height = heights[i];
            boolean ocean = true;
            for (int j = i + 1; j < length; j ++) {
                if (heights[j] >= height) {
                    ocean = false;
                    break;
                }
            }
            if (ocean) list.add(i);
        }
        int[] ans = new int[list.size()];
        for (int i = 0; i < list.size(); i ++) {
            ans[i] = list.get(i);
        }
        return ans;
    }
}
```

Time: O(n^2)
Space: O(n)

#### Solution 2: One-pass

我们从右往左扫。一个 maxHeight 记录当前 building 右边的最大高度，跟当前 height 比较。如果当前 building 较高，那么加到结果集里。

（临时写的解法，后面有时间再优化吧。但时空复杂度都是 OK 的）

```
class Solution {
    public int[] findBuildings(int[] heights) {
        List<Integer> list = new ArrayList<>();
        int length = heights.length;
        int p = length - 1;
        int maxHeight = Integer.MIN_VALUE;
        while (p >= 0) {
            if (heights[p] > maxHeight) {
                list.add(p);
                System.out.println(p);
            }
            maxHeight = Math.max(maxHeight, heights[p]);
            p --;
        }
        int[] ans = new int[list.size()];
        for (int i = 0; i < list.size(); i ++) {
            ans[i] = list.get(list.size() - 1 - i);
        }
        return ans;
    }
}
```

Time: O(n)
Space: O(n)
