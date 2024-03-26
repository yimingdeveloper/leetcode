## Leetcode 253

### Meeting Rooms II

#### Solution 1: Sort

我们建立两个数组， 一个存放所有会议开始的时间，一个存放结束的时间，然后排序。双指针分别从两个数组左向右遍历，如果当前开始时间小于结束时间，当前会议室就加 1，如果大于结束时间，当前会议室就减 1，如果相等，不加也不减。每次比较完之后，数字小的指针向后移，模拟时间流逝。

```
class Solution {
    public int minMeetingRooms(int[][] intervals) {
        int[] starts = new int[intervals.length];
        int[] ends = new int[intervals.length];

        for (int i = 0; i < intervals.length; i ++) {
            starts[i] = intervals[i][0];
            ends[i] = intervals[i][1];
        }

        Arrays.sort(starts);
        Arrays.sort(ends);

        int p1 = 0, p2 = 0;
        int cur = 0;
        int ans = 0;

        while (p1 < intervals.length && p2 < intervals.length) {
            if (starts[p1] < ends[p2]) {
                cur ++;
                p1 ++;
                ans = Math.max(ans, cur);
            } else if (starts[p1] > ends[p2]) {
                cur --;
                p2 ++;
            } else {
                p1 ++;
                p2 ++;
            }
        }

        return ans;
    }
}
```

Time: O(nlogn)
Space: O(n)
