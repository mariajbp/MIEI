#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "person.h"

int main(int argc, char* argv[])
{
	Person maria = new_person("Maria", 20);

	printf("Idade anterior da Maria %d\n", maria.age);
	person_change_age(&maria, 21);
	printf("Idade modificada da Maria %d\n", maria.age);

	Person new_maria = clone_person(&maria);
	printf("Idade da Maria %d\n", maria.age);
	printf("Idade new_maria %d\n",  new_maria.age);

	destroy_person(&new_maria);
	destroy_person(&maria);
	return 0;
}