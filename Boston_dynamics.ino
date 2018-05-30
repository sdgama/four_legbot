#include <Servo.h>
#include <math.h>

Servo myServo1;
Servo myServo2;
Servo myServo3;
Servo myServo4;
Servo myServo5;
Servo myServo6;
Servo myServo7;
Servo myServo8;
double angle1;
double angle2;
double angle3;
double angle4;
double angle5;
double angle6;
double angle7;
double angle8;
float t,t1,t2,t3;
int i = 1;
int j = 1;
int k = 1;
int l = 1;
int light = 1;
int led = 12;


void setup() {
  // put your setup code here, to run once:
  myServo7.attach(7);
  myServo8.attach(8);
  myServo1.attach(9);
  myServo2.attach(10);
  myServo3.attach(11);
  myServo4.attach(12);
  myServo5.attach(5);
  myServo6.attach(6);
  pinMode(led, OUTPUT);
  Serial.begin(9600);

  myServo1.write(90);
  myServo2.write(90);
  myServo3.write(90);
  myServo4.write(90);
  myServo5.write(90);
  myServo6.write(90);
  myServo7.write(90);
  myServo8.write(90);
  delay(2000);

}

void loop()
{
  
//LH & RF
  for (i = 1; i <= 40; i++)
  {
    t = 0.1 * i;
    angle1 = -1.0716 * t * t * t * t + 8.7613* t * t * t - 16.503* t * t - 10.866 * t + 95;
    angle2 = 1.8772 * t * t * t * t - 15.014 * t * t * t + 26.59 * t * t + 13.74 * t + 116.9;
    angle7 = 1.0716 * t * t * t * t - 8.7613* t * t * t + 16.503* t * t + 10.866 * t + 94;
    angle8 = -1.8772 * t * t * t * t + 15.014 * t * t* t - 26.59 * t * t - 13.74 * t + 63.102;
    myServo1.write(angle1);
    myServo2.write(angle2);
    myServo7.write(angle7);
    myServo8.write(angle8);
    delay(100);  
  }
  delay(500);

  //RH & LF
  for (k = 1; k <= 40; k++)
  {
    t = 0.1 * k;   
    angle3 = 1.0716 * t * t * t * t - 8.7613* t * t * t + 16.503* t * t + 10.866 * t + 95;
    angle4 = -1.8772 * t * t * t * t + 15.014 * t * t * t - 26.59 * t * t - 13.74 * t + 63.102;
    angle5 = -1.0716 * t * t * t * t + 8.7613* t * t * t - 16.503* t * t - 10.866 * t + 95;
    angle6 = 1.8772 * t * t * t * t - 15.014 * t * t * t + 26.59 * t * t + 13.74 * t + 116.9;      
    myServo3.write(angle3);
    myServo4.write(angle4);
    myServo5.write(angle5);
    myServo6.write(angle6);
    delay(100);
  }
  delay(500);
  
}

