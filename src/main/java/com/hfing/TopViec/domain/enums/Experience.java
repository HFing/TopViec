package com.hfing.TopViec.domain.enums;

public enum Experience {
    NO_EXPERIENCE(1, "No Experience"),
    LESS_THAN_ONE_YEAR(2, "Less than 1 year"),
    ONE_YEAR(3, "1 year"),
    TWO_YEARS(4, "2 years"),
    THREE_YEARS(5, "3 years"),
    FOUR_YEARS(6, "4 years"),
    FIVE_YEARS(7, "5 years"),
    MORE_THAN_FIVE_YEARS(8, "More than 5 years");

    private final int value;
    private final String displayName;

    Experience(int value, String displayName) {
        this.value = value;
        this.displayName = displayName;
    }

    public int getValue() {
        return value;
    }

    public String getDisplayName() {
        return displayName;
    }

    public static Experience fromValue(int value) {
        for (Experience experience : Experience.values()) {
            if (experience.value == value) {
                return experience;
            }
        }
        throw new IllegalArgumentException("Unknown experience value: " + value);
    }
}
