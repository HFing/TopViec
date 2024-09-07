package com.hfing.TopViec.domain.enums;

public enum Language {
    VIETNAM(1, "Vietnam"),
    ENGLISH(2, "English"),
    FRENCH(3, "French"),
    GERMAN(4, "German"),
    RUSSIAN(5, "Russian"),
    CHINESE(6, "Chinese"),
    KOREAN(7, "Korean"),
    JAPANESE(8, "Japanese"),
    OTHER(9, "Other");

    private final int value;
    private final String displayName;

    Language(int value, String displayName) {
        this.value = value;
        this.displayName = displayName;
    }

    public int getValue() {
        return value;
    }

    public String getDisplayName() {
        return displayName;
    }

    public static Language fromValue(int value) {
        for (Language language : Language.values()) {
            if (language.value == value) {
                return language;
            }
        }
        throw new IllegalArgumentException("Unknown language value: " + value);
    }
}
