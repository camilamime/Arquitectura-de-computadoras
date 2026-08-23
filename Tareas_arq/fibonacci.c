#include <stdio.h>
#include <stdlib.h>

int  main(){
	int n=0;
	int a=0,b=1,siguiente;
	printf("Cantidad de digitos: ");
	scanf("%d",&n);
	for(int i=0;i<=n;i++){
		printf("%d",a);
		siguiente=a+b;
		a=b;
		b=siguiente;
	}
	return 0;
}
