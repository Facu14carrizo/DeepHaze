package com.facu.deephaze.models;

import java.util.HashMap;
import java.util.Map;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.MapKeyColumn;

@Entity
public class Pedido {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nombreCliente;
    private String whatsapp;

    @ElementCollection
    @CollectionTable(name = "pedido_genetica", joinColumns = @JoinColumn(name = "pedido_id"))
    @MapKeyColumn(name = "genetica_id")
    @Column(name = "cantidad")
    private Map<Long, Integer> geneticaCantidades = new HashMap<>();

    // Getters y Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getNombreCliente() { return nombreCliente; }
    public void setNombreCliente(String nombreCliente) { this.nombreCliente = nombreCliente; }
    public String getWhatsapp() { return whatsapp; }
    public void setWhatsapp(String whatsapp) { this.whatsapp = whatsapp; }
    public Map<Long, Integer> getGeneticaCantidades() { return geneticaCantidades; }
    public void setGeneticaCantidades(Map<Long, Integer> geneticaCantidades) { this.geneticaCantidades = geneticaCantidades; }
}
