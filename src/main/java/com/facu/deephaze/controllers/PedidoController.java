package com.facu.deephaze.controllers;

import com.facu.deephaze.models.Pedido;
import com.facu.deephaze.models.Genetica;
import com.facu.deephaze.services.PedidoService;
import com.facu.deephaze.services.GeneticaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class PedidoController {

    @Autowired
    private PedidoService pedidoService;

    @Autowired
    private GeneticaService geneticaService;

    @GetMapping("/")
    public String mostrarPaginaPrincipal() {
        return "inicio"; // Muestra la página principal (inicio.jsp)
    }

    @GetMapping("/pedir")
    public String mostrarFormularioPedido(Model model) {
        List<Genetica> geneticasActivas = geneticaService.obtenerActivas();
        model.addAttribute("geneticas", geneticasActivas);
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
