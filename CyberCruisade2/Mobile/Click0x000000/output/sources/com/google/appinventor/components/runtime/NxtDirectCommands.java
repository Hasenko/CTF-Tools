package com.google.appinventor.components.runtime;

import android.util.Log;
import com.google.appinventor.components.annotations.DesignerComponent;
import com.google.appinventor.components.annotations.Options;
import com.google.appinventor.components.annotations.SimpleFunction;
import com.google.appinventor.components.annotations.SimpleObject;
import com.google.appinventor.components.common.ComponentCategory;
import com.google.appinventor.components.common.NxtMailbox;
import com.google.appinventor.components.common.NxtMotorMode;
import com.google.appinventor.components.common.NxtMotorPort;
import com.google.appinventor.components.common.NxtRegulationMode;
import com.google.appinventor.components.common.NxtRunState;
import com.google.appinventor.components.common.NxtSensorMode;
import com.google.appinventor.components.common.NxtSensorPort;
import com.google.appinventor.components.common.NxtSensorType;
import com.google.appinventor.components.runtime.util.ErrorMessages;
import com.google.appinventor.components.runtime.util.Ev3Constants;
import com.google.appinventor.components.runtime.util.YailList;
import gnu.kawa.servlet.HttpRequestContext;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import kawa.lang.SyntaxForms;

@DesignerComponent(category = ComponentCategory.LEGOMINDSTORMS, description = "A component that provides a low-level interface to a LEGO MINDSTORMS NXT robot, with functions to send NXT Direct Commands.", iconName = "images/legoMindstormsNxt.png", nonVisible = SyntaxForms.DEBUGGING, version = 2)
@SimpleObject
/* loaded from: classes.dex */
public class NxtDirectCommands extends LegoMindstormsNxtBase {
    public NxtDirectCommands(ComponentContainer container) {
        super(container, "NxtDirectCommands");
    }

    @SimpleFunction(description = "Start execution of a previously downloaded program on the robot.")
    public void StartProgram(String programName) {
        if (!checkBluetooth("StartProgram")) {
            return;
        }
        if (programName.length() == 0) {
            this.form.dispatchErrorOccurredEvent(this, "StartProgram", ErrorMessages.ERROR_NXT_INVALID_PROGRAM_NAME, new Object[0]);
            return;
        }
        if (programName.indexOf(".") == -1) {
            programName = programName + ".rxe";
        }
        byte[] command = new byte[22];
        command[0] = Byte.MIN_VALUE;
        command[1] = 0;
        copyStringValueToBytes(programName, command, 2, 19);
        sendCommand("StartProgram", command);
    }

    @SimpleFunction(description = "Stop execution of the currently running program on the robot.")
    public void StopProgram() {
        if (!checkBluetooth("StopProgram")) {
            return;
        }
        byte[] command = {Byte.MIN_VALUE, 1};
        sendCommand("StopProgram", command);
    }

    @SimpleFunction(description = "Play a sound file on the robot.")
    public void PlaySoundFile(String fileName) {
        if (!checkBluetooth("PlaySoundFile")) {
            return;
        }
        if (fileName.length() == 0) {
            this.form.dispatchErrorOccurredEvent(this, "PlaySoundFile", ErrorMessages.ERROR_NXT_INVALID_FILE_NAME, new Object[0]);
            return;
        }
        if (fileName.indexOf(".") == -1) {
            fileName = fileName + ".rso";
        }
        byte[] command = new byte[23];
        command[0] = Byte.MIN_VALUE;
        command[1] = 2;
        copyBooleanValueToBytes(false, command, 2);
        copyStringValueToBytes(fileName, command, 3, 19);
        sendCommand("PlaySoundFile", command);
    }

    @SimpleFunction(description = "Make the robot play a tone.")
    public void PlayTone(int frequencyHz, int durationMs) {
        if (!checkBluetooth("PlayTone")) {
            return;
        }
        if (frequencyHz < 200) {
            Log.w(this.logTag, "frequencyHz " + frequencyHz + " is invalid, using 200.");
            frequencyHz = HttpRequestContext.HTTP_OK;
        }
        if (frequencyHz > 14000) {
            Log.w(this.logTag, "frequencyHz " + frequencyHz + " is invalid, using 14000.");
            frequencyHz = 14000;
        }
        byte[] command = new byte[6];
        command[0] = Byte.MIN_VALUE;
        command[1] = 3;
        copyUWORDValueToBytes(frequencyHz, command, 2);
        copyUWORDValueToBytes(durationMs, command, 4);
        sendCommand("PlayTone", command);
    }

