#ifndef PLAYER_H
#define PLAYER_H

#include <SFML/Graphics.hpp>
#include "../Other/xy.h"
#include "Block.h"
#include <vector>

typedef enum action {nothing, boosting_left, boosting_right, pounding};
typedef enum surface {air, ground, left_wall, right_wall};

class Player {
	
	public:
		Player(float x, float y);
		
		bool collide(xy other);
		
		void update(std::vector<Block>& blocks);
		void draw(sf::RenderWindow& screen);
	
	private:
		xy position;
		xy speed;
		
		action doing;
		surface touching;
		unsigned int boosts;
		
		bool was_jump_down;
		
		sf::RectangleShape square;
	
};

#endif // PLAYER_H
