package com.google.appinventor.components.runtime.util;

/* loaded from: /media/sf_CTF/CTF-Tools/CyberCruisade2/Mobile/Click0x000000/output/resources/classes.dex */
public class Synchronizer<T> {
    private Throwable error;
    private String errorMessage;
    private volatile boolean finished = false;
    private T result;

    public synchronized void waitfor() {
        while (!this.finished) {
            try {
                wait();
            } catch (InterruptedException e) {
            }
        }
    }

    public synchronized void wakeup(T result) {
        this.finished = true;
        this.result = result;
        notifyAll();
    }

    public synchronized void error(String error) {
        this.finished = true;
        this.errorMessage = error;
        notifyAll();
    }

    public synchronized void caught(Throwable error) {
        this.finished = true;
        this.error = error;
        notifyAll();
    }

    public T getResult() {
        return this.result;
    }

    public String getError() {
        return this.errorMessage;
    }

    public Throwable getThrowable() {
        return this.error;
    }

    public String toString() {
        return "Synchronizer(" + this.result + ", " + this.error + ", " + this.errorMessage + ")";
    }
}