    @SimpleFunction(description = "Sets the output state of a motor on the robot.")
    public void SetOutputState(@Options(NxtMotorPort.class) String motorPortLetter, int power, @Options(NxtMotorMode.class) int mode, @Options(NxtRegulationMode.class) int regulationMode, int turnRatio, @Options(NxtRunState.class) int runState, long tachoLimit) {
        if (!checkBluetooth("SetOutputState")) {
            return;
        }
        NxtMotorPort port = NxtMotorPort.fromUnderlyingValue(motorPortLetter);
        if (port == null) {
            this.form.dispatchErrorOccurredEvent(this, "SetOutputState", ErrorMessages.ERROR_NXT_INVALID_MOTOR_PORT, motorPortLetter);
            return;
        }
        NxtMotorMode motorMode = NxtMotorMode.fromUnderlyingValue(Integer.valueOf(mode));
        if (motorMode == null) {
            this.form.dispatchErrorOccurredEvent(this, "SetOutputState", ErrorMessages.ERROR_NXT_INVALID_MOTOR_MODE, Integer.valueOf(mode));
            return;
        }
        NxtRegulationMode regMode = NxtRegulationMode.fromUnderlyingValue(Integer.valueOf(regulationMode));
        if (regMode == null) {
            this.form.dispatchErrorOccurredEvent(this, "SetOutputState", ErrorMessages.ERROR_NXT_INVALID_REGULATION_MODE, regMode);
        } else {
            NxtRunState state = NxtRunState.fromUnderlyingValue(Integer.valueOf(runState));
            setOutputState("SetOutputState", port, power, motorMode, regMode, turnRatio, state, tachoLimit);
        }
    }

    @SimpleFunction(description = "Configure an input sensor on the robot.")
    public void SetInputMode(@Options(NxtSensorPort.class) String sensorPortLetter, @Options(NxtSensorType.class) int sensorType, @Options(NxtSensorMode.class) int sensorMode) {
        if (!checkBluetooth("SetInputMode")) {
            return;
        }
        NxtSensorPort port = NxtSensorPort.fromUnderlyingValue(sensorPortLetter);
        if (port == null) {
            this.form.dispatchErrorOccurredEvent(this, "SetInputMode", ErrorMessages.ERROR_NXT_INVALID_SENSOR_PORT, sensorPortLetter);
            return;
        }
        NxtSensorType type = NxtSensorType.fromUnderlyingValue(Integer.valueOf(sensorType));
        if (type == null) {
            this.form.dispatchErrorOccurredEvent(this, "SetInputMode", ErrorMessages.ERROR_NXT_INVALID_SENSOR_TYPE, type);
            return;
        }
        NxtSensorMode mode = NxtSensorMode.fromUnderlyingValue(Integer.valueOf(sensorMode));
        if (mode == null) {
            this.form.dispatchErrorOccurredEvent(this, "SetInputMode", ErrorMessages.ERROR_NXT_INVALID_SENSOR_MODE, mode);
        } else {
            setInputMode("SetInputMode", port, type, mode);
        }
    }

    @SimpleFunction(description = "Reads the output state of a motor on the robot.")
    public List<Number> GetOutputState(@Options(NxtMotorPort.class) String motorPortLetter) {
        if (!checkBluetooth("GetOutputState")) {
            return new ArrayList();
        }
        NxtMotorPort port = NxtMotorPort.fromUnderlyingValue(motorPortLetter);
        if (port == null) {
            this.form.dispatchErrorOccurredEvent(this, "GetOutputState", ErrorMessages.ERROR_NXT_INVALID_MOTOR_PORT, motorPortLetter);
            return new ArrayList();
        }
        byte[] returnPackage = getOutputState("GetOutputState", port);
        if (returnPackage != null) {
            List<Number> outputState = new ArrayList<>();
            outputState.add(Integer.valueOf(getSBYTEValueFromBytes(returnPackage, 4)));
            outputState.add(Integer.valueOf(getUBYTEValueFromBytes(returnPackage, 5)));
            outputState.add(Integer.valueOf(getUBYTEValueFromBytes(returnPackage, 6)));
            outputState.add(Integer.valueOf(getSBYTEValueFromBytes(returnPackage, 7)));
            outputState.add(Integer.valueOf(getUBYTEValueFromBytes(returnPackage, 8)));
            outputState.add(Long.valueOf(getULONGValueFromBytes(returnPackage, 9)));
            outputState.add(Integer.valueOf(getSLONGValueFromBytes(returnPackage, 13)));
            outputState.add(Integer.valueOf(getSLONGValueFromBytes(returnPackage, 17)));
            outputState.add(Integer.valueOf(getSLONGValueFromBytes(returnPackage, 21)));
            return outputState;
        }
        return new ArrayList();
    }

