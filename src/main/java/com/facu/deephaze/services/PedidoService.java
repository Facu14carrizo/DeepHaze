package com.facu.deephaze.services;

import com.facu.deephaze.models.Pedido;
import com.facu.deephaze.repositories.PedidoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PedidoService {

    @Autowired
    private PedidoRepository pedidoRepository;

    // Método para guardar o actualizar un pedido
    public void guardarPedido(Pedido pedido) {
        pedidoRepository.save(pedido); // Guarda el pedido (crea o actualiza)
    }

    // Método para obtener todos los pedidos
    public List<Pedido> obtenerTodosLosPedidos() {
        return pedidoRepository.findAll();
    }

    // Método para obtener un pedido por su ID
    public Pedido obtenerPedidoPorId(Long id) {
        return pedidoRepository.findById(id).orElse(null); // Retorna el pedido o null si no se encuentra
    }

    // Método para eliminar un pedido por su ID
    public void eliminarPedido(Long id) {
        pedidoRepository.deleteById(id); // Elimina el pedido por ID
    }
}
