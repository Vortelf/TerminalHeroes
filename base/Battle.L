#include "main-sub.cpp"
#include <math.h>
#include <cstdlib>
#include <string>
// #include "Weapons.L"
using namespace std;

 void Battle(Creature Monster, HERO Hero) {
 	cout << "There is a " << Monster.CreatureName << " before " << Hero.HeroName << endl;

	while ( Hero.Dead() == false and Monster.Dead() == false) {
		cout << '\n';

	 	Hero.DamageSelf(Monster.Damage);
	 	Monster.DamageSelf(Hero.Damage);
	 	if (Hero.ManaPoints >= 5)
	 		Hero.HealSelf(Hero.ManaPoints);
	 	
	 	cout << '\n';
	};

	if(Monster.Dead() == true)
		cout << Hero.HeroName << " defeated " << Monster.CreatureName << ".\n";
	else
		cout << "You were defeated!" << endl;

}