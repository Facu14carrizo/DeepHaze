package com.facu.deephaze.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.facu.deephaze.models.Pedido;
import com.facu.deephaze.services.PedidoService;

@Controller
public class PedidoController {

    @Autowired
    private PedidoService pedidoService;

    @GetMapping("/")
    public String mostrarPaginaPrincipal() {
        return "inicio"; // Muestra la página principal (inicio.jsp)
    }

    @GetMapping("/pedir")
    public String mostrarFormularioPedido(Model model) {
        model.addAttribute("pedido", new Pedido());
        model.addAttribute("saboresEmpanadas", new String[]{"Carne", "Pollo", "Queso"});
        return "pedir"; // Muestra el formulario de pedido (pedir.jsp)
    }

    @PostMapping("/confirmar")
    public String guardarPedido(@ModelAttribute Pedido pedido) {
        pedidoService.guardarPedido(pedido);
        return "redirect:/confirmacion"; // Redirige a la página de confirmación (confirmacion.jsp)
    }

    @GetMapping("/confirmacion")
    public String mostrarConfirmacionPedido() {
        return "confirmacion"; // Muestra la página de confirmación (confirmacion.jsp)
    }
}
