#include <iostream>
#include <conio.h>
#include <time.h>
#include <vector>

using namespace std;

extern "C" int getMin(int, int);
extern "C" int getMax(int, int);
extern "C" int getM(int, int);

int main() {
	srand(time(NULL));
	int *arr, n;
	n = rand() % 10 + 1;
	arr = new int[n];
	for(int i(0); i < n; i++) 
	{
		arr[i] = rand() % 15 + 1;
		cout << arr[i] << " ";
	}
	cout << endl;

	int min = arr[0];
	int max = arr[0];
	for(int i(1); i < n; i++)
	{
		min = getMin(arr[i], min);
		max = getMax(arr[i], max);
	}
	cout << "Min: " << min << endl;
	cout << "Max: " << max << endl;
	int m = getM(min, max) / 2;
	cout << "M: " << m << endl;

	cout << "Array b:\n";
	vector<int> b;
	for(int i(0); i < n; i++)
	{
		if(arr[i] > m)
		{
			b.push_back(arr[i]);
			cout << arr[i] << " ";
		}
	}
	cout << endl;

	delete arr;
	_getch();
  return 0;
}