#include <DHT.h>
#include <Servo.h>

Servo servo;

#define servoPin 4
#define DHTPIN 2
#define DHTTYPE DHT11

DHT dht(DHTPIN, DHTTYPE);


void setup() {
  Serial.begin(9600);
  servo.attach(servoPin);
  servo.write(2);
  Serial.println(F("DHT11 test!"));
  dht.begin();
}

void loop() {
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  float f = dht.readTemperature(true);

  if (isnan(h) || isnan(t) || isnan(f)) {
    Serial.println(F("Failed to read from DHT sensor!"));
    return;
  }

  float ratio = ((f-60)/30)*180;
  servo.write(ratio);

  float hif = dht.computeHeatIndex(f, h);
  float hic = dht.computeHeatIndex(t, h, false);

  Serial.print(F("Humidity="));
  Serial.print(h);
  Serial.print(F("%=Temperature="));
  Serial.print(t);
  Serial.print(F("°C="));
  Serial.print(f);
  Serial.print(F("°F=Heat index="));
  Serial.print(hic);
  Serial.print(F("°C="));
  Serial.print(hif);
  Serial.println(F("°F"));

  delay(5000);
  
}
