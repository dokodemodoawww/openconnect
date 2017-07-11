/**
 *
 */
package com.internousdev.openconnect.attendance.action;


import java.util.Timer;
import java.util.TimerTask;

public class timertest {
    private final Timer timer = new Timer();
    private final int minutes;
    public timertest(int minutes) {
        this.minutes = minutes;
    }
    public void start() {
        timer.schedule(new TimerTask() {
            public void run() {
                playSound();
                timer.cancel();
            }
            private void playSound() {
                System.out.println("Your egg is ready!");
                // Start a new thread to play a sound...
            }
        }, minutes * 60 * 1000);
    }
    public static void main(String[] args) {
        timertest eggTimer = new timertest(2);
        eggTimer.start();
    }
}