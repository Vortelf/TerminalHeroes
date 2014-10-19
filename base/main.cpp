#include <iostream>
#include <string>
#include <math.h>
#include <cstdlib>
#include "Battle.L"
// #include "Weapons.L"
using namespace std;




int main()
{
	HERO Vortelf;
	Creature Zombie;
	Vortelf.initHERO("Vortelf");
	Zombie.initCreature(1,"Zombie");
	//cout << Vortelf.PrintableName << endl;

	Battle(Zombie,Vortelf);

	return 0;
}