    private byte[] getOutputState(String functionName, NxtMotorPort port) {
        byte[] command = {0, 6, 0};
        copyUBYTEValueToBytes(port.toInt().intValue(), command, 2);
        byte[] returnPackage = sendCommandAndReceiveReturnPackage(functionName, command);
        if (evaluateStatus(functionName, returnPackage, command[1])) {
            if (returnPackage.length == 25) {
                return returnPackage;
            }
            Log.w(this.logTag, functionName + ": unexpected return package length " + returnPackage.length + " (expected 25)");
            return null;
        }
        return null;
    }

    @SimpleFunction(description = "Reads the values of an input sensor on the robot. Assumes sensor type has been configured via SetInputMode.")
    public List<Object> GetInputValues(@Options(NxtSensorPort.class) String sensorPortLetter) {
        if (!checkBluetooth("GetInputValues")) {
            return new ArrayList();
        }
        NxtSensorPort port = NxtSensorPort.fromUnderlyingValue(sensorPortLetter);
        if (port == null) {
            this.form.dispatchErrorOccurredEvent(this, "GetInputValues", ErrorMessages.ERROR_NXT_INVALID_SENSOR_PORT, sensorPortLetter);
            return new ArrayList();
        }
        byte[] returnPackage = getInputValues("GetInputValues", port);
        if (returnPackage != null) {
            List<Object> inputValues = new ArrayList<>();
            inputValues.add(Boolean.valueOf(getBooleanValueFromBytes(returnPackage, 4)));
            inputValues.add(Boolean.valueOf(getBooleanValueFromBytes(returnPackage, 5)));
            inputValues.add(Integer.valueOf(getUBYTEValueFromBytes(returnPackage, 6)));
            inputValues.add(Integer.valueOf(getUBYTEValueFromBytes(returnPackage, 7)));
            inputValues.add(Integer.valueOf(getUWORDValueFromBytes(returnPackage, 8)));
            inputValues.add(Integer.valueOf(getUWORDValueFromBytes(returnPackage, 10)));
            inputValues.add(Integer.valueOf(getSWORDValueFromBytes(returnPackage, 12)));
            inputValues.add(Integer.valueOf(getSWORDValueFromBytes(returnPackage, 14)));
            return inputValues;
        }
        return new ArrayList();
    }

    @SimpleFunction(description = "Reset the scaled value of an input sensor on the robot.")
    public void ResetInputScaledValue(@Options(NxtSensorPort.class) String sensorPortLetter) {
        if (!checkBluetooth("ResetInputScaledValue")) {
            return;
        }
        NxtSensorPort port = NxtSensorPort.fromUnderlyingValue(sensorPortLetter);
        if (port == null) {
            this.form.dispatchErrorOccurredEvent(this, "ResetInputScaledValue", ErrorMessages.ERROR_NXT_INVALID_SENSOR_PORT, sensorPortLetter);
            return;
        }
        resetInputScaledValue("ResetInputScaledValue", port);
        byte[] command = {Byte.MIN_VALUE, 8, 0};
        copyUBYTEValueToBytes(port.toInt().intValue(), command, 2);
        sendCommand("ResetInputScaledValue", command);
    }

    @SimpleFunction(description = "Reset motor position.")
    public void ResetMotorPosition(@Options(NxtMotorPort.class) String motorPortLetter, boolean relative) {
        if (!checkBluetooth("ResetMotorPosition")) {
            return;
        }
        NxtMotorPort port = NxtMotorPort.fromUnderlyingValue(motorPortLetter);
        if (port == null) {
            this.form.dispatchErrorOccurredEvent(this, "ResetMotorPosition", ErrorMessages.ERROR_NXT_INVALID_MOTOR_PORT, motorPortLetter);
            return;
        }
        byte[] command = {Byte.MIN_VALUE, 10, 0, 0};
        copyUBYTEValueToBytes(port.toInt().intValue(), command, 2);
        copyBooleanValueToBytes(relative, command, 3);
        sendCommand("ResetMotorPosition", command);
    }

