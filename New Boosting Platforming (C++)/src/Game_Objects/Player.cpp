#include "Player.h"
#include <iostream>

Player::Player(float x, float y) {
	
	position = {x, y};
	speed = {0, 0};
	
	doing = nothing;
	touching = air;
	boosts = 2;
	
	was_jump_down = false;
	
	square = sf::RectangleShape(sf::Vector2f(18, 18));
	square.setFillColor(sf::Color(0, 0, 0, 255));
	square.setPosition(x, y);
	
}

bool Player::collide(xy other) {
	return (position.x < other.x + 20) & (other.x < position.x + 18) & (position.y < other.y + 20) & (other.y < position.y + 18);
}

void Player::update(std::vector<Block>& blocks) {
	
	switch(doing) {
		
		case nothing:
			
			switch(touching) {
				
				case air:
					
					if(sf::Keyboard::isKeyPressed(sf::Keyboard::Left) | sf::Keyboard::isKeyPressed(sf::Keyboard::A))
						speed.x -= 1;
					if(sf::Keyboard::isKeyPressed(sf::Keyboard::Right) | sf::Keyboard::isKeyPressed(sf::Keyboard::D))
						speed.x += 1;
					
					speed.x *= 0.8;
					speed.y += 0.5;
					
					if(speed.y > 35)
						speed.y = 35;
					
					if((sf::Keyboard::isKeyPressed(sf::Keyboard::Up) | sf::Keyboard::isKeyPressed(sf::Keyboard::W)) & !was_jump_down & boosts > 0) {
						speed.y = -10;
						boosts--;
					}
					
					if((sf::Keyboard::isKeyPressed(sf::Keyboard::Comma) | sf::Keyboard::isKeyPressed(sf::Keyboard::G)) & boosts > 0) {
						speed = {-7.5, 0};
						doing = boosting_left;
						boosts--;
					}
					
					if((sf::Keyboard::isKeyPressed(sf::Keyboard::Period) | sf::Keyboard::isKeyPressed(sf::Keyboard::H)) & boosts > 0) {
						speed = {7.5, 0};
						doing = boosting_right;
						boosts--;
					}
					
					if(sf::Keyboard::isKeyPressed(sf::Keyboard::Down) | sf::Keyboard::isKeyPressed(sf::Keyboard::S)) {
						speed = {0, 35};
						doing = pounding;
						boosts = 0;
					}
					
					break;
				
				case ground:
					
					if(sf::Keyboard::isKeyPressed(sf::Keyboard::Left) | sf::Keyboard::isKeyPressed(sf::Keyboard::A))
						speed.x -= 1;
					if(sf::Keyboard::isKeyPressed(sf::Keyboard::Right) | sf::Keyboard::isKeyPressed(sf::Keyboard::D))
						speed.x += 1;
					
					speed.x *= 0.8;
					speed.y += 0.5;
					
					if((sf::Keyboard::isKeyPressed(sf::Keyboard::Up) | sf::Keyboard::isKeyPressed(sf::Keyboard::W)) & !was_jump_down & boosts > 0) {
						speed.y = -10;
						boosts--;
					}
					
					break;
				
				case left_wall:
					
					if(sf::Keyboard::isKeyPressed(sf::Keyboard::Right) | sf::Keyboard::isKeyPressed(sf::Keyboard::D))
						speed.x += 1;
					
					speed.y += 0.5;
					
					if((sf::Keyboard::isKeyPressed(sf::Keyboard::Up) | sf::Keyboard::isKeyPressed(sf::Keyboard::W)) & !was_jump_down) {
						speed = {7.5, -7.5};
					}
					
					break;
				
				case right_wall:
					
					if(sf::Keyboard::isKeyPressed(sf::Keyboard::Left) | sf::Keyboard::isKeyPressed(sf::Keyboard::A))
						speed.x -= 1;
					
					speed.y += 0.5;
					
					if((sf::Keyboard::isKeyPressed(sf::Keyboard::Up) | sf::Keyboard::isKeyPressed(sf::Keyboard::W)) & !was_jump_down) {
						speed = {-7.5, -7.5};
					}
					
					break;
				
			}
			
			break;
		
		case boosting_left:
			
			speed.x *= 0.925;
			if(speed.x > -1)
				doing = nothing;
			
			break;
		
		case boosting_right:
			
			speed.x *= 0.925;
			if(speed.x < 1)
				doing = nothing;
			
			break;
		
		case pounding: // Absolutely nothing!
			break;
		
	}
	
	touching = air;
	
	position.x += speed.x;
	
	unsigned int count;
	for(count = 0; count < blocks.size(); count++) {
		if(collide(blocks[count].get_pos())) {
			
			doing = nothing;
			
			if(speed.x > 0) {
				position.x = blocks[count].get_pos().x - 18;
			} else {
				position.x = blocks[count].get_pos().x + 20;
			}
			
			boosts = 0;
			speed.x = 0;
			
		}
	}
	
	position.y += speed.y;
	for(count = 0; count < blocks.size(); count++) {
		if(collide(blocks[count].get_pos())) {
			
			doing = nothing;
			
			if(speed.y > 0) {
				position.y = blocks[count].get_pos().y - 18;
				touching = ground;
				boosts = 2;
			} else {
				position.y = blocks[count].get_pos().y + 20;
			}
			
			speed.y = 0;
			
		}
	}
	
	position.x++;
	for(count = 0; count < blocks.size(); count++) {
		if(collide(blocks[count].get_pos())) {
			touching = right_wall;
		}
	}
	position.x -= 2;
	for(count = 0; count < blocks.size(); count++) {
		if(collide(blocks[count].get_pos())) {
			touching = left_wall;
		}
	}
	position.x++;
	
	square.setPosition(position.x, position.y);
	
	was_jump_down = sf::Keyboard::isKeyPressed(sf::Keyboard::Up) | sf::Keyboard::isKeyPressed(sf::Keyboard::W);
	
}

void Player::draw(sf::RenderWindow& screen) {
	screen.draw(square);
}
