#include <Arduino.h>
#include <NewEEPROM.h>
#include <NetEEPROM.h>
#include <Ethernet.h>
#include <EthernetServer.h>
#include <SPI.h>
#include <dht.h>
#include <EthernetReset.h>
int Soil_MoistureAssignment (int soilPin);
void Soil_MoisturePrint (EthernetClient client, String label, int soil);
int DHT11Assignment (int DHT11_PIN);
void DHT11Print(EthernetClient client, String label, int DHT);
float LM35Assignment (int LM35);
void LM35Print (EthernetClient client, String label, float dataLM35);
void setup();
void loop();
#line 1 "src/sketch.ino"
//#include <NewEEPROM.h>
//#include <NetEEPROM.h>
//#include <Ethernet.h>
//#include <EthernetServer.h>
//#include <SPI.h>
//#include <dht.h>
//#include <EthernetReset.h>

byte mac[] = {
  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED
};
IPAddress ip(192, 168, 88, 88);
EthernetServer server(177);
EthernetReset reset(8989);
String label;

//============================================================
int Soil_MoistureAssignment (int soilPin) {
  int soil = 0;
  int s = analogRead(soilPin);
  s = constrain(s, 485, 1023);
  soil = map(s, 485, 1023, 100, 0);
  return soil;
}

void Soil_MoisturePrint (EthernetClient client, String label, int soil) {
  client.print(",\"");
  client.print (label);
  client.print ("\":\"");
  client.print(soil);
  client.print("\"");
}
//============================================================

//============================================================
int DHT11Assignment (int DHT11_PIN) {
  dht DHT;
  DHT.read11(DHT11_PIN);
  return DHT.humidity;
}

void DHT11Print(EthernetClient client, String label, int DHT) {
  client.print(",\"");
  client.print(label);
  client.print(" Humidity");
  client.print ("\":\"");
  client.print(DHT);
  client.print("\"");
}
//============================================================

//============================================================
float LM35Assignment (int LM35) {
  float dataLM35;
  dataLM35 = analogRead(LM35);
  dataLM35 = dataLM35 * 0.48828125;
  return dataLM35;
}

void LM35Print (EthernetClient client, String label, float dataLM35) {
  client.print(",\"");
  client.print(label);
  client.print ("\":\"");
  client.print(dataLM35);
  client.print("\"");
}

//============================================================

char token[ ] = "e950bf953b67343cbff0";
int pinAktuator = 8;
int statusAktuator = 0;

int sensor_kelembaban_tanah;
float sensor_suhu;

void setup(){
Ethernet.begin(mac, ip);
server.begin();
reset.begin();
pinMode(pinAktuator,OUTPUT);
}

void loop(){
sensor_suhu = LM35Assignment (A2);
sensor_kelembaban_tanah = Soil_MoistureAssignment (A3);
 if ((sensor_kelembaban_tanah < 50 ) && statusAktuator == 0) {
    digitalWrite(pinAktuator, HIGH);
    statusAktuator = 1;
  }
  if (!(sensor_kelembaban_tanah < 50 ) && statusAktuator == 1 ) {
    statusAktuator = 0;
    digitalWrite(pinAktuator, LOW);
  }
  
  
reset.check();
EthernetClient client = server.available();
  if (client) {
    boolean currentLineIsBlank = true;
    while (client.connected()) {
      if (client.available()) {
        char c = client.read();
        
        if (c == '\n' && currentLineIsBlank) {
          // send a standard http response header
          client.println("HTTP/1.1 200 OK");
          client.println("Content-Type: application/json;charset=utf-8");
          client.println("Server: Arduino");
          client.println("Connnection: close");
          client.println();
          client.print("{\"location\":\"");
          client.print(Ethernet.localIP());
          client.print("\"");
client.print(",\"Token\":\"");
client.print(token);
client.print("\"");
client.print(",\"Status Aktuator\":\"");
client.print(statusAktuator);
client.print("\"");
Soil_MoisturePrint(client,"sensor_kelembaban_tanah",sensor_kelembaban_tanah);
LM35Print(client,"sensor_suhu",sensor_suhu);
 client.print("}");
          client.println();
          break;
        }
        if (c == '\n') {
          currentLineIsBlank = true;
        }
        else if (c != '\r') {
          currentLineIsBlank = false;
        }
      }
    }
    delay(1);
    client.stop();
    Serial.println("client disconnected");
  }
}