    @SimpleFunction(description = "Get the battery level for the robot. Returns the voltage in millivolts.")
    public int GetBatteryLevel() {
        if (!checkBluetooth("GetBatteryLevel")) {
            return 0;
        }
        byte[] command = {0, 11};
        byte[] returnPackage = sendCommandAndReceiveReturnPackage("GetBatteryLevel", command);
        if (evaluateStatus("GetBatteryLevel", returnPackage, command[1])) {
            if (returnPackage.length == 5) {
                return getUWORDValueFromBytes(returnPackage, 3);
            }
            Log.w(this.logTag, "GetBatteryLevel: unexpected return package length " + returnPackage.length + " (expected 5)");
        }
        return 0;
    }

    @SimpleFunction(description = "Stop sound playback.")
    public void StopSoundPlayback() {
        if (!checkBluetooth("StopSoundPlayback")) {
            return;
        }
        byte[] command = {Byte.MIN_VALUE, 12};
        sendCommand("StopSoundPlayback", command);
    }

    @SimpleFunction(description = "Keep Alive. Returns the current sleep time limit in milliseconds.")
    public long KeepAlive() {
        if (!checkBluetooth("KeepAlive")) {
            return 0L;
        }
        byte[] command = {0, 13};
        byte[] returnPackage = sendCommandAndReceiveReturnPackage("KeepAlive", command);
        if (evaluateStatus("KeepAlive", returnPackage, command[1])) {
            if (returnPackage.length == 7) {
                return getULONGValueFromBytes(returnPackage, 3);
            }
            Log.w(this.logTag, "KeepAlive: unexpected return package length " + returnPackage.length + " (expected 7)");
        }
        return 0L;
    }

    @SimpleFunction(description = "Returns the count of available bytes to read.")
    public int LsGetStatus(@Options(NxtSensorPort.class) String sensorPortLetter) {
        if (!checkBluetooth("LsGetStatus")) {
            return 0;
        }
        NxtSensorPort port = NxtSensorPort.fromUnderlyingValue(sensorPortLetter);
        if (port == null) {
            this.form.dispatchErrorOccurredEvent(this, "LsGetStatus", ErrorMessages.ERROR_NXT_INVALID_SENSOR_PORT, sensorPortLetter);
            return 0;
        }
        return lsGetStatus("LsGetStatus", port);
    }

    @SimpleFunction(description = "Writes low speed data to an input sensor on the robot. Assumes sensor type has been configured via SetInputMode.")
    public void LsWrite(@Options(NxtSensorPort.class) String sensorPortLetter, YailList list, int rxDataLength) {
        if (!checkBluetooth("LsWrite")) {
            return;
        }
        NxtSensorPort port = NxtSensorPort.fromUnderlyingValue(sensorPortLetter);
        if (port == null) {
            this.form.dispatchErrorOccurredEvent(this, "LsWrite", ErrorMessages.ERROR_NXT_INVALID_SENSOR_PORT, sensorPortLetter);
            return;
        }
        if (list.size() > 16) {
            this.form.dispatchErrorOccurredEvent(this, "LsWrite", ErrorMessages.ERROR_NXT_DATA_TOO_LARGE, new Object[0]);
            return;
        }
        Object[] array = list.toArray();
        byte[] bytes = new byte[array.length];
        for (int i = 0; i < array.length; i++) {
            Object element = array[i];
            String s = element.toString();
            try {
                int n = Integer.decode(s).intValue();
                bytes[i] = (byte) (n & 255);
                int n2 = n >> 8;
                if (n2 != 0 && n2 != -1) {
                    this.form.dispatchErrorOccurredEvent(this, "LsWrite", ErrorMessages.ERROR_NXT_COULD_NOT_FIT_ELEMENT_IN_BYTE, Integer.valueOf(i + 1));
                    return;
                }
            } catch (NumberFormatException e) {
                this.form.dispatchErrorOccurredEvent(this, "LsWrite", ErrorMessages.ERROR_NXT_COULD_NOT_DECODE_ELEMENT, Integer.valueOf(i + 1));
                return;
            }
        }
        lsWrite("LsWrite", port, bytes, rxDataLength);
    }

