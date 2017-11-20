import java.util.Scanner;

public class Pascal_Recursion {
	
	public static void print(int n) {
		for (int i = 0; i < n; i++) {
			for (int j = 0; j <= i; j++) {
				System.out.print(pascal(i, j) + " ");
			}
			System.out.println();
		}
	}
	
	public static int pascal(int i, int j) {
		if (j == 0) {
			return 1;
		} else if (j == i) {
			return 1;
		} else {
			return pascal(i - 1, j - 1) + pascal(i - 1, j);
		}
	}
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("Enter the maximum row number to process: ");
		int row = scanner.nextInt();
		print(row);
	}
}