package com.jeffroush;

import java.awt.*;

public class Watcher {
    int lastX;
    int lastY;
    int sleepDurationInSeconds = 1;
    int notifyIntervalInMinutes = 1;
    int maxTickCount = sleepDurationInSeconds * 60 * notifyIntervalInMinutes;
    int currentTick = 0;
    boolean stillRunning = true;
    boolean currentlyActive = false;

    void loop() throws InterruptedException {
        while (stillRunning) {
            Thread.sleep(1000 * sleepDurationInSeconds);
            checkAndNotify();
        }
    }

    void checkAndNotify() {
        checkActivity();
        if (currentTick < maxTickCount) {
            currentTick++;
        } else {
            currentTick = 0;
            if (currentlyActive) {
                Notifier notifier = new Notifier();
                notifier.notifyActivity();
                currentlyActive = false;
            }
        }
    }

    boolean checkActivity() {
        Point location = MouseInfo.getPointerInfo().getLocation();
        if (location.x == lastX && location.y == lastY)
            return false;
        lastX = location.x;
        lastY = location.y;
        currentlyActive = true;
        return true;
    }
}
