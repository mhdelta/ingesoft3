package utp.edu.co.recepcion.web;

import java.util.List;
import javax.persistence.PostLoad;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import utp.edu.co.recepcion.dto.UsuariosDTO;
import utp.edu.co.recepcion.service.UsuarioService;

/**
 *
 * @author jhon
 */
@RestController
@RequestMapping("usuarios")
public class UsuariosController {

    @Autowired
    private UsuarioService usuarioService;

    public UsuariosController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    @GetMapping("/listar")
    public ResponseEntity<?> listar() {
        List<UsuariosDTO> res = usuarioService.listar();

        if (res == null || res.isEmpty()) {
            return ResponseEntity.noContent().build();
        }

        return ResponseEntity.ok(res);
    }

    @PostMapping("crearUsuario")
    public ResponseEntity<?> crear(@RequestBody UsuariosDTO usuario) {

        UsuariosDTO res = usuarioService.guardar(usuario);

        return ResponseEntity.ok(res);
    }

    @DeleteMapping("eliminar/{id}")
    public ResponseEntity<?> eliminar(@PathVariable("id") Integer id) {

        boolean res = usuarioService.eliminar(id);

        if (res == false) {
            return ResponseEntity.badRequest().build();
        }

        return ResponseEntity.ok(res);
    }
}