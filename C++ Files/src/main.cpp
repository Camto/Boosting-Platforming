#include <SFML/Graphics.hpp>
#include "Game_Objects/Player.h"
#include "Game_Objects/Block.h"
#include "Other/level.h"

sf::RenderWindow screen(sf::VideoMode(400, 400), "Boosting Platforming", sf::Style::None);

Player player(191, 191);
std::vector<Block> blocks;

int main() {
	
	screen.setFramerateLimit(60);
	
	sf::Texture dirt_pic;
	if(!dirt_pic.loadFromFile("Dirt.png"))
		throw "Crap...";
	
	unsigned int y;
	for(y = 0; y < sizeof(level) / sizeof(level[0]); y++) {
		unsigned int x;
		for(x = 0; x < sizeof(level[y]); x++) {
			if(level[y][x])
				blocks.push_back(Block(x * 20, y * 20, dirt_pic));
		}
	}
	
	while(screen.isOpen()) {
		
		sf::Event event;
		while(screen.pollEvent(event)) {
			if(event.type == sf::Event::Closed)
				screen.close();
		}
		
		player.update(blocks);
		
		screen.clear(sf::Color(77, 166, 255));
		
		unsigned int count;
		for(count = 0; count < blocks.size(); count++) {
			blocks[count].draw(screen);	
		}
		player.draw(screen);
		
		screen.display();
		
	}
	
	return 0;
	
}
