from random import randint
from unittest.mock import Mock
import argparse
import pygame # pip install pygame
import os
import sys

FPS = 60

WIDTH  = 800
HEIGHT = 600
BOTTOM = 550
WIN_SCORE = 30

BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
GREEN = (0, 120, 0)
RED   = (250, 0, 0)

parser = argparse.ArgumentParser()
parser.add_argument('--debug', action='store_const', const=print, default=Mock)
args = parser.parse_args()


class Player(object):
    def __init__(self):
        self.rect = pygame.Rect(int(WIDTH/4), (HEIGHT/2), 5, 5)
        self.sound = pygame.mixer.Sound(rsc_path("resources\\jump.mp3"))
        self.speed = 8
        self.dx = 0
        self.dy = 0

    def jump(self):
        self.dy = -15
        self.sound.play()

    def update(self):
        self.dy += 1
        if self.dy > 10: self.dy = 10
        self.rect.y += self.dy 
        if self.rect.y <= 0: self.rect.y = 0
        if self.rect.y + self.rect.height >= BOTTOM: 
            self.rect.y = BOTTOM - self.rect.height 
            self.dy = 0 
        
        if self.rect.left <= 0 and self.dx < 0: self.dx = 0 
        elif self.rect.right+self.rect.width >= WIDTH and self.dx > 0: self.dx = 0
        self.rect.x += self.dx 
        if pygame.time.get_ticks() % 100 == 0:
            args.debug(f"[player] x:{self.rect.x} y:{self.rect.y} dy:{self.dy}") 

    def draw(self, screen):
        pygame.draw.rect(screen, WHITE, self.rect)


class Box(object):
    def __init__(self):
        self.dx = 6 
        self.dy = 0 
        width = randint(60, 150)
        height = randint(250, 450)

        type = randint(0, 4) 
        h_pos = BOTTOM - height 
        if type == 2: h_pos = 0 
        elif type == 3: h_pos = randint(0, BOTTOM - height)
        elif type == 4: self.dy = randint(4, 9) 

        self.rect = pygame.Rect(WIDTH, h_pos, width, height) 
        args.debug(f'new box created. w:{width} h:{height} hpos:{h_pos} dy:{self.dy}')

    def update(self):
        self.rect.x -= self.dx
        self.rect.y -= self.dy
        if self.rect.bottom > BOTTOM or self.rect.top < 0:
            self.dy = -self.dy 

    def is_crashed(self, player):
      
        if (self.rect.left <= player.rect.right) and \
                (player.rect.right <= self.rect.right) and \
                (self.rect.top <= player.rect.bottom) and \
                (player.rect.top <= self.rect.bottom):
            return True
        return False

    def is_passed(self):
        if self.rect.right < 0:
            return True
        return False

    def draw(self, screen):
        pygame.draw.rect(screen, RED, self.rect)


class Background(object):
    def __init__(self):
        self.bottom = pygame.Rect(0, BOTTOM, WIDTH, HEIGHT - BOTTOM)

    def draw(self, screen):
        pygame.draw.rect(screen, GREEN, self.bottom)


class Game(object):
    def __init__(self):
        self.font = pygame.font.Font(rsc_path("resources\\DUNGGEUNMO.TTF"), 48)
        self.gameover_sound = pygame.mixer.Sound(rsc_path("resources\\gameover.mp3"))
        self.player = Player() 
        self.boxes = [Box(), ] 
        self.background = Background()
        self.next_box = 500 
        self.score = 0
        self.flag = None
        self.win = False
        self.died = False

    def run(self):
        self.player.update() 
        for box in self.boxes:
            box.update() 
            if box.is_crashed(self.player) == True:
                self.gameover_sound.play()
                args.debug(f"gameover. score:{self.score}")
                if self.score == WIN_SCORE:
                    self.win = True
                else:
                    self.died = True

        first_box = self.boxes[0]
        if first_box.is_passed() == True: 
            del self.boxes[0]
            self.score += 1

        if len(self.boxes) == 0:
           
            self.boxes.append(Box())
            self.next_box = randint(400,600)
        else:
          
            last_box = self.boxes[-1]
            if last_box.rect.x < self.next_box:
                self.boxes.append(Box())
                self.next_box = randint(350,600)

    def draw(self, screen):
        screen.fill(BLACK)
        self.background.draw(screen)
        self.player.draw(screen)
        for box in self.boxes:
            box.draw(screen)
        
        score_render = self.font.render(f"{self.score}", True, WHITE)
        screen.blit(score_render, (30,20))
        # WIN
        if self.win == True:
            if self.flag is None:
                self.flag = pygame.image.load(rsc_path('resources\\flag.png'))
            screen.blit(self.flag, (180,100))
        # YOU DIED 
        if self.died == True:
            pygame.draw.rect(screen, (44,44,44), (200,190,400,70))
            died_render = self.font.render("YOU DIED", True, RED)
            screen.blit(died_render, (300,200))

    def events(self):
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                return False
            if self.died != True and self.win != True:
               
                if event.type == pygame.KEYDOWN:
                   
                    if event.key == pygame.K_SPACE: self.player.jump()
                   
                    elif event.key == pygame.K_LEFT: self.player.dx = -self.player.speed
                    
                    elif event.key == pygame.K_RIGHT: self.player.dx = +self.player.speed
               
                elif event.type == pygame.KEYUP:
                    
                    if event.key == pygame.K_LEFT and self.player.dx < 0: self.player.dx = 0
                   
                    elif event.key == pygame.K_RIGHT and self.player.dx > 0: self.player.dx = 0
        return True


def rsc_path(relative_path):
   
    try:
        base_path = sys._MEIPASS
    except Exception:
        base_path = os.path.abspath(".")
    path = os.path.join(base_path, relative_path)
    args.debug(path)
    return path


def main():
   
    pygame.init()
    pygame.font.init()
    pygame.display.set_caption('YOU ARE JUMP STAR!')
    clock = pygame.time.Clock()
    screen = pygame.display.set_mode((WIDTH, HEIGHT))
    game = Game()
    args.debug("\nDebug mode on")

   
    running = True
    while running:
        running = game.events()
        if game.died != True and game.win != True:
            game.run()
        game.draw(screen) 
        pygame.display.flip() 
        clock.tick(FPS) 

    
    pygame.quit()


if __name__ == '__main__':
    main()