    @SimpleFunction(description = "Reads unsigned low speed data from an input sensor on the robot. Assumes sensor type has been configured via SetInputMode.")
    public List<Integer> LsRead(@Options(NxtSensorPort.class) String sensorPortLetter) {
        if (!checkBluetooth("LsRead")) {
            return new ArrayList();
        }
        NxtSensorPort port = NxtSensorPort.fromUnderlyingValue(sensorPortLetter);
        if (port == null) {
            this.form.dispatchErrorOccurredEvent(this, "LsRead", ErrorMessages.ERROR_NXT_INVALID_SENSOR_PORT, sensorPortLetter);
            return new ArrayList();
        }
        byte[] returnPackage = lsRead("LsRead", port);
        if (returnPackage != null) {
            List<Integer> list = new ArrayList<>();
            int count = getUBYTEValueFromBytes(returnPackage, 3);
            for (int i = 0; i < count; i++) {
                int n = returnPackage[i + 4] & Ev3Constants.Opcode.TST;
                list.add(Integer.valueOf(n));
            }
            return list;
        }
        return new ArrayList();
    }

    @SimpleFunction(description = "Get the name of currently running program on the robot.")
    public String GetCurrentProgramName() {
        if (!checkBluetooth("GetCurrentProgramName")) {
            return "";
        }
        byte[] command = {0, 17};
        byte[] returnPackage = sendCommandAndReceiveReturnPackage("GetCurrentProgramName", command);
        int status = getStatus("GetCurrentProgramName", returnPackage, command[1]);
        if (status == 0) {
            return getStringValueFromBytes(returnPackage, 3);
        }
        if (status == 236) {
            return "";
        }
        evaluateStatus("GetCurrentProgramName", returnPackage, command[1]);
        return "";
    }

    @SimpleFunction(description = "Read a message from a mailbox (1-10) on the robot.")
    public String MessageRead(@Options(NxtMailbox.class) int mailbox) {
        NxtMailbox box = NxtMailbox.fromUnderlyingValue(Integer.valueOf(mailbox));
        if (box == null) {
            this.form.dispatchErrorOccurredEvent(this, "MessageRead", ErrorMessages.ERROR_NXT_INVALID_MAILBOX, Integer.valueOf(mailbox));
            return "";
        }
        return MessageReadAbstract(box);
    }

    public String MessageReadAbstract(NxtMailbox mailbox) {
        int intMailbox = mailbox.toInt().intValue();
        if (!checkBluetooth("MessageRead")) {
            return "";
        }
        byte[] command = {0, 19, 0, 0, 0};
        copyUBYTEValueToBytes(0, command, 2);
        copyUBYTEValueToBytes(intMailbox, command, 3);
        copyBooleanValueToBytes(true, command, 4);
        byte[] returnPackage = sendCommandAndReceiveReturnPackage("MessageRead", command);
        if (evaluateStatus("MessageRead", returnPackage, command[1])) {
            if (returnPackage.length == 64) {
                int mailboxEcho = getUBYTEValueFromBytes(returnPackage, 3);
                if (mailboxEcho != intMailbox) {
                    Log.w(this.logTag, "MessageRead: unexpected return mailbox: Box" + mailboxEcho + " (expected " + intMailbox + ")");
                }
                int messageLength = getUBYTEValueFromBytes(returnPackage, 4) - 1;
                return getStringValueFromBytes(returnPackage, 5, messageLength);
            }
            Log.w(this.logTag, "MessageRead: unexpected return package length " + returnPackage.length + " (expected 64)");
        }
        return "";
    }

    @SimpleFunction(description = "Write a message to a mailbox (1-10) on the robot.")
    public void MessageWrite(@Options(NxtMailbox.class) int mailbox, String message) {
        NxtMailbox box = NxtMailbox.fromUnderlyingValue(Integer.valueOf(mailbox));
        if (box == null) {
            this.form.dispatchErrorOccurredEvent(this, "MessageWrite", ErrorMessages.ERROR_NXT_INVALID_MAILBOX, Integer.valueOf(mailbox));
        } else {
            MessageWriteAbstract(box, message);
        }
    }

