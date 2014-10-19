#include <math.h>
#include <string>
#include <cstdlib>
// #include "Weapons.L"
using namespace std;

class HERO {
public:
	string HeroName;
	double Level;
	double Experience;
	double HealthPoints;
	double ManaPoints;
	double SpellPower;
	double Damage;
	double Armor;
	double NextLevelExperience;
	double ExperienceToNextLevel;
	double Agility;
	double Intelligence;
	double Strength;
	double Stamina;

	HERO(){
		HeroName = "";
		Level = 1;		
		Experience = 1;
		HealthPoints = 0;
		ManaPoints = 0;
		SpellPower = 0;
		Damage = 0;
		Armor = 0;
		NextLevelExperience = 0;
		ExperienceToNextLevel = 0;
		Agility = 0;
		Strength = 0;
		Intelligence = 0;
		Stamina = 0;
	};

	string NameOfTheHero(string Name) {
		return Name;
	};

	void initHERO(string Name) {
		HeroName = NameOfTheHero(Name);
		Experience = 1;
		Level = 1 + round(Experience / 100 * Level);
		HealthPoints = 10 + Level * 5;
		ManaPoints = 3 + Level * 2;
		SpellPower = 0 + Level * 1;
		Damage = Damage + Level * 5;
		NextLevelExperience = (rand() % 100 + Level ) * Level;
		ExperienceToNextLevel = NextLevelExperience - Experience;
		cout << "The mighty hero " << HeroName << " was born with " << HealthPoints << " HealthPoints." << endl;
		cout << "He has " << Damage << " damage and " << ManaPoints << " mana!" << endl; 
	}

	string PrintableName(){
		return HeroName;
	}

	double HeroLevel() {
		return Level;
	}

	double HealSelf(double HealAmount) {
		ManaPoints -= HealAmount;
		HealthPoints += HealAmount;
		cout << HeroName << " healed himself for " << HealAmount << " HP and currently have " << HealthPoints << " health points." << endl;
		return HealthPoints;
	};
	
	double DamageSelf( double DamageAmount) {
		HealthPoints -= DamageAmount;
		cout << HeroName << " was hit for " << DamageAmount << " Damage with " << HealthPoints << "HP left." << endl;
		return HealthPoints;
	};

	bool Dead() {
		if (HealthPoints <= 0)
			return true;
		else
			return false;
	};
};

class Creature
{
public:
	string CreatureName;
	double Level;
	double HealthPoints;
	double ManaPoints;
	double Damage;
	double Armor;

	Creature(){
		CreatureName = "";
		Level = 1;
		HealthPoints = 0;
		ManaPoints = 0;
		Damage = 0;
		Armor = 0;
	};

	string NameOfTheCreature(string Name) {
		return Name;
	};

	void initCreature(double CreatureLevel, string Name) {
		CreatureName = NameOfTheCreature(Name);
		Level = CreatureLevel;
		HealthPoints = 10 + Level * 5;
		Damage = Damage + Level * 5;
		cout << CreatureName << " has spawned!" << endl;
	};

	double DamageSelf(double DamageAmount){
		HealthPoints -= DamageAmount;
		cout << CreatureName << " was hit for " << DamageAmount << " Damage with " << HealthPoints << "HP left." << endl;
		return HealthPoints;
	};

	bool Dead() {
		if (HealthPoints <= 0)
			return true;
		else
			return false;
	};
	
};
