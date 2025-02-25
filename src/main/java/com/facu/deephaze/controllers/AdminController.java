package com.facu.deephaze.controllers;

import com.facu.deephaze.models.Pedido;
import com.facu.deephaze.services.PedidoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private PedidoService pedidoService;

    @GetMapping("/admin/pedidos")
    public String mostrarPedidosAdmin(Model model) {
        List<Pedido> pedidos = pedidoService.obtenerTodosLosPedidos();
        model.addAttribute("pedidos", pedidos);
        return "admin_list"; // Asegúrate de que el nombre del JSP sea correcto
    }

    // Método para eliminar un pedido
    @GetMapping("/admin/pedidos/borrar/{id}")
    public String borrarPedido(@PathVariable("id") Long id) {
        pedidoService.eliminarPedido(id); // Llama al servicio para borrar el pedido
        return "redirect:/admin/pedidos"; // Redirige a la lista de pedidos después de borrar
    }

    // Método para mostrar el formulario de edición (necesitarás crear este JSP)
    @GetMapping("/admin/pedidos/editar/{id}")
    public String mostrarFormularioEdicion(@PathVariable("id") Long id, Model model) {
        Pedido pedido = pedidoService.obtenerPedidoPorId(id); // Obtiene el pedido por ID
        model.addAttribute("pedido", pedido); // Agrega el pedido al modelo para el formulario
        model.addAttribute("saboresEmpanadas", new String[]{"Carne", "Pollo", "Queso"}); // Lista de sabores
        return "editar_pedido"; // Asegúrate de crear este JSP para editar el pedido
    }

    // Método para guardar los cambios del pedido editado
    @PostMapping("/admin/pedidos/guardar")
    public String guardarEdicion(Pedido pedido) {
        pedidoService.guardarPedido(pedido); // Guarda los cambios en el pedido
        return "redirect:/admin/pedidos"; // Redirige a la lista de pedidos después de guardar
    }
}
