## Leetcode 670

### Maximum Swap

#### Solution 1: Greedy

```
class Solution {
    public int maximumSwap(int num) {
        int[] last = new int[10];
        Arrays.fill(last, -1);
        char[] arr = String.valueOf(num).toCharArray();
        for (int i = 0; i < arr.length; i ++) {
            last[arr[i] - '0'] = i;
        }
        for (int i = 0; i < arr.length; i ++) {
            for (int j = 9; j > arr[i] - '0'; j --) {
                if (i < last[j]) {
                    char temp = arr[i];
                    arr[i] = arr[last[j]];
                    arr[last[j]] = temp;
                    return Integer.valueOf(new String(arr));
                }
            }
        }
        return num;
    }
}
```

Time: O(n)
Space: O(n)
