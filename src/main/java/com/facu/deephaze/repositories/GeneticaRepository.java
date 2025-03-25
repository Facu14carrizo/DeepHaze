package com.facu.deephaze.repositories;

import com.facu.deephaze.models.Genetica;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface GeneticaRepository extends JpaRepository<Genetica, Long> {
    List<Genetica> findByActivaTrue();
}
