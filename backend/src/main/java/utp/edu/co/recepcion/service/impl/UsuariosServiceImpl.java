package utp.edu.co.recepcion.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import utp.edu.co.recepcion.dto.UsuariosDTO;
import utp.edu.co.recepcion.entity.Usuarios;
import utp.edu.co.recepcion.repository.UsuarioRepository;
import utp.edu.co.recepcion.service.UsuarioService;

@Service
public class UsuariosServiceImpl implements UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private ModelMapper mapper;

    @Override
    public UsuariosDTO consultar(Integer id) {
        Optional<Usuarios> usu = usuarioRepository.findById(id);

        if (usu.isPresent()) {
            return mapper.map(usu.get(), UsuariosDTO.class);
        }
        return null;
    }

    @Override
    public UsuariosDTO guardar(UsuariosDTO usu) {
        Usuarios res;
        res = usuarioRepository.save(mapper.map(usu, Usuarios.class));

        return mapper.map(res, UsuariosDTO.class);

    }

    @Override
    public boolean eliminar(Integer id) {
        UsuariosDTO usu = consultar(id);

        if (usu != null) {
            usuarioRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public List<UsuariosDTO> listar() {
        List<Usuarios> lista = usuarioRepository.findAll();
        List<UsuariosDTO> repuesta = new ArrayList<>();

        if (lista != null || !lista.isEmpty()) {
            for (Usuarios usu : lista) {
                repuesta.add(mapper.map(usu, UsuariosDTO.class));
            }

            return repuesta;
        }
        return null;
    }

}