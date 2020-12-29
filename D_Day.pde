//import stuff if needed
//import processing.sound.*;
//variables at the top - so we don't lose them on the go
int leftPaddleY=200;
int rightPaddleY=200;
int ballX=500;
int ballY=300;
int ballxv = 3;
int ballyv = 3;
int paddlev = 3;
int lpScore =0;
int rpScore =0;
//SoundFile gameover,paddle,wall;
int gameState = 0;
//initial gamestate is 0. 
//gamestate will change to 1 when someone clicks the screen
//gamestate will change to 2 when game has ended. So when the game is in 
//gamestate 3, it is waiting to be put into gamestate 1 again.

//setup - to set up the project once and for all
void setup()
{
 size(1000,600);
 //gameover = new SoundFile(this,"gameover.wav");
 //paddle = new SoundFile(this,"paddle.wav");
 //wall = new SoundFile(this,"wall.wav") ;
}

//let's start cracking in the draw function!
void draw()
{ 
  if(gameState ==0)
  {
    background(#000000);
    //drawing the ball
    fill(#FFAB2C);
    ellipse(ballX,ballY,50,50);
  
  
    //drawing the left and right paddle
    fill(#FF58E9);
    rect(100,leftPaddleY,25,200);
    rect(875,rightPaddleY,25,200);
    
    if(mousePressed)
    {
      gameState =1;//now the game can run if mouse is pressed  
    }
    
  } 
  else if(gameState==1)
  {
  background(#000000);
  //drawing the ball
  fill(#FFAB2C);
  ellipse(ballX,ballY,50,50);
  
  
  //drawing the left and right paddle
  fill(#FF58E9);
  rect(100,leftPaddleY,25,200);
  rect(875,rightPaddleY,25,200);
  

  //moving the ball
  ballX = ballX + ballxv  ;
  ballY = ballY + ballyv  ;

  // collision conditions of ball
  if(ballY-25 <=0   ||    ballY+25>=600)
  {
    ballyv = ballyv*-1;
//wall.play();
  }
  if(ballX-25<=0 || ballX+25>=1000)
  {
    
    if(ballX-25<=0)
    {
      rpScore++;
    }
    else
    {
      lpScore++;
    }
    //wall.play();
    ballX=500;
    ballY=300;
  }

 
  
  //moving paddles
  //rightPaddleY = rightPaddleY-paddlev;
  //leftPaddleY = leftPaddleY+paddlev;
  if(keyPressed)
  {
    if(key=='w'  || key == 'W'    )
      {
        leftPaddleY = leftPaddleY - paddlev;
      }
    else if(key=='s'  || key == 'S'    )
      {
        leftPaddleY = leftPaddleY + paddlev;
      }
    else if(keyCode== LEFT)
      {
        rightPaddleY = rightPaddleY - paddlev;//up
      }
    else if(keyCode == RIGHT  )
      {
        rightPaddleY = rightPaddleY + paddlev;//down
      }
  
  }

  //paddle going out of screen
  //left paddle
  if(leftPaddleY<=0)
  {
    leftPaddleY = 0;
  }
  if(leftPaddleY>=400)
  {
    leftPaddleY = 400;
  }
  
  //right paddle
  if(rightPaddleY<=0)
  {
    rightPaddleY = 0;
  }
  if(rightPaddleY>=400)
  {
    rightPaddleY = 400;
  }
  
  
  //setting up score text
  fill(#FEFF00);
  textSize(100);
  text(lpScore,400,100);
  text(rpScore,500,100);
  
  textSize(50);
  text(":",472,80);
  
  
  //paddle collisions with ball
  //left paddle
  if(ballX-25<=120  && ballY-25>leftPaddleY && ballY+25<leftPaddleY+200)//lpc
  {
    ballxv = ballxv*-1; 
    //paddle.play();
  }
   //right paddle
  if(ballX+25>=880  && ballY-25>rightPaddleY && ballY+25<rightPaddleY+200)//lpc
  {
    ballxv = ballxv*-1; 
    //paddle.play();
  }
  
  
  //game over conditions
  //left wins
  if(lpScore==5)
  {
    background(#000000);
    textAlign(CENTER);
    textSize(80);
    text("***LEFT WINS!***",500,300);
    //gameover.loop();
    
    gameState=3; //when game is over, chage state to 3 i.e, paused state
    
  }
  //right wins
  if(rpScore==5)
  {
    background(#000000);
    textAlign(CENTER);
    textSize(80);
    text("***RIGHT WINS!***",500,300);
    //gameover.loop();
    gameState=3;//when game is over, chage state to 3 i.e, paused state
    
    
    
  }    
    
  }
  
  else if(gameState ==3)
  {
    leftPaddleY=200;
    rightPaddleY=200;
    ballX=500;
    ballY=300;
    ballxv = 3;
    ballyv = 3;
    paddlev = 3;
    lpScore =0;
    rpScore =0;
    if(mousePressed)
    {
      gameState=1;
    }
  
  }

  
  
  
}
