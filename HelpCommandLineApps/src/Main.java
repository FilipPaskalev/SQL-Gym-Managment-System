import java.util.Arrays;
import java.util.Random;

public class Main {
    static  int maxRange = 15;
    static int[] numbers = new int[maxRange];

    static int generateRandomNumbers(int min, int max) {
        Random rand = new Random();
        int randomNum = rand.nextInt((max - min) + 1) + min;
        return randomNum;
    }

    static boolean contains(final int[] arr, final int key) {
        return Arrays.stream(arr).anyMatch(i -> i == key);
    }

    public static void main(String[] args) {
        for (int i = 0; i < numbers.length; i++) {
            int num = generateRandomNumbers(0,maxRange);
            if (contains(numbers,num)) {
                i--;
                continue;
            } else {
                numbers[i] = num;
//                System.out.println(num);
            }
        }

//        Arrays.sort(numbers);
//        System.out.println(Arrays.toString(numbers));
    }
}
