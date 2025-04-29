package com.facu.deephaze.services;

import com.facu.deephaze.models.Genetica;
import com.facu.deephaze.repositories.GeneticaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class GeneticaService {

    private final GeneticaRepository geneticaRepository;

    @Autowired
    public GeneticaService(GeneticaRepository geneticaRepository) {
        this.geneticaRepository = geneticaRepository;
    }

    public List<Genetica> obtenerTodas() {
        return geneticaRepository.findAll();
    }

    public List<Genetica> obtenerActivas() {
        return geneticaRepository.findByActivaTrue();
    }

    public void guardarTodas(List<Genetica> geneticas) {
        geneticaRepository.saveAll(geneticas);
    }
}
