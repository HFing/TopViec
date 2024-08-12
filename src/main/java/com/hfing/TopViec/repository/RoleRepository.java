package com.hfing.TopViec.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hfing.TopViec.domain.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {

}
