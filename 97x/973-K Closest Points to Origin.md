## Leetcode 973

### K Closest Points to Origin

#### Solution 1: Priority Queue

```
class Solution {
    public int[][] kClosest(int[][] points, int k) {
        int[][] ans = new int[k][2];
        PriorityQueue<int[]> pq = new PriorityQueue<>((a, b) -> getDis(b) - getDis(a));
        for (int[] point: points) {
            pq.offer(point);
            if (pq.size() > k) {
                pq.poll();
            }
        }
        for (int i = 0; i < k; i ++) {
            ans[i] = pq.poll();
        }
        return ans;
    }

    private int getDis(int[] point) {
        return point[0] * point[0] + point[1] * point[1];
    }
}
```

Time: O(nlogk)
Space: O(k)

#### Solution 1: Quick Select

跟其它 K xxx 问题一样。只不过选择的是 distance

```
class Solution {
    public int[][] kClosest(int[][] points, int K) {
        if (points == null || points.length == 0) return new int[0][0];
        quickSelect(points, 0, points.length - 1, K);
        return Arrays.copyOfRange(points, 0, K);
    }

    private void quickSelect(int[][] points, int start, int end, int K) {
        if (start == end) return;
        int i = start, j = end;
        int[] pivot = points[i + (j - i) / 2];
        int disPivot = getDistance(pivot);
        while (i <= j) {
            while (i <= j && getDistance(points[i]) < disPivot) i ++;
            while (i <= j && getDistance(points[j]) > disPivot) j --;
            if (i <= j) {
                int[] temp = points[i];
                points[i] = points[j];
                points[j] = temp;
                i ++;
                j --;
            }
        }
        if (start + K - 1 <= j) quickSelect(points, start, j, K);
        if (start + K - 1 >= i) quickSelect(points, i, end, K - (i - start));
    }

    private int getDistance(int[] point) {
        return point[0] * point[0] + point[1] * point[1];
    }
}
```

Time: O(n) , worst case O(n^2)
Space: O(1)
