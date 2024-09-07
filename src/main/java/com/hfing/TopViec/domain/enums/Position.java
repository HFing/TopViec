package com.hfing.TopViec.domain.enums;

public enum Position {
    INTERN(1, "Intern"),
    FRESHER(2, "Fresher"),
    JUNIOR_DEVELOPER(3, "Junior Developer"),
    SENIOR_DEVELOPER(4, "Senior Developer"),
    LEAD_DEVELOPER(5, "Lead Developer"),
    MID_LEVEL_MANAGER(6, "Mid-level Manager"),
    SENIOR_LEADER(7, "Senior Leader");

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