package utp.edu.co.recepcion.service;

import java.util.List;

import utp.edu.co.recepcion.dto.UsuariosDTO;

public interface UsuarioService {
    
    UsuariosDTO consultar(Integer id);
    
    UsuariosDTO guardar(UsuariosDTO usu);
    
    boolean eliminar(Integer id);
    
    List<UsuariosDTO> listar();
}