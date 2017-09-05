#include "Block.h"

Block::Block(float x, float y, sf::Texture& block_pic) {
	
	position.x = x;
	position.y = y;
	
	block.setTexture(block_pic);
	block.setTextureRect(sf::IntRect(0, 0, 20, 20));
	block.setPosition(x, y);
	
}

void Block::draw(sf::RenderWindow& screen) {
	screen.draw(block);
	
}

xy Block::get_pos() {
	return position;
}
