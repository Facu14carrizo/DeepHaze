package com.facu.deephaze.controllers;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.facu.deephaze.models.Genetica;
import com.facu.deephaze.models.Pedido;
import com.facu.deephaze.services.GeneticaService;
import com.facu.deephaze.services.PedidoService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final PedidoService pedidoService;
    private final GeneticaService geneticaService;

    @Autowired
    public AdminController(PedidoService pedidoService, GeneticaService geneticaService) {
        this.pedidoService = pedidoService;
        this.geneticaService = geneticaService;
    }

    @GetMapping("/login")
    public String mostrarLogin() {
        return "admin_login";
    }
    
    @PostMapping("/login")
    public String procesarLogin(@RequestParam String clave, HttpSession session) {
    	// DEFINIR CLAVE ADMINISTRADOR
        if ("141414".equals(clave)) {
            session.setAttribute("autenticado", true);
            return "redirect:/admin/pedidos";
        }
        return "redirect:/admin/login?error";
    }

    @GetMapping("/pedidos")
    public String mostrarPanelAdmin(Model model, HttpSession session) {
        if (session.getAttribute("autenticado") == null) {
            return "redirect:/admin/login";
        }
        
        List<Genetica> geneticas = geneticaService.obtenerTodas();
        List<Pedido> pedidos = pedidoService.obtenerTodosLosPedidos();
        
        model.addAttribute("geneticas", geneticas);
        model.addAttribute("pedidos", pedidos);
        return "admin_list";
    }

    @PostMapping("/actualizar-geneticas")
    public String actualizarGeneticas(
        @RequestParam("id") List<Long> ids,
        @RequestParam("nombre") List<String> nombres,
        @RequestParam("precio") List<BigDecimal> precios,
        @RequestParam(value = "activa", required = false) List<Long> activas,
        RedirectAttributes redirectAttributes) {
        
        try {
            List<Genetica> geneticas = geneticaService.obtenerTodas();
            
            for (int i = 0; i < geneticas.size(); i++) {
                Genetica g = geneticas.get(i);
                g.setNombre(nombres.get(i));
                g.setPrecio(precios.get(i));
                g.setActiva(activas != null && activas.contains(g.getId()));
            }
            
            geneticaService.guardarTodas(geneticas);
            redirectAttributes.addFlashAttribute("success", "¡Configuración guardada exitosamente!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error al guardar los cambios");
        }
        return "redirect:/admin/pedidos";
    }


    @GetMapping("/pedidos/editar/{id}")
    public String mostrarFormularioEdicion(@PathVariable Long id, 
                                         Model model,
                                         RedirectAttributes redirectAttributes,
                                         HttpSession session) {
        if (session.getAttribute("autenticado") == null) {
            return "redirect:/admin/login";
        }
        
        try {
            Pedido pedido = pedidoService.obtenerPedidoPorId(id);
            if (pedido == null) {
                redirectAttributes.addFlashAttribute("error", "Pedido no encontrado");
                return "redirect:/admin/pedidos";
            }
            List<Genetica> geneticas = geneticaService.obtenerTodas();
            model.addAttribute("pedido", pedido);
            model.addAttribute("geneticas", geneticas);
            return "editar_pedido";
        } catch (DataAccessException e) {
            redirectAttributes.addFlashAttribute("error", "Error de acceso a datos");
            return "redirect:/admin/pedidos";
        }
    }

    @PostMapping("/pedidos/guardar")
    public String guardarPedidoEditado(@Valid @ModelAttribute("pedido") Pedido pedido,
                                     BindingResult result,
                                     RedirectAttributes redirectAttributes,
                                     HttpSession session) {
        if (session.getAttribute("autenticado") == null) {
            return "redirect:/admin/login";
        }
        
        if (result.hasErrors()) {
            redirectAttributes.addFlashAttribute("error", "Datos inválidos");
            return "redirect:/admin/pedidos/editar/" + pedido.getId();
        }
        
        try {
            // Filtrar genéticas con cantidad cero
            pedido.setGeneticaCantidades(pedido.getGeneticaCantidades().entrySet().stream()
                    .filter(entry -> entry.getValue() > 0)
                    .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue)));
            
            pedidoService.guardarPedido(pedido);
            redirectAttributes.addFlashAttribute("success", "Pedido actualizado correctamente");
        } catch (DataAccessException e) {
            redirectAttributes.addFlashAttribute("error", "Error al guardar en la base de datos");
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("error", "Datos proporcionados inválidos");
        }
        return "redirect:/admin/pedidos";
    }

    @GetMapping("/pedidos/borrar/{id}")
    public String eliminarPedido(@PathVariable Long id,
                               RedirectAttributes redirectAttributes,
                               HttpSession session) {
        if (session.getAttribute("autenticado") == null) {
            return "redirect:/admin/login";
        }
        
        try {
            pedidoService.eliminarPedido(id);
            redirectAttributes.addFlashAttribute("success", "Pedido eliminado correctamente");
        } catch (DataAccessException e) {
            redirectAttributes.addFlashAttribute("error", "Error de acceso a datos al eliminar");
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("error", "ID de pedido inválido");
        }
        return "redirect:/admin/pedidos";
    }
}
