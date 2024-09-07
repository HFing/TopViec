package com.hfing.TopViec.domain.enums;

public enum TypeOfWorkplace {
    OFFICE(1, "Office"),
    HYBRID(2, "Hybrid"),
    REMOTE(3, "Remote");

    private final int value;
    private final String displayName;

    TypeOfWorkplace(int value, String displayName) {
        this.value = value;
        this.displayName = displayName;
    }

    public int getValue() {
        return value;
    }

    public String getDisplayName() {
        return displayName;
    }

    public static TypeOfWorkplace fromValue(int value) {
        for (TypeOfWorkplace type : TypeOfWorkplace.values()) {
            if (type.value == value) {
                return type;
            }
        }
        throw new IllegalArgumentException("Unknown type of workplace value: " + value);
    }
}