    public void MessageWriteAbstract(NxtMailbox mailbox, String message) {
        if (!checkBluetooth("MessageWrite")) {
            return;
        }
        int messageLength = message.length();
        if (messageLength > 58) {
            this.form.dispatchErrorOccurredEvent(this, "MessageWrite", ErrorMessages.ERROR_NXT_MESSAGE_TOO_LONG, new Object[0]);
            return;
        }
        byte[] command = new byte[messageLength + 4 + 1];
        command[0] = Byte.MIN_VALUE;
        command[1] = 9;
        copyUBYTEValueToBytes(mailbox.toInt().intValue(), command, 2);
        copyUBYTEValueToBytes(messageLength + 1, command, 3);
        copyStringValueToBytes(message, command, 4, messageLength);
        sendCommand("MessageWrite", command);
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0065 A[Catch: all -> 0x00b3, DONT_GENERATE, TRY_ENTER, TRY_LEAVE, TryCatch #2 {all -> 0x00b3, blocks: (B:17:0x0036, B:28:0x0065, B:41:0x0099, B:49:0x00ae, B:50:0x00b2, B:20:0x0044, B:22:0x0050, B:25:0x0059, B:40:0x0091, B:45:0x00a4, B:46:0x00ac, B:47:0x005e), top: B:16:0x0036, outer: #0, inners: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x006c  */
    @com.google.appinventor.components.annotations.SimpleFunction(description = "Download a file to the robot.")
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void DownloadFile(java.lang.String r16, java.lang.String r17) {
        /*
            r15 = this;
            r1 = r15
            r2 = r17
            java.lang.String r3 = "DownloadFile"
            boolean r0 = r15.checkBluetooth(r3)
            if (r0 != 0) goto Lc
            return
        Lc:
            int r0 = r16.length()
            r4 = 0
            if (r0 != 0) goto L1d
            com.google.appinventor.components.runtime.Form r0 = r1.form
            r5 = 414(0x19e, float:5.8E-43)
            java.lang.Object[] r4 = new java.lang.Object[r4]
            r0.dispatchErrorOccurredEvent(r15, r3, r5, r4)
            return
        L1d:
            int r0 = r17.length()
            if (r0 != 0) goto L2d
            com.google.appinventor.components.runtime.Form r0 = r1.form
            r5 = 415(0x19f, float:5.82E-43)
            java.lang.Object[] r4 = new java.lang.Object[r4]
            r0.dispatchErrorOccurredEvent(r15, r3, r5, r4)
            return
        L2d:
            com.google.appinventor.components.runtime.Form r0 = r1.form     // Catch: java.io.IOException -> Lb9
            r5 = r16
            java.io.File r0 = com.google.appinventor.components.runtime.util.MediaUtil.copyMediaToTempFile(r0, r5)     // Catch: java.io.IOException -> Lb9
            r6 = r0
            java.io.BufferedInputStream r0 = new java.io.BufferedInputStream     // Catch: java.lang.Throwable -> Lb3
            com.google.appinventor.components.runtime.Form r7 = r1.form     // Catch: java.lang.Throwable -> Lb3
            java.io.FileInputStream r7 = com.google.appinventor.components.runtime.util.FileUtil.openFile(r7, r6)     // Catch: java.lang.Throwable -> Lb3
            r8 = 1024(0x400, float:1.435E-42)
            r0.<init>(r7, r8)     // Catch: java.lang.Throwable -> Lb3
            r7 = r0
            long r8 = r6.length()     // Catch: java.lang.Throwable -> Lad
            java.lang.String r0 = ".rxe"
            boolean r0 = r2.endsWith(r0)     // Catch: java.lang.Throwable -> Lad
            if (r0 != 0) goto L5e
            java.lang.String r0 = ".ric"
            boolean r0 = r2.endsWith(r0)     // Catch: java.lang.Throwable -> Lad
            if (r0 == 0) goto L59
            goto L5e
        L59:
            java.lang.Integer r0 = r15.openWrite(r3, r2, r8)     // Catch: java.lang.Throwable -> Lad
            goto L62
        L5e:
            java.lang.Integer r0 = r15.openWriteLinear(r3, r2, r8)     // Catch: java.lang.Throwable -> Lad
        L62:
            r10 = r0
            if (r10 != 0) goto L6c
            r7.close()     // Catch: java.lang.Throwable -> Lb3
            r6.delete()     // Catch: java.io.IOException -> Lb9
            return
        L6c:
            r0 = 32
            byte[] r0 = new byte[r0]     // Catch: java.lang.Throwable -> La3
            r11 = 0
        L72:
            int r13 = (r11 > r8 ? 1 : (r11 == r8 ? 0 : -1))
            if (r13 >= 0) goto L91
            r13 = 32
            long r4 = r8 - r11
            long r4 = java.lang.Math.min(r13, r4)     // Catch: java.lang.Throwable -> La3
            int r5 = (int) r4     // Catch: java.lang.Throwable -> La3
            r4 = 0
            r7.read(r0, r4, r5)     // Catch: java.lang.Throwable -> La3
            int r4 = r10.intValue()     // Catch: java.lang.Throwable -> La3
            int r4 = r15.writeChunk(r3, r4, r0, r5)     // Catch: java.lang.Throwable -> La3
            long r13 = (long) r4
            long r11 = r11 + r13
            r5 = r16
            r4 = 0
            goto L72
        L91:
            int r0 = r10.intValue()     // Catch: java.lang.Throwable -> Lad
            r15.closeHandle(r3, r0)     // Catch: java.lang.Throwable -> Lad
            r7.close()     // Catch: java.lang.Throwable -> Lb3
            r6.delete()     // Catch: java.io.IOException -> Lb9
            return
        La3:
            r0 = move-exception
            int r4 = r10.intValue()     // Catch: java.lang.Throwable -> Lad
            r15.closeHandle(r3, r4)     // Catch: java.lang.Throwable -> Lad
            throw r0     // Catch: java.lang.Throwable -> Lad
        Lad:
            r0 = move-exception
            r7.close()     // Catch: java.lang.Throwable -> Lb3
            throw r0     // Catch: java.lang.Throwable -> Lb3
        Lb3:
            r0 = move-exception
            r6.delete()     // Catch: java.io.IOException -> Lb9
            throw r0     // Catch: java.io.IOException -> Lb9
        Lb9:
            r0 = move-exception
            com.google.appinventor.components.runtime.Form r4 = r1.form
            r5 = 1
            java.lang.Object[] r5 = new java.lang.Object[r5]
            java.lang.String r6 = r0.getMessage()
            r7 = 0
            r5[r7] = r6
            r6 = 416(0x1a0, float:5.83E-43)
            r4.dispatchErrorOccurredEvent(r15, r3, r6, r5)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.appinventor.components.runtime.NxtDirectCommands.DownloadFile(java.lang.String, java.lang.String):void");
    }

    private Integer openWrite(String functionName, String fileName, long fileSize) {
        byte[] command = new byte[26];
        command[0] = 1;
        command[1] = -127;
        copyStringValueToBytes(fileName, command, 2, 19);
        copyULONGValueToBytes(fileSize, command, 22);
        byte[] returnPackage = sendCommandAndReceiveReturnPackage(functionName, command);
        if (evaluateStatus(functionName, returnPackage, command[1])) {
            if (returnPackage.length == 4) {
                return Integer.valueOf(getUBYTEValueFromBytes(returnPackage, 3));
            }
            Log.w(this.logTag, functionName + ": unexpected return package length " + returnPackage.length + " (expected 4)");
            return null;
        }
        return null;
    }

    private int writeChunk(String functionName, int handle, byte[] buffer, int length) throws IOException {
        if (length > 32) {
            throw new IllegalArgumentException("length must be <= 32");
        }
        byte[] command = new byte[length + 3];
        command[0] = 1;
        command[1] = Ev3Constants.Opcode.UI_BUTTON;
        copyUBYTEValueToBytes(handle, command, 2);
        System.arraycopy(buffer, 0, command, 3, length);
        byte[] returnPackage = sendCommandAndReceiveReturnPackage(functionName, command);
        if (evaluateStatus(functionName, returnPackage, command[1])) {
            if (returnPackage.length == 6) {
                int writtenLength = getUWORDValueFromBytes(returnPackage, 4);
                if (writtenLength != length) {
                    Log.e(this.logTag, functionName + ": only " + writtenLength + " bytes were written (expected " + length + ")");
                    throw new IOException("Unable to write file on robot");
                }
                return writtenLength;
            }
            Log.w(this.logTag, functionName + ": unexpected return package length " + returnPackage.length + " (expected 6)");
        }
        return 0;
    }

    private void closeHandle(String functionName, int handle) {
        byte[] command = {1, Ev3Constants.Opcode.UI_DRAW, 0};
        copyUBYTEValueToBytes(handle, command, 2);
        byte[] returnPackage = sendCommandAndReceiveReturnPackage(functionName, command);
        evaluateStatus(functionName, returnPackage, command[1]);
    }

    @SimpleFunction(description = "Delete a file on the robot.")
    public void DeleteFile(String fileName) {
        if (!checkBluetooth("DeleteFile")) {
            return;
        }
        if (fileName.length() == 0) {
            this.form.dispatchErrorOccurredEvent(this, "DeleteFile", ErrorMessages.ERROR_NXT_INVALID_FILE_NAME, new Object[0]);
            return;
        }
        byte[] command = new byte[22];
        command[0] = 1;
        command[1] = Ev3Constants.Opcode.TIMER_WAIT;
        copyStringValueToBytes(fileName, command, 2, 19);
        byte[] returnPackage = sendCommandAndReceiveReturnPackage("DeleteFile", command);
        evaluateStatus("DeleteFile", returnPackage, command[1]);
    }

    @SimpleFunction(description = "Returns a list containing the names of matching files found on the robot.")
    public List<String> ListFiles(String wildcard) {
        if (!checkBluetooth("ListFiles")) {
            return new ArrayList();
        }
        List<String> fileNames = new ArrayList<>();
        if (wildcard.length() == 0) {
            wildcard = "*.*";
        }
        byte[] command = new byte[22];
        command[0] = 1;
        command[1] = Ev3Constants.Opcode.TIMER_READY;
        copyStringValueToBytes(wildcard, command, 2, 19);
        byte[] returnPackage = sendCommandAndReceiveReturnPackage("ListFiles", command);
        int status = getStatus("ListFiles", returnPackage, command[1]);
        while (status == 0) {
            int handle = getUBYTEValueFromBytes(returnPackage, 3);
            String fileName = getStringValueFromBytes(returnPackage, 4);
            fileNames.add(fileName);
            byte[] command2 = {1, Ev3Constants.Opcode.TIMER_READ, 0};
            copyUBYTEValueToBytes(handle, command2, 2);
            returnPackage = sendCommandAndReceiveReturnPackage("ListFiles", command2);
            status = getStatus("ListFiles", returnPackage, command2[1]);
        }
        return fileNames;
    }

    @SimpleFunction(description = "Get the firmware and protocol version numbers for the robot as a list where the first element is the firmware version number and the second element is the protocol version number.")
    public List<String> GetFirmwareVersion() {
        if (!checkBluetooth("GetFirmwareVersion")) {
            return new ArrayList();
        }
        byte[] command = {1, Ev3Constants.Opcode.BP0};
        byte[] returnPackage = sendCommandAndReceiveReturnPackage("GetFirmwareVersion", command);
        if (evaluateStatus("GetFirmwareVersion", returnPackage, command[1])) {
            List<String> versions = new ArrayList<>();
            versions.add(((int) returnPackage[6]) + "." + ((int) returnPackage[5]));
            versions.add(((int) returnPackage[4]) + "." + ((int) returnPackage[3]));
            return versions;
        }
        return new ArrayList();
    }

    private Integer openWriteLinear(String functionName, String fileName, long fileSize) {
        byte[] command = new byte[26];
        command[0] = 1;
        command[1] = Ev3Constants.Opcode.BP1;
        copyStringValueToBytes(fileName, command, 2, 19);
        copyULONGValueToBytes(fileSize, command, 22);
        byte[] returnPackage = sendCommandAndReceiveReturnPackage(functionName, command);
        if (evaluateStatus(functionName, returnPackage, command[1])) {
            if (returnPackage.length == 4) {
                return Integer.valueOf(getUBYTEValueFromBytes(returnPackage, 3));
            }
            Log.w(this.logTag, functionName + ": unexpected return package length " + returnPackage.length + " (expected 4)");
            return null;
        }
        return null;
    }

    @SimpleFunction(description = "Set the brick name of the robot.")
    public void SetBrickName(String name) {
        if (!checkBluetooth("SetBrickName")) {
            return;
        }
        byte[] command = new byte[18];
        command[0] = 1;
        command[1] = -104;
        copyStringValueToBytes(name, command, 2, 15);
        byte[] returnPackage = sendCommandAndReceiveReturnPackage("SetBrickName", command);
        evaluateStatus("SetBrickName", returnPackage, command[1]);
    }

    @SimpleFunction(description = "Get the brick name of the robot.")
    public String GetBrickName() {
        if (!checkBluetooth("GetBrickName")) {
            return "";
        }
        byte[] command = {1, -101};
        byte[] returnPackage = sendCommandAndReceiveReturnPackage("GetBrickName", command);
        return evaluateStatus("GetBrickName", returnPackage, command[1]) ? getStringValueFromBytes(returnPackage, 3) : "";
    }
}
