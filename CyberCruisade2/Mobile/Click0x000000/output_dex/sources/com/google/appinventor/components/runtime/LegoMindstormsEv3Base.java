package com.google.appinventor.components.runtime;

import androidx.appcompat.R$styleable;
import com.google.appinventor.components.annotations.DesignerProperty;
import com.google.appinventor.components.annotations.PropertyCategory;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.annotations.SimpleProperty;
import com.google.appinventor.components.runtime.util.ErrorMessages;
import com.google.appinventor.components.runtime.util.Ev3BinaryParser;
import java.util.Collections;

@SimpleObject
/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class LegoMindstormsEv3Base extends AndroidNonvisibleComponent implements BluetoothConnectionListener, Component, Deleteable {
    private static final int TOY_ROBOT = 2052;
    protected BluetoothClient bluetooth;
    protected int commandCount;
    protected final String logTag;

    protected LegoMindstormsEv3Base(ComponentContainer container, String logTag) {
        super(container.$form());
        this.logTag = logTag;
    }

    protected LegoMindstormsEv3Base() {
        super(null);
        this.logTag = null;
    }

    @SimpleProperty(category = PropertyCategory.BEHAVIOR, description = "The BluetoothClient component that should be used for communication.")
    public BluetoothClient BluetoothClient() {
        return this.bluetooth;
    }

    @SimpleProperty
    @DesignerProperty(defaultValue = "", editorType = "BluetoothClient")
    public void BluetoothClient(BluetoothClient bluetoothClient) {
        BluetoothClient bluetoothClient2 = this.bluetooth;
        if (bluetoothClient2 != null) {
            bluetoothClient2.removeBluetoothConnectionListener(this);
            this.bluetooth.detachComponent(this);
            this.bluetooth = null;
        }
        if (bluetoothClient != null) {
            this.bluetooth = bluetoothClient;
            bluetoothClient.attachComponent(this, Collections.singleton(Integer.valueOf(TOY_ROBOT)));
            this.bluetooth.addBluetoothConnectionListener(this);
            if (this.bluetooth.IsConnected()) {
                afterConnect(this.bluetooth);
            }
        }
    }

    protected final boolean isBluetoothConnected(String functionName) {
        BluetoothClient bluetoothClient = this.bluetooth;
        if (bluetoothClient == null) {
            this.form.dispatchErrorOccurredEvent(this, functionName, ErrorMessages.ERROR_EV3_BLUETOOTH_NOT_SET, new Object[0]);
            return false;
        }
        if (!bluetoothClient.IsConnected()) {
            this.form.dispatchErrorOccurredEvent(this, functionName, ErrorMessages.ERROR_EV3_NOT_CONNECTED_TO_ROBOT, new Object[0]);
            return false;
        }
        return true;
    }

    protected final byte[] sendCommand(String functionName, byte[] command, boolean doReceiveReply) {
        if (!isBluetoothConnected(functionName)) {
            return null;
        }
        byte[] header = Ev3BinaryParser.pack("hh", Short.valueOf((short) (command.length + 2)), Short.valueOf((short) this.commandCount));
        this.commandCount++;
        this.bluetooth.write(functionName, header);
        this.bluetooth.write(functionName, command);
        if (!doReceiveReply) {
            return null;
        }
        byte[] header2 = this.bluetooth.read(functionName, 4);
        if (header2.length == 4) {
            Object[] decodedHeader = Ev3BinaryParser.unpack("hh", header2);
            int replySize = ((Short) decodedHeader[0]).shortValue() - 2;
            ((Short) decodedHeader[1]).shortValue();
            byte[] reply = this.bluetooth.read(functionName, replySize);
            if (reply.length == replySize) {
                return reply;
            }
            this.form.dispatchErrorOccurredEvent(this, functionName, ErrorMessages.ERROR_EV3_INVALID_REPLY, new Object[0]);
            return null;
        }
        this.form.dispatchErrorOccurredEvent(this, functionName, ErrorMessages.ERROR_EV3_INVALID_REPLY, new Object[0]);
        return null;
    }

    protected final int sensorPortLetterToPortNumber(String letter) {
        if (letter.length() != 1) {
            throw new IllegalArgumentException("String \"" + letter + "\" is not a valid sensor port letter");
        }
        int portNumber = letter.charAt(0) - '1';
        if (portNumber < 0 || portNumber > 3) {
            throw new IllegalArgumentException("String \"" + letter + "\" is not a valid sensor port letter");
        }
        return portNumber;
    }

    protected final String portNumberToSensorPortLetter(int portNumber) {
        if (portNumber < 0 || portNumber > 3) {
            throw new IllegalArgumentException(portNumber + " is not a valid port number");
        }
        return new StringBuilder().append(portNumber + 49).toString();
    }

    protected final int motorPortLettersToBitField(String letters) {
        if (letters.length() > 4) {
            throw new IllegalArgumentException("Malformed motor port letters \"" + letters + "\"");
        }
        int portABit = 0;
        int portBBit = 0;
        int portCBit = 0;
        int portDBit = 0;
        for (int i = 0; i < letters.length(); i++) {
            switch (letters.charAt(i)) {
                case R$styleable.AppCompatTheme_editTextBackground /* 65 */:
                    if (portABit != 0) {
                        throw new IllegalArgumentException("Malformed motor port letters \"" + letters + "\"");
                    }
                    portABit = 1;
                    break;
                case R$styleable.AppCompatTheme_imageButtonStyle /* 66 */:
                    if (portBBit != 0) {
                        throw new IllegalArgumentException("Malformed motor port letters \"" + letters + "\"");
                    }
                    portBBit = 2;
                    break;
                case R$styleable.AppCompatTheme_textAppearanceSearchResultTitle /* 67 */:
                    if (portCBit != 0) {
                        throw new IllegalArgumentException("Malformed motor port letters \"" + letters + "\"");
                    }
                    portCBit = 4;
                    break;
                case R$styleable.AppCompatTheme_textAppearanceSearchResultSubtitle /* 68 */:
                    if (portDBit != 0) {
                        throw new IllegalArgumentException("Malformed motor port letters \"" + letters + "\"");
                    }
                    portDBit = 8;
                    break;
                default:
                    throw new IllegalArgumentException("Malformed motor port letters \"" + letters + "\"");
            }
        }
        return portABit | portBBit | portCBit | portDBit;
    }

    protected final String bitFieldToMotorPortLetters(int bitField) {
        if (bitField < 0 || bitField > 15) {
            throw new IllegalArgumentException("Invalid bit field number " + bitField);
        }
        String portLetters = (bitField & 1) != 0 ? "A" : "";
        if ((bitField & 2) != 0) {
            portLetters = portLetters + "B";
        }
        if ((bitField & 4) != 0) {
            portLetters = portLetters + "C";
        }
        if ((bitField & 8) != 0) {
            return portLetters + "D";
        }
        return portLetters;
    }

    @Override // com.google.appinventor.components.runtime.BluetoothConnectionListener
    public void afterConnect(BluetoothConnectionBase bluetoothConnection) {
    }

    public void beforeDisconnect(BluetoothConnectionBase bluetoothConnection) {
    }

    public void onDelete() {
        BluetoothClient bluetoothClient = this.bluetooth;
        if (bluetoothClient != null) {
            bluetoothClient.removeBluetoothConnectionListener(this);
            this.bluetooth.detachComponent(this);
            this.bluetooth = null;
        }
    }
}
