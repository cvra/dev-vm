# Download and install MPLAB X

mplabx:
  cmd:
    - run
    - name: 'wget http://ww1.microchip.com/downloads/en/DeviceDoc/MPLABX-v2.20-linux-installer.sh && sudo sh MPLABX-v2.20-linux-installer.sh --nox11 -- --mode unattended'

# Download and install the MPLAB XC16 compiler

xc-16:
  cmd:
    - run
    - name: 'wget http://ww1.microchip.com/downloads/en/DeviceDoc/xc16-v1.21-linux-installer.run.tar && tar -xf xc16-v1.21-linux-installer.run.tar && sudo ./xc16-v1.21-linux-installer.run --mode unattended --netservername none'
