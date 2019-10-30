package utp.edu.co.recepcion.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class UsuariosDTO {

    private Integer id;
    private String nombre;
    private Integer edad;
    private String cc;
}