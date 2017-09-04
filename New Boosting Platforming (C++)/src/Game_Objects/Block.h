#ifndef BLOCK_H
#define BLOCK_H

#include <SFML/Graphics.hpp>
#include "../Other/xy.h"

class Block {
	
	public:
		Block(float x, float y, sf::Texture& block_pic);
		
		xy get_pos();
		
		void draw(sf::RenderWindow& screen);
	
	private:
		xy position;
		
		sf::Sprite block;
	
};

#endif // BLOCK_H
