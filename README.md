# Dummies

The main purpose of this repository is to provide the necessary software to run the technical tests on some dummies to ensure a solid foundation for the later Optical Communications Experiment which will be performed when TEIDESAT-I hits orbit.

The so-called "dummies" are a set of hardware devices that simulate the behavior of the actual payloads that will be used in the experiment, one as the  satellite (transmitter) and the other as the Optical Ground Station (receiver).

The dummies are equipped with a set of LEDs and photodiodes that can be controlled and monitored to simulate the transmission and reception of optical signals to analyze the performance of the optical communication system, test the communication protocols, and validate the overall system design.

To achieve this, we have developed a set of software tools that will allow us to test the dummies in a controlled environment. The software is designed to be modular and extensible, so that it can be easily adapted to different test scenarios.

The software is divided into the following components:
- [dummies-gui](https://github.com/Teidesat/dummies-gui): A graphical user interface (GUI) for controlling the dummies and visualizing the test results. It is built using FreeSimpleGUI and provides a user-friendly interface to set up and control the tests' execution.
- [dummies-server](https://github.com/Teidesat/dummies-server): A simple Flask server that provides an API interface for managing the communication between the GUI and the dummies' firmware.
- [dummies-firmware](https://github.com/Teidesat/dummies-firmware): The firmware that runs on the microcontrollers of the dummies to transcribe and send the experiment's payload into light signals at the transmitter side, and to receive and decode the light signals at the receiver side and send the data to the server.

## Usage
To use this software you need to follow these steps:

1. Prepare the hardware needed:
   - Host computers for running the GUI and the server (at least 1, but one for each dummy is recommended)
   - 2x ESP32 microcontrollers (one for each dummy) + 2x USB cables to transfer the firmware
   - LEDs (for the transmitter dummy and debugging purposes)
   - Photodiode (for the receiver dummy)
   - Resistors (for the LEDs and photodiode)
   - 2x breadboard and jumper wires to connect the components

   The hardware set up and wiring diagrams are further detailed in ... **#TODO**

2. Install Docker and Docker Compose to facilitate the installation of the dependencies. You can find the installation instructions for your operating system in the official [Docker documentation](https://docs.docker.com/engine/install/).
   
3. Clone this repository with all submodules to the host computer/s that will run the GUIs and servers, and will be used to flash the firmware into the ESP32 microcontrollers. You can do this by running the following command from each computer's terminal:

   ```bash
   git clone --recurse-submodules https://github.com/Teidesat/Dummies
   ```

4. Flash the firmware into the ESP32 microcontrollers. You can do this by running the following command from the root of the repository:

   **#TODO: Add instructions for flashing the firmware into the ESP32 microcontrollers**

5. Run the servers and GUIs on the host computer/s. Use the '--build' option to build the Docker images if you have made changes to the code or if you are running it for the first time. Otherwise, you can run the scripts without the '--build' option to use the pre-built images.

   - For the transmitter dummy: 

      ```bash
      ./launch-transmitter.sh [--build]
      ```

   - For the receiver dummy:

      ```bash
      ./launch-receiver.sh [--build]
      ```
