## Leetcode 766

### Toeplitz Matrix

#### Solution 1: Brute Force

```
class Solution {
    public boolean isToeplitzMatrix(int[][] matrix) {
        int m = matrix.length, n = matrix[0].length;
        for (int i = 0; i < n; i ++) {
            if (!check(matrix, 0, i)) return false;
        }
        for (int i = 0; i < m; i ++) {
            if (!check(matrix, i, 0)) return false;
        }
        return true;
    }

    private boolean check(int[][] matrix, int x, int y) {
        int num = matrix[x][y];
        int m = matrix.length, n = matrix[0].length;
        while (x < m && y < n) {
            if (matrix[x][y] != num) return false;
            x ++;
            y ++;
        }
        return true;
    }
}
```

Time: O(mn)
Space: O(1)
