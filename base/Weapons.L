#include <math.h>
#include <cstdlib>
#include <string>
#include <iostream>
using namespace std;

enum WeaponTypes {STICK = 0, SWORD = 1, DAGGER = 2, SHIELD = 3, SPEAR = 4, HAMMER = 5, BOW = 6, WAND = 7, STAFF = 8, AXE = 9, SPELLBOOK = 10 };
enum StatusTypes {STR = 1, AGI = 2, INT = 3};

class WeaponType
{
public:
	int TypeOfWeapon;
	int MainStatus;
	string NameType;
	WeaponType() {
		TypeOfWeapon = 0;
		MainStatus = 0;
		NameType = "";
	};

	void initType() {
		switch(TypeOfWeapon) {
			case 0 : NameType = "STICK"; break;
			case 1 : NameType = "SWORD"; break;
			case 2 : NameType = "DAGGER"; break;
			case 3 : NameType = "SHIELD"; break;
			case 4 : NameType = "SPEAR"; break;
			case 5 : NameType = "HAMMER"; break;
			case 6 : NameType = "BOW"; break;
			case 7 : NameType = "WAND"; break;
			case 8 : NameType = "STAFF"; break;
			case 9 : NameType = "AXE"; break;
			case 10 : NameType = "SPELLBOOK";};
	};
};

class BonusStatuses {
public:
	double Strength;
	double Agility;
	double Intelligence;
	double Stamina;
	double SpellPower;

	BonusStatuses(){
		Strength = 0;
		Agility = 0;
		Intelligence = 0;
		Stamina = 0;
		SpellPower = 0;
 	};
};

class Weapon {
public:
	WeaponType Type;
	string NameOfWeapon;
	double Damage;
	double Accuracy;
	double LevelRequirement;
	double TimeUntilUsable;
	BonusStatuses Statuses;

	Weapon() {
		Type.TypeOfWeapon = 0;
		Type.MainStatus = 0;
		Type.NameType = "";
		NameOfWeapon = "";
		Damage = 0;
		Accuracy = 0; 
		// Durability = 0;
		LevelRequirement = 1;
		TimeUntilUsable = 0;
		Statuses.Strength = 0;
		Statuses.Agility = 0;
		Statuses.Intelligence = 0;
		Statuses.Stamina = 0;
		Statuses.SpellPower = 0;

	};

	string WeaponName(string Name) {
		return Name;
	};

	void initWeapon(string Name) {
		NameOfWeapon = WeaponName(Name);
		Damage = 0;
		Accuracy = 0; 
		// Durability = 0;
		LevelRequirement = 1;
		TimeUntilUsable = 0;
		Statuses.Strength = 0;
		Statuses.Agility = 0;
		Statuses.Intelligence = 0;
		Statuses.Stamina = 0;
		Statuses.SpellPower = 0;
	};
};

Weapon RandomWeapon() {
	Weapon Random;
	Random.initWeapon("Random Weapon");
	Random.Type.TypeOfWeapon = (rand() % 10 + 1);
	Random.LevelRequirement = (rand() % 50 + 1);
	switch (Random.Type.TypeOfWeapon) {
		case HAMMER : case SHIELD : case SWORD : case SPEAR : Random.Type.MainStatus = STR;
			break;
		case DAGGER : case AXE : case BOW : Random.Type.MainStatus = AGI;
			break;
		case WAND : case STAFF : case SPELLBOOK : Random.Type.MainStatus = INT;
	};
	Random.Damage = Random.LevelRequirement * (rand() % 50 +1);
	Random.Accuracy = Random.LevelRequirement * (rand() % 100 + 1);
	Random.Statuses.Stamina = Random.LevelRequirement * (rand() % 10 +1);

	switch(Random.Type.MainStatus) {
		case STR :  Random.Statuses.Strength = Random.LevelRequirement * (rand() % 10 +1) + (rand() % static_cast<int>(Random.LevelRequirement));
					Random.Statuses.Agility = Random.LevelRequirement * (rand() % 5) + (rand() % static_cast<int>(Random.LevelRequirement));
					Random.Statuses.Intelligence = Random.LevelRequirement * (rand() % 5) + (rand() % static_cast<int>(Random.LevelRequirement));
			break;
		case AGI :  Random.Statuses.Agility = Random.LevelRequirement * (rand() % 10 +1) + (rand() % static_cast<int>(Random.LevelRequirement));
					Random.Statuses.Strength = Random.LevelRequirement * (rand() % 5) + (rand() % static_cast<int>(Random.LevelRequirement));
					Random.Statuses.Intelligence = Random.LevelRequirement * (rand() % 5) + (rand() % static_cast<int>(Random.LevelRequirement));
			break;
		case INT :  Random.Statuses.Intelligence = Random.LevelRequirement * (rand() % 10 +1) + (rand() % static_cast<int>(Random.LevelRequirement));
					Random.Statuses.Strength = Random.LevelRequirement * (rand() % 5) + (rand() % static_cast<int>(Random.LevelRequirement));
					Random.Statuses.Agility = Random.LevelRequirement * (rand() % 5) + (rand() % static_cast<int>(Random.LevelRequirement));
					Random.Statuses.SpellPower = Random.LevelRequirement * (rand() % 5) + (rand() % static_cast<int>(Random.LevelRequirement));
	};
	Random.Type.initType();

	return Random;
};

int main() {
	srand(time(NULL));
	Weapon Axe = RandomWeapon();

	cout << "You've created the mighty " << Axe.NameOfWeapon << " which is actually a/an " << Axe.Type.NameType << "!\n";
	cout << "It's for " << Axe.LevelRequirement << " Level" << endl;
	cout << "And here comes the numbers!" << endl;
	cout << "\t\t" << Axe.Statuses.Strength << "STR" << endl;
	cout << "\t\t" << Axe.Statuses.Agility << "AGI" << endl;
	cout << "\t\t" << Axe.Statuses.Intelligence << "INT" << endl;

	return 0;
}