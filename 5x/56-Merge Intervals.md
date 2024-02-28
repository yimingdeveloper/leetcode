## Leetcode 56

### Merge Intervals

#### Solution 1: Sort

- 先按 interval 第一个元素排序，不然没法 merge
- 先加一个 current 到 list 里，后面的 interval 直接往里 merge 了。如果不能 merge 就 current 指向下一个。
- 这个地方要先加到 list 里再 merge 而不能先 merge 再加。否则要处理 current 到队尾的 corner case 不是很好写。

```
class Solution {
    public int[][] merge(int[][] intervals) {
        if (intervals.length <= 1) {
            return intervals;
        }
        Arrays.sort(intervals, (a, b) -> a[0] - b[0]);
        List<int[]> list = new ArrayList<>();
        int[] current = intervals[0];
        list.add(current);
        for (int[] interval: intervals) {
            if (interval[0] <= current[1]) {
                current[1] = Math.max(current[1], interval[1]);
            } else {
                current = interval;
                list.add(current);
            }
        }
        return list.toArray(new int[list.size()][]);
    }
}
```

Time: O(nlogn)。排序 nlogn, 一个大循环 n。 n+nlogn ~ nlogn
Space: O(n)

#### Solution 2. Arrays

如果不熟 List API，也可以直接用数组写。

```
class Solution {
    public int[][] merge(int[][] intervals) {
        if (intervals == null || intervals.length == 0) return new int[0][0];
        Arrays.sort(intervals, (a, b) -> a[0] - b[0]);
        int[] cur = intervals[0];
        int index = 0;
        int[][] list = new int[intervals.length][2];
        list[0] = cur;
        for (int[] interval : intervals) {
            if (interval[0] <= cur[1]) {
                cur[1] = Math.max(cur[1], interval[1]);
            } else {
                list[++ index] = interval;
                cur = list[index];
            }
        }
        return Arrays.copyOfRange(list, 0, index + 1);
    }
}
```
