## Leetcode 986

### Interval List Intersections

#### Solution 1: Two Pointers

```
class Solution {
    public int[][] intervalIntersection(int[][] firstList, int[][] secondList) {
        int len1 = firstList.length, len2 = secondList.length;
        int p1 = 0, p2 = 0;
        List<int[]> list = new ArrayList<>();
        while (p1 < len1 && p2 < len2) {
            int[] interval1 = firstList[p1];
            int[] interval2 = secondList[p2];
            if (interval1[0] > interval2[1]) {
                p2 ++;
            } else if (interval1[1] < interval2[0]) {
                p1 ++;
            } else {
                int start = Math.max(interval1[0], interval2[0]);
                int end = Math.min(interval1[1], interval2[1]);
                list.add(new int[] {start, end});
                if (interval1[1] > interval2[1]) {
                    p2 ++;
                } else if (interval1[1] < interval2[1]) {
                    p1 ++;
                } else {
                    p1 ++;
                    p2 ++;
                }
            }
        }
        return list.toArray(new int[list.size()][]);
    }
}
```

Time: O(m + n)
Space: O(m + n)
