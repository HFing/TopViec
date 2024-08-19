package com.hfing.TopViec.service.validator;

import org.springframework.stereotype.Service;
import com.hfing.TopViec.domain.dto.RegisterRecruiterDTO;
import com.hfing.TopViec.service.UserService;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

@Service
public class RegisterCheckedValidator implements ConstraintValidator<RegisterChecked, RegisterRecruiterDTO> {
    private final UserService userService;

    public RegisterCheckedValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterRecruiterDTO user, ConstraintValidatorContext context) {
        boolean valid = true;

        // Check if password fields match
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            context.buildConstraintViolationWithTemplate("Passwords do not match")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        // Additional validations can be added here
        // check email exist
        if (userService.checkEmailExist(user.getEmail())) {
            context.buildConstraintViolationWithTemplate("Email already exists")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }

        return valid;
    }
}