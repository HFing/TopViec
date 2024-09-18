package com.hfing.TopViec.domain.enums;

public enum JobType {
    FULL_TIME(1, "Full time"),
    PART_TIME(2, "Part time"),
    CONTRACT(3, "Contract"),
    INTERN(4, "Intern");

    private final int value;
    private final String displayName;

    JobType(int value, String displayName) {
        this.value = value;
        this.displayName = displayName;
    }

    public int getValue() {
        return value;
    }

    public String getDisplayName() {
        return displayName;
    }

    public static JobType fromValue(int value) {
        for (JobType type : JobType.values()) {
            if (type.value == value) {
                return type;
            }
        }
        throw new IllegalArgumentException("Unknown job type value: " + value);
    }
}
