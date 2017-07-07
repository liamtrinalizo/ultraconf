// projet main musc v3.2

int incomingByte = 0;
int buttonPushCounter = 0;   
int buttonState = 0;         
int lastButtonState = 1;     
boolean beginning = true;

const int  buttonPin = 2;    

void setup() {
  pinMode(buttonPin, INPUT);
  Serial.begin(9600);
}

void loop() {
  
  if (beginning) {
    printPins();
    beginning = false;
    Serial.println("");
    printHelp();
  }
  
  buttonState = digitalRead(buttonPin);
  if (buttonState != lastButtonState) {
    if (buttonState == HIGH) {
      buttonPushCounter++;
      Serial.println("-->");
      Serial.println(buttonPushCounter);

    } else {
      Serial.println("<--");
    }
    // Delay a little bit to avoid bouncing
    delay(10);
  }
  lastButtonState = buttonState;
  if (Serial.available() > 0) {
    incomingByte = Serial.read();
    if (incomingByte == 114) {
      buttonPushCounter = 0;
      Serial.println("Reset applied");
    }
    if (incomingByte == 104) {
      printHelp();
    }
  }
}

void printHelp() {
  Serial.println("Hello, welcome to your workout GOK.");
  Serial.println("Press \"r\" to reset the count.");
  Serial.println("Press \"h\" to display the help.");
  Serial.println("To exit press \"CTRL + A\" thet.");
  Serial.println("Press \"h\" to display the heln \"D\".");
  
}

void printPins() {
  Serial.println("                      +-----+");
  Serial.println("         +------------| USB |------------+");
  Serial.println("         |            +-----+            |");
  Serial.println("    B5   | [ ]D13/SCK        MISO/D12[ ] |   B4");
  Serial.println("         | [X]3.3V           MOSI/D11[ ] |   B3");
  Serial.println("         | [ ]V.ref     ___    SS/D10[ ] |   B2");
  Serial.println("    C0   | [ ]A0       / N \\       D9[ ] |   B1");
  Serial.println("    C1   | [ ]A1      /  A  \\      D8[ ] |   B0");
  Serial.println("    C2   | [ ]A2      \\  N  /      D7[ ] |   D7");
  Serial.println("    C3   | [ ]A3       \\_0_/       D6[ ] |   D6");
  Serial.println("    C4   | [ ]A4/SDA               D5[ ] |   D5");
  Serial.println("    C5   | [ ]A5/SCL               D4[ ] |   D4");
  Serial.println("         | [ ]A6              INT1/D3[ ] |   D3");
  Serial.println("         | [ ]A7              INT0/D2[X] |   D2");
  Serial.println("         | [ ]5V                  GND[X] |     ");
  Serial.println("    C6   | [ ]RST                 RST[ ] |   C6");
  Serial.println("         | [ ]GND   5V MOSI GND   RX0[ ] |   D0");
  Serial.println("         | [ ]Vin   [ ] [ ] [ ]   TX1[ ] |   D1");
  Serial.println("         |          [ ] [ ] [ ]          |");
  Serial.println("         |          MISO SCK RST         |");
  Serial.println("         | NANO-V3                       |");
  Serial.println("         +-------------------------------+");
}
