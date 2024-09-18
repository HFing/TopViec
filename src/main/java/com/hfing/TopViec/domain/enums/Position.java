package com.hfing.TopViec.domain.enums;

public enum Position {
    INTERN(1, "Intern"),
    FRESHER(2, "Fresher"),
    JUNIOR(3, "Junior"),
    SENIOR(4, "Senior"),
    LEAD(5, "Lead"),
    MANAGER(6, "Manager"),
    LEADER(7, "Leader"),
    DIRECTOR(8, "Director"),
    PRESIDENT(10, "President"),
    CEO(11, "CEO");

    private final int value;
    private final String displayName;

    Position(int value, String displayName) {
        this.value = value;
        this.displayName = displayName;
    }

    public int getValue() {
        return value;
    }

    public String getDisplayName() {
        return displayName;
    }

    public static Position fromValue(int value) {
        for (Position position : Position.values()) {
            if (position.value == value) {
                return position;
            }
        }
        throw new IllegalArgumentException("Unknown position value: " + value);
    }
}