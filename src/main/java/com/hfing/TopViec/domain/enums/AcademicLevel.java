package com.hfing.TopViec.domain.enums;

public enum AcademicLevel {
    POSTGRADUATE(1, "Postgraduate"),
    UNIVERSITY(2, "University"),
    COLLEGE(3, "College"),
    INTERMEDIATE(4, "Intermediate"),
    HIGH_SCHOOL(5, "High School"),
    VOCATIONAL_CERTIFICATE(6, "Vocational Certificate");

    private final int value;
    private final String displayName;

    AcademicLevel(int value, String displayName) {
        this.value = value;
        this.displayName = displayName;
    }

    public int getValue() {
        return value;
    }

    public String getDisplayName() {
        return displayName;
    }

    public static AcademicLevel fromValue(int value) {
        for (AcademicLevel level : AcademicLevel.values()) {
            if (level.value == value) {
                return level;
            }
        }
        throw new IllegalArgumentException("Unknown academic level value: " + value);
    }
}
