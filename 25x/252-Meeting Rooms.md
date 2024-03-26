## Leetcode 252

### Meeting Rooms

#### Solution 1: Sort + Brute Force

按 interval 起始时间 sort 一遍，然后判断下一个 meeting 开始时间是否早于当前 meeting 结束时间，是则 return false。最后如果没有违反规则的，return true;

```
class Solution {
    public boolean canAttendMeetings(int[][] intervals) {
        Arrays.sort(intervals, (a, b) -> a[0] - b[0]);
        int n = intervals.length;
        for (int i = 0; i < n - 1; i ++) {
            if (intervals[i][1] > intervals[i + 1][0]) return false;
        }
        return true;
    }
}
```

Time: O(n)
Space: O(1)